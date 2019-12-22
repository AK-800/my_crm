package com.ujiuye.pro.service;

import com.ujiuye.pro.bean.Analysis;

import java.util.List;

public interface AnalysisService {

    //添加需求分析
    void insertInfo(Analysis analysis);

    //查询全部的需求分析
    List<Analysis> getAllInfo();

    //查询需求分析的详细信息
    Analysis getAnalysisDetail(int id);

    //修改需求分析
    void updateInfo(Analysis analysis);

    //批量删除
    int delInfo(List list);
}
