package com.ujiuye.pro.controller;

import com.ujiuye.pro.bean.Function;
import com.ujiuye.pro.service.FunctionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("Function")
public class FunctionController {

    @Resource
    FunctionService service;


    //根据模块的ID查询功能
    @RequestMapping("getFunByMod")
    @ResponseBody
    public List<Function> getFunByMod(int id){
        List<Function> list = service.getFunByMod(id);
        return list;
    }

    //修改功能
    @RequestMapping("updateFun")
    public String updateFun(Function function,String id){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String date = sdf.format(new Date());
        function.setUpdatetime(date);
        System.out.println(id);
        System.out.println(function);
        service.updateFun(function);
        // System.out.println(function);
        return "project-function";
    }


    //查询单个功能
    @RequestMapping("queryFun")
    @ResponseBody
    public Function queryFun(int id){
        Function function = service.queryFun(id);
        // System.out.println(function);
        return function;
    }

    //添加功能
    @RequestMapping("insertFun")
    public String insertFun(Function function,String proName){
        String proname = proName.split(",")[0];
        function.setProname(proname);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String date = sdf.format(new Date());
        function.setAddtime(date);
        function.setUpdatetime(date);
        // System.out.println(function);
        service.insertFun(function);
        // System.out.println(list);
        return "project-function";
    }

    //查询全部功能
    @RequestMapping("queryAll")
    @ResponseBody
    public List<Function> queryAll(){
        List<Function> list = service.queryAll();
        // System.out.println(list);
        return list;
    }

}
