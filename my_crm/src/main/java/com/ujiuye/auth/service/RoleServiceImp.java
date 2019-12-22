package com.ujiuye.auth.service;

import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.mapper.RoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class RoleServiceImp implements RoleService {

    @Resource
    RoleMapper dao;

    //查询全部的角色
    public List<Role> getAllRole() {
        return dao.getAllRole();
    }

    //根据主键查询单个角色
    public Role getRoleById(int roleid) {
        return dao.getRoleById(roleid);
    }

    //根据主键修改单个角色的权限(先删除全部权限，再添加权限)
    public void updateRole(Role role, int[] source) {
        //更新角色的属性
        dao.updateRole(role);
        //删除角色的全部权限
        dao.deleteRole(role);
        //重新添加角色的权限
        dao.insertRole(role,source);
    }

    //添加角色
    public boolean addRole(Role role, int[] source) {
        //添加角色(只添加基本信息，不包括权限)，并返回role的主键roleid，添加新角色的权限需要用roleid
        dao.addRole(role);
        //添加新角色的权限(添加中间表)
        boolean flag = dao.addRoleSource(role.getRoleid(),source);
        return flag;
    }
}
