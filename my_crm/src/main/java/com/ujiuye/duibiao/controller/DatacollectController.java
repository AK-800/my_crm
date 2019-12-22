package com.ujiuye.duibiao.controller;

import com.ujiuye.auth.bean.Sources;
import com.ujiuye.duibiao.bean.Datacollect;
import com.ujiuye.duibiao.service.DatacollectService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("Datacollect")
public class DatacollectController {

    @Resource
    DatacollectService service;


    //查询全部对标公司
    @RequestMapping("getAll")
    @ResponseBody
    public List<Datacollect> getAll(){
        List<Datacollect> list = service.getAll();
        return list;
    }

    //查询单个公司的信息
    @RequestMapping("getInfo")
    @ResponseBody
    public Datacollect getInfo(int daid){
        Datacollect datacollect = service.getInfo(daid);
        return datacollect;
    }


}
