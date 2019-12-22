package com.ujiuye.usual.controller;

import com.ujiuye.usual.bean.Expendituretype;
import com.ujiuye.usual.service.ExpendituretypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("Expendituretype")
public class ExpendituretypeController {

    @Resource
    ExpendituretypeService service;

    //查询全部的报销类型
    @RequestMapping("queryExp")
    @ResponseBody
    public List<Expendituretype> queryExp(){
        List<Expendituretype> expendituretype = service.queryExp();
        return expendituretype;
    }
}
