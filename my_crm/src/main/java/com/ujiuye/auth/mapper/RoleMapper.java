package com.ujiuye.auth.mapper;

import com.ujiuye.auth.bean.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    //查询全部的角色
    List<Role> getAllRole();

    //根据主键查询单个角色
    Role getRoleById(int roleid);

    // 根据主键修改单个角色的权限
    void updateRole(Role role);
    void deleteRole(Role role);
    void insertRole(@Param("role")Role role, @Param("source")int[] source);

    //添加角色(只添加基本信息，不包括权限)，并返回role的主键roleid，添加新角色的权限需要用roleid
    void addRole(Role role);

    //添加新角色的权限(添加中间表)
    boolean addRoleSource(@Param("roleid") int roleid,@Param("source") int[] source);
}