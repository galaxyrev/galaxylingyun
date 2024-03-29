package com.galaxy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.galaxy.entity.Role;
import com.galaxy.model.dto.ConditionDTO;
import com.galaxy.model.dto.RoleDTO;
import com.galaxy.model.dto.RoleStatusDTO;
import com.galaxy.model.vo.PageResult;
import com.galaxy.model.vo.RoleVO;

import java.util.List;

/**
 * 角色业务接口
 *
 * @author galaxy
 * @date 2022/12/07 09:38
 **/
public interface RoleService extends IService<Role> {

    /**
     * 查看角色列表
     *
     * @param condition 查询条件
     * @return 角色列表
     */
    PageResult<RoleVO> listRoleVO(ConditionDTO condition);

    /**
     * 添加角色
     *
     * @param role 角色信息
     */
    void addRole(RoleDTO role);

    /**
     * 删除角色
     *
     * @param roleIdList 角色id集合
     */
    void deleteRole(List<String> roleIdList);

    /**
     * 修改角色
     *
     * @param role 角色信息
     */
    void updateRole(RoleDTO role);

    /**
     * 修改角色状态
     *
     * @param roleStatus 角色状态
     */
    void updateRoleStatus(RoleStatusDTO roleStatus);

    /**
     * 查看角色的菜单权限
     *
     * @param roleId 角色id
     * @return 角色的菜单权限
     */
    List<Integer> listRoleMenuTree(String roleId);
}
