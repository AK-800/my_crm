package com.ujiuye.pro.mapper;


import com.ujiuye.pro.bean.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper {
    int insertPro(Project project);

    List<Project> getAllProject();

    //获取没有需求文档的项目
    List<Project> getProByAna();

    //修改项目的信息
    void updatePro(Project project);

    //查询项目的信息
    Project getPro(int pid);

    //单表查询项目的信息
    Project queryPro(int id);

    //根据条件搜索项目信息
    List<Project> getProjectByCond(@Param("cid")int cid,@Param("oid")int oid,@Param("keyword")String keyword);

    //批量删除项目信息
    int batchDelPro(List list);

    //获取有需求文档的项目(功能管理)
    List<Project> getProByFun();
}
