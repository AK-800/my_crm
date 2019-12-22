package com.ujiuye.usual.mapper;

import com.ujiuye.usual.bean.Evaluate;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer evaid);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer evaid);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);
}