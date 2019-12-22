package com.ujiuye.usual.mapper;

import com.ujiuye.usual.bean.Expendituretype;

import java.util.List;

public interface ExpendituretypeMapper {
    int deleteByPrimaryKey(Integer etid);

    int insert(Expendituretype record);

    int insertSelective(Expendituretype record);

    Expendituretype selectByPrimaryKey(Integer etid);

    int updateByPrimaryKeySelective(Expendituretype record);

    int updateByPrimaryKey(Expendituretype record);

    //查询报销单的类型
    Expendituretype getEx(int id);

    //查询全部的报销类型
    List<Expendituretype> queryExp();
}