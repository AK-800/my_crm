package com.ujiuye.duibiao.mapper;

import com.ujiuye.duibiao.bean.Indexvalue;

public interface IndexvalueMapper {
    int deleteByPrimaryKey(Integer inId);

    int insert(Indexvalue record);

    int insertSelective(Indexvalue record);

    Indexvalue selectByPrimaryKey(Integer inId);

    int updateByPrimaryKeySelective(Indexvalue record);

    int updateByPrimaryKey(Indexvalue record);
}