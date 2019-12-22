package com.ujiuye.usual.controller;

import com.ujiuye.usual.bean.Task;
import com.ujiuye.usual.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("Task")
public class TaskControlle {

    @Resource
    TaskService service;


    //查询全部任务
    @RequestMapping("getAll")
    @ResponseBody
    public List<Task> getAll(){
        List<Task> list = service.getAll();
        System.out.println(list);
        return list;
    }


    //添加任务
    @RequestMapping("insertTask")
    public String insertTask(Task task){
        service.insertTask(task);
        return "task";
    }
}
