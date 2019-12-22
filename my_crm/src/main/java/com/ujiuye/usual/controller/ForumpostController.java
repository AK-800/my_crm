package com.ujiuye.usual.controller;

import com.ujiuye.emp.bean.Employee;
import com.ujiuye.usual.bean.Evaluate;
import com.ujiuye.usual.bean.Forumpost;
import com.ujiuye.usual.service.ForumpostService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("Forumpost")
public class ForumpostController {

    @Resource
    ForumpostService service;



    //添加帖子
    @RequestMapping("addForum")
    @ResponseBody
    public boolean addForum(Forumpost forumpost,HttpSession session){  //富文本编辑框的内容可以直接通过对象传过来
        Employee emp = (Employee)session.getAttribute("emp");
        forumpost.setEmpFk3(emp.getEid());
        forumpost.setCreatetime(new Date());
        System.out.println(forumpost);
        return true;
    }

    //添加评论
    @RequestMapping("addPin")
    @ResponseBody
    public Integer addPin(Evaluate evaluate, Integer state, HttpSession session){
        evaluate.setUpdatetime(new Date());
        evaluate.setEvatime(new Date());
        Employee emp = (Employee) session.getAttribute("emp");
        evaluate.setEmpFk4(emp.getEid());
        int n = service.insertPin(evaluate,state);
        return n;
    }

    //查询全部评论
    @RequestMapping("getComment")
    @ResponseBody
    public Forumpost getComment(int id){
        Forumpost forumpost = service.getComment(id);
        return forumpost;
    }


    //查询全部论坛帖子
    @RequestMapping("getAllForum")
    @ResponseBody
    public List<Forumpost> getAllForum(){
        List<Forumpost> list = service.getAllForum();
        return list;
    }
}
