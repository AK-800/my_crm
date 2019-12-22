package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Task;

import java.util.List;

public interface TaskService {
    //添加任务
    void insertTask(Task task);

    //查询全部任务
    List<Task> getAll();
}
