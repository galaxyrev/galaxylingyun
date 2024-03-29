package com.galaxy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.galaxy.entity.Friend;
import com.galaxy.model.dto.ConditionDTO;
import com.galaxy.model.dto.FriendDTO;
import com.galaxy.model.vo.FriendBackVO;
import com.galaxy.model.vo.FriendVO;
import com.galaxy.model.vo.PageResult;

import java.util.List;

/**
 * 友链业务接口
 *
 * @author galaxy
 */
public interface FriendService extends IService<Friend> {

    /**
     * 查看友链列表
     *
     * @return 友链列表
     */
    List<FriendVO> listFriendVO();

    /**
     * 查看后台友链列表
     *
     * @param condition 查询条件
     * @return 后台友链列表
     */
    PageResult<FriendBackVO> listFriendBackVO(ConditionDTO condition);

    /**
     * 添加友链
     *
     * @param friend 友链
     */
    void addFriend(FriendDTO friend);

    /**
     * 修改友链
     *
     * @param friend 友链
     */
    void updateFriend(FriendDTO friend);
}
