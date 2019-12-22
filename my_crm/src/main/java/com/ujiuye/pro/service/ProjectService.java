package com.ujiuye.pro.service;


import com.ujiuye.pro.bean.Project;

import java.util.List;

public interface ProjectService {
    int insertPro(Project project);

    List<Project> getAllProject();

    //获取没有需求文档的项目
    List<Project> getProByAna();

    //修改项目的信息
    void updatePro(Project project);

    //查询项目的信息
    Project getPro(int pid);

    //根据条件搜索项目信息
    List<Project> getProjectByCond(int cid, int oid, String keyword);

    //批量删除项目信息
    int batchDelPro(List list);

    //获取有需求文档的项目(功能管理)
    List<Project> getProByFun();
}
