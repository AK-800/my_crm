package com.ujiuye.usual.controller;

import com.ujiuye.emp.bean.Employee;
import com.ujiuye.usual.bean.Baoxiao;
import com.ujiuye.usual.bean.Baoxiaoreply;
import com.ujiuye.usual.bean.Expendituretype;
import com.ujiuye.usual.service.BaoxiaoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("Baoxiao")
public class BaoxiaoController {

    @Resource
    BaoxiaoService service;

    //修改驳回和未审批的订单
    @RequestMapping("updateBx")
    @ResponseBody
    public boolean updateBx(Baoxiao baoxiao){
        return service.updateBx(baoxiao);
    }

    //审批订单
    @RequestMapping("shenpiBx")
    @ResponseBody
    public boolean shenpiBx(Baoxiao baoxiao,String content){
        Baoxiaoreply baoxiaoreply = new Baoxiaoreply();
        baoxiaoreply.setContent(content);
        baoxiaoreply.setReplytime(new Date());
        baoxiaoreply.setBaoxiaoFk(baoxiao.getBxid());
        baoxiaoreply.setStatus(baoxiao.getBxstatus());

        boolean flag = service.shenpiBx(baoxiao,baoxiaoreply);

        return flag;
    }

    //添加报销单
    @RequestMapping("addBx")
    @ResponseBody
    public boolean addBx(Baoxiao baoxiao, HttpSession session){
        Employee emp = (Employee)session.getAttribute("emp");
        baoxiao.setBxid(UUID.randomUUID().toString());     //给baoxiao赋上主键bxid，报销单的主键是字符串
        baoxiao.setEmpFk(emp.getEid());
        baoxiao.setBxstatus(3);      //状态3是为神品
        return service.addBx(baoxiao);
    }

    //查询报销的全部种类
    @RequestMapping("getPaymode")
    @ResponseBody
    public List<Expendituretype> getPaymode(){
        List<Expendituretype> list = service.getPaymode();
        return list;
    }


    //查询全部的报销单
    @RequestMapping("getAllBx")
    @ResponseBody
    public List<Baoxiao> getAllBx(){
        List<Baoxiao> list = service.getAllBx();
        // System.out.println(list);
        return list;
    }


    //根据报销单的主键bxid，查询单个报销单
    @RequestMapping("queryBx")
    @ResponseBody
    public Baoxiao queryBx(String bxid){
        Baoxiao baoxiao = service.queryBx(bxid);
        System.out.println(baoxiao);
        return baoxiao;
    }

    //查询登录用户的全部报销
    @RequestMapping("getMyBx")
    @ResponseBody
    public List<Baoxiao> getMyBx(HttpSession session){
        Employee emp = (Employee) session.getAttribute("emp");
        List<Baoxiao> list = service.getMyBx(emp.getEid());
        return list;
    }

}
