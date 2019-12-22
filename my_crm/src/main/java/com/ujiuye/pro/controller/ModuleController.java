package com.ujiuye.pro.controller;

import com.ujiuye.pro.bean.Module;
import com.ujiuye.pro.service.ModuleService;
import com.ujiuye.util.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("Module")
public class ModuleController {

    @Resource
    ModuleService service;

    //查询有需求的模块
    @RequestMapping("queryModByAna")
    @ResponseBody
    public List<Module> queryModByAna(int id){
        List<Module> list = service.queryModByAna(id);
        return list;
    }

    //修改模块信息
    @RequestMapping("updateMod")
    public String updateMod(Module module){
        // System.out.println(module);
        // SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        // String date = sdf.format(new Date());
        String date = DateUtils.getDate(new Date());
        module.setUpdatetime(date);
        service.updateMod(module);
        return "project-model";
    }

    //查询单个模块信息
    @RequestMapping("queryMod")
    @ResponseBody
    public Module queryMod(int id){
        Module module = service.queryMod(id);
        // System.out.println(module);
        return module;
    }


    //添加模块
    @RequestMapping("insertMod")
    public String insertMod(Module module,String proName){
        String proname = proName.split(",")[1];
        module.setProname(proname);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String date = sdf.format(new Date());
        module.setAddtime(date);
        module.setUpdatetime(date);
        // System.out.println(module);
        service.insertMod(module);
        return "project-model";
    }


    //查询全部的模块
    @RequestMapping("queryAll")
    @ResponseBody
    public List<Module> queryAll(){
        List<Module> list = service.queryAll();
        // System.out.println(list);
        return list;
    }

}
