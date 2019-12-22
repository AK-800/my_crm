package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Task;
import com.ujiuye.usual.mapper.TaskMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TaskServiceImp implements TaskService {

    @Resource
    TaskMapper dao;

    //添加任务
    public void insertTask(Task task) {
        dao.insertTask(task);
    }

    //查询全部任务
    public List<Task> getAll() {
        return dao.getAll();
    }
}
