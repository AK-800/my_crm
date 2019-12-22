package com.ujiuye.usual.mapper;

import com.ujiuye.usual.bean.Baoxiaoreply;

import java.util.List;

public interface BaoxiaoreplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Baoxiaoreply record);

    int insertSelective(Baoxiaoreply record);

    Baoxiaoreply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Baoxiaoreply record);

    int updateByPrimaryKey(Baoxiaoreply record);

    //根据报销单号查询审批结果
    List<Baoxiaoreply> getBxreply(String bxid);
}