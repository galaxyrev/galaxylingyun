package com.galaxy.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.captcha.generator.RandomGenerator;
import cn.hutool.core.lang.Assert;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.galaxy.entity.SiteConfig;
import com.galaxy.entity.User;
import com.galaxy.entity.UserRole;
import com.galaxy.enums.LoginTypeEnum;
import com.galaxy.mapper.UserMapper;
import com.galaxy.mapper.UserRoleMapper;
import com.galaxy.model.dto.GitDTO;
import com.galaxy.model.dto.LoginDTO;
import com.galaxy.model.dto.MailDTO;
import com.galaxy.model.dto.RegisterDTO;
import com.galaxy.service.LoginService;
import com.galaxy.service.RedisService;
import com.galaxy.strategy.context.SocialLoginStrategyContext;
import com.galaxy.utils.SecurityUtils;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.TimeUnit;

import static com.galaxy.constant.CommonConstant.*;
import static com.galaxy.constant.MqConstant.EMAIL_EXCHANGE;
import static com.galaxy.constant.MqConstant.EMAIL_SIMPLE_KEY;
import static com.galaxy.constant.RedisConstant.*;
import static com.galaxy.enums.LoginTypeEnum.EMAIL;
import static com.galaxy.enums.RoleEnum.USER;
import static com.galaxy.utils.CommonUtils.checkEmail;

/**
 * 登录业务接口实现类
 *
 * @author galaxy
 * @date 2022/12/04 11:24
 **/
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private RedisService redisService;

    @Autowired
    private SocialLoginStrategyContext socialLoginStrategyContext;

    @Override
    public String login(LoginDTO login) {
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getId)
                .eq(User::getUsername, login.getUsername())
                .eq(User::getPassword, SecurityUtils.sha256Encrypt(login.getPassword())));
        Assert.notNull(user, "用户不存在或密码错误");
        // 校验指定账号是否已被封禁，如果被封禁则抛出异常 `DisableServiceException`
        StpUtil.checkDisable(user.getId());
        // 通过校验后，再进行登录
        StpUtil.login(user.getId());
        return StpUtil.getTokenValue();
    }

    @Override
    public void sendCode(String username) {
        Assert.isTrue(checkEmail(username), "请输入正确的邮箱！");
        RandomGenerator randomGenerator = new RandomGenerator("0123456789", 6);
        String code = randomGenerator.generate();
        MailDTO mailDTO = MailDTO.builder()
                .toEmail(username)
                .subject(CAPTCHA)
                .content("您的验证码为 " + code + " 有效期为" + CODE_EXPIRE_TIME + "分钟")
                .build();
        // 验证码存入消息队列
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_SIMPLE_KEY, mailDTO);
        // 验证码存入redis
        redisService.setObject(CODE_KEY + username, code, CODE_EXPIRE_TIME, TimeUnit.MINUTES);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void register(RegisterDTO register) {
        verifyCode(register.getUsername(), register.getCode());
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getUsername)
                .eq(User::getUsername, register.getUsername()));
        Assert.isNull(user, "邮箱已注册！");
        SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
        // 添加用户
        User newUser = User.builder()
                .username(register.getUsername())
                .email(register.getUsername())
                .nickname(USER_NICKNAME + IdWorker.getId())
                .avatar(siteConfig.getUserAvatar())
                .password(SecurityUtils.sha256Encrypt(register.getPassword()))
                .loginType(EMAIL.getLoginType())
                .isDisable(FALSE)
                .build();
        userMapper.insert(newUser);
        // 绑定用户角色
        UserRole userRole = UserRole.builder()
                .userId(newUser.getId())
                .roleId(USER.getRoleId())
                .build();
        userRoleMapper.insert(userRole);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String giteeLogin(GitDTO data) {
        return socialLoginStrategyContext.executeLoginStrategy(JSON.toJSONString(data), LoginTypeEnum.GITEE);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String githubLogin(GitDTO data) {
        return socialLoginStrategyContext.executeLoginStrategy(JSON.toJSONString(data), LoginTypeEnum.GITHUB);
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code     验证码
     */
    public void verifyCode(String username, String code) {
        String sysCode = redisService.getObject(CODE_KEY + username);
        Assert.notBlank(sysCode, "验证码未发送或已过期！");
        Assert.isTrue(sysCode.equals(code), "验证码错误，请重新输入！");
    }

}