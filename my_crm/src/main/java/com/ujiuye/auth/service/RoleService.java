package com.ujiuye.auth.service;

import com.ujiuye.auth.bean.Role;

import java.util.List;

public interface RoleService {

    //查询全部的角色
    List<Role> getAllRole();

    //根据主键查询单个角色
    Role getRoleById(int roleid);

    //根据主键修改单个角色的权限
    void updateRole(Role role, int[] source);

    //添加角色
    boolean addRole(Role role, int[] source);
}
