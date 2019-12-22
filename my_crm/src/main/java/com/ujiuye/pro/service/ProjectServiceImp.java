package com.ujiuye.pro.service;

import com.ujiuye.pro.bean.Project;
import com.ujiuye.pro.mapper.ProjectMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProjectServiceImp implements ProjectService {

    @Resource
    ProjectMapper dao;

    @Override
    public int insertPro(Project project) {
        return dao.insertPro(project);
    }

    @Override
    public List<Project> getAllProject() {
        return dao.getAllProject();
    }

    //获取没有需求文档的项目
    public List<Project> getProByAna() {
        return dao.getProByAna();
    }

    //修改项目的信息
    public void updatePro(Project project) {
        dao.updatePro(project);
    }

    //查询项目的信息
    public Project getPro(int pid) {
        return dao.getPro(pid);
    }

    //根据条件搜索项目信息
    public List<Project> getProjectByCond(int cid, int oid, String keyword) {
        return dao.getProjectByCond(cid,oid,keyword);
    }

    //批量删除项目信息
    public int batchDelPro(List list) {
        return dao.batchDelPro(list);
    }

    //获取有需求文档的项目(功能管理)
    public List<Project> getProByFun() {
        return dao.getProByFun();
    }
}
