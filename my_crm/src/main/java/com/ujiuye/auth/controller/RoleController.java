package com.ujiuye.auth.controller;

import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("Role")
public class RoleController {

    @Resource
    RoleService service;


    //添加角色
    @RequestMapping("addRole")
    @ResponseBody
    public boolean addRole(Role role,int[] source){
        return service.addRole(role,source);
    }



    //根据主键修改单个角色的权限
    @RequestMapping("updateRole")
    @ResponseBody
    public boolean updateRole(Role role,int[] source){
        service.updateRole(role,source);
        return true;
    }



    //根据主键查询单个角色
    @RequestMapping("getRoleById")
    @ResponseBody
    public Role getRoleById(int roleid){
        Role role = service.getRoleById(roleid);
        return role;
    }


    //查询全部的角色
    @RequestMapping("getAllRole")
    @ResponseBody
    public List<Role> getAllRole(){
        List<Role> list = service.getAllRole();
        return list;
    }

}
