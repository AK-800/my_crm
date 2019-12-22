package com.ujiuye.pro.mapper;

import com.ujiuye.pro.bean.Function;

import java.util.List;

public interface FunctionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Function record);

    int insertSelective(Function record);

    Function selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Function record);

    int updateByPrimaryKey(Function record);

    //查询全部功能
    List<Function> queryAll();

    //添加功能
    void insertFun(Function function);

    //查询单个功能
    Function queryFun(int id);

    //修改功能
    void updateFun(Function function);

    //根据模块的ID查询功能
    List<Function> getFunByMod(int id);
}