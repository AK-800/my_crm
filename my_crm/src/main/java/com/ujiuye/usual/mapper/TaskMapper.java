package com.ujiuye.usual.mapper;

import com.ujiuye.usual.bean.Task;

import java.util.List;

public interface TaskMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);

    //添加任务
    void insertTask(Task task);

    //查询全部任务
    List<Task> getAll();
}