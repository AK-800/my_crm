package com.ujiuye.auth.controller;

import com.ujiuye.auth.bean.Sources;
import com.ujiuye.auth.service.SourcesService;
import com.ujiuye.emp.bean.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("Sources")
public class SourcesController {

    @Resource
    SourcesService service;


    //根据用户的id查询他的全部权限
    @RequestMapping("getSouByEmp")
    @ResponseBody
    public List<Sources> getSouByEmp(HttpSession session){
        Employee emp = (Employee)session.getAttribute("emp");   //在session域拿到用户的信息
        List<Sources> list = service.getSouByEmp(emp.getEid());
        return  list;
    }


    //查询全部的权限
    @RequestMapping("getAll")
    @ResponseBody
    public List<Sources> getAll(){
        List<Sources> list = service.getAll();
        return  list;
    }

}
