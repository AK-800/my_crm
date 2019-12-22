package com.ujiuye.pro.controller;

import com.ujiuye.pro.bean.Analysis;
import com.ujiuye.pro.service.AnalysisService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("Analysis")
public class AnalysisController {

    @Resource
    AnalysisService service;

    //批量删除
    @RequestMapping("delInfo")
    @ResponseBody
    public int delInfo(String str){
        String[] ids = str.split(",");
        List list = new ArrayList();
        for (int i=0;i<ids.length;i++){
            list.add(Integer.parseInt(ids[i]));
        }
        int n = service.delInfo(list);
        return n;
    }

    //修改需求分析
    @RequestMapping("updateInfo")
    public String updateInfo(Analysis analysis){
        // System.out.println(analysis);
        System.out.println(analysis);
        analysis.setUpdatetime(new Date());
        service.updateInfo(analysis);
        return "project-need";
    }

    //查询单个的需求分析(返回json)
    @RequestMapping("getInfoById")
    @ResponseBody
    public Analysis getInfoById(int id){
        Analysis analysis = service.getAnalysisDetail(id);
        return analysis;
    }


    //查询需求分析的详细信息
    @RequestMapping("getAnalysisDetail")
    public String getAnalysisDetail(int id, Model model){
        Analysis analysis = service.getAnalysisDetail(id);
        // System.out.println(analysis);
        model.addAttribute("analysis",analysis);
        return "project-need-look";
    }


    //查询全部的需求分析
    @RequestMapping("getAllInfo")
    @ResponseBody
    public List<Analysis> getAllInfo(){
        List<Analysis> list = service.getAllInfo();
        return list;
    }

    //添加需求分析
    @RequestMapping("insertInfo")
    public String insertInfo(Analysis analysis, MultipartFile file){
        //上传路径
        String path="E:/upload/";
        String fileName=file.getOriginalFilename();    //获取文档的名字
        path = path + fileName;
        try {
            //上传方法
            file.transferTo(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        analysis.setAddtime(new Date());
        analysis.setProname(fileName);
        service.insertInfo(analysis);
        return "project-need";
    }
}
