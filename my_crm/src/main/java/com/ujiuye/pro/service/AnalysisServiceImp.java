package com.ujiuye.pro.service;

import com.ujiuye.pro.bean.Analysis;
import com.ujiuye.pro.mapper.AnalysisMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AnalysisServiceImp implements AnalysisService {

    @Resource
    AnalysisMapper dao;

    //添加需求分析
    public void insertInfo(Analysis analysis) {

        dao.insertInfo(analysis);
    }

    //查询全部的需求分析
    public List<Analysis> getAllInfo() {
        return dao.getAllInfo();
    }

    //查询需求分析的详细信息
    public Analysis getAnalysisDetail(int id) {
        return dao.getAnalysisDetail(id);
    }

    //修改需求分析
    public void updateInfo(Analysis analysis) {
        dao.updateInfo(analysis);
    }

    //批量删除
    public int delInfo(List list) {
        return dao.delInfo(list);
    }
}
