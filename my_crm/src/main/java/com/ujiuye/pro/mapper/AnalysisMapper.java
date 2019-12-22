package com.ujiuye.pro.mapper;

import com.ujiuye.pro.bean.Analysis;

import java.util.List;

public interface AnalysisMapper {

    //添加需求分析
    void insertInfo(Analysis analysis);

    //查询全部的需求分析
    List<Analysis> getAllInfo();

    //查询单个需求分析的详细信息
    Analysis getAnalysisDetail(int id);

    //修改需求分析
    void updateInfo(Analysis analysis);

    //批量删除
    int delInfo(List list);
}
