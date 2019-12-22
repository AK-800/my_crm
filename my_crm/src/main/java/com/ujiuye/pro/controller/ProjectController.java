package com.ujiuye.pro.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.pro.bean.Project;
import com.ujiuye.pro.service.ProjectService;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.sound.midi.Soundbank;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("Project")
public class ProjectController {

    @Resource
    ProjectService service;

    // //分页功能
    // @RequestMapping("queryByPage")
    // @ResponseBody
    // public PageInfo queryByPage(int curPage){
    //
    //
    //
    //     return null;
    // }

    //批量删除项目
    @RequestMapping("delPro")
    @ResponseBody
    public int delPro(String str){
        String[] ids = str.split(",");
        List list = new ArrayList();
        for(int i=0;i<ids.length;i++){
            list.add(ids[i]);
        }
        int n = service.batchDelPro(list);
        return n;
    }

    //根据条件搜索项目信息,分页功能
    @RequestMapping("getProjectByCond")
    @ResponseBody
    public PageInfo getProjectByCond(int curPage,int cid,int oid,String keyword){

        PageHelper.startPage(curPage,10);    // 页码，每页的数据量

        List<Project> list = service.getProjectByCond(cid,oid,keyword);   //根据选择的条件查询用户数据

        PageInfo pageInfo = new PageInfo(list);      //把查询出的全部用户信息，自动进行分页
        if(pageInfo.getNextPage() == 0){          //分页插件到尾页的时候，会重新回到第一页，要修正这个bug
            pageInfo.setNextPage(pageInfo.getPages());
        }

        return pageInfo;
    }

    //修改项目的信息
    @RequestMapping("updatePro")
    public String updatePro(Project project,String newcomname){
        int comname = Integer.parseInt(newcomname.split(",")[0]);
        project.setComname(comname);
        // System.out.println(project);
        service.updatePro(project);
        return "project-base";
    }

    //查询项目的信息
    @RequestMapping("getPro")
    @ResponseBody
    public Project getPro(int pid){
        Project project = service.getPro(pid);
        return project;
    }

    //添加项目
    @RequestMapping("insertPro")
    public String insertPro(Project project, String comname01){
        int comname = Integer.parseInt(comname01.split(",")[0]);
        project.setComname(comname);
        System.out.println(project.getEmp_fk());
        service.insertPro(project);
        return  "project-base";
    }

    //查询全部项目信息
    @RequestMapping("getAllProject")
    @ResponseBody
    public List<Project> getAllProject(){
        List<Project> list = service.getAllProject();
        return list;
    }

    //获取有需求文档的项目(功能管理)
    @RequestMapping("getProByFun")
    @ResponseBody
    public List<Project> getProByFun(){
        List<Project> list = service.getProByFun();
        return list;
    }

    //获取没有需求文档的项目
    @RequestMapping("getProByAna")
    @ResponseBody
    public List<Project> getProByAna(){
        List<Project> list = service.getProByAna();
        return list;
    }

}
