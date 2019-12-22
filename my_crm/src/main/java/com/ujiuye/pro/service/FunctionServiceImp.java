package com.ujiuye.pro.service;

import com.ujiuye.pro.bean.Function;
import com.ujiuye.pro.mapper.FunctionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FunctionServiceImp implements FunctionService {

    @Resource
    FunctionMapper dao;

    //查询全部功能
    public List<Function> queryAll() {
        return dao.queryAll();
    }

    //添加功能
    public void insertFun(Function function) {
        dao.insertFun(function);
    }

    //查询单个功能
    public Function queryFun(int id) {
        return dao.queryFun(id);
    }

    //修改功能
    public void updateFun(Function function) {
        dao.updateFun(function);
    }

    //根据模块的ID查询功能
    public List<Function> getFunByMod(int id) {
        return dao.getFunByMod(id);
    }
}
