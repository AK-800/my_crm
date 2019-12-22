package com.ujiuye.duibiao.mapper;

import com.ujiuye.duibiao.bean.Datacollect;

import java.util.List;

public interface DatacollectMapper {
    int deleteByPrimaryKey(Integer daid);

    int insert(Datacollect record);

    int insertSelective(Datacollect record);

    Datacollect selectByPrimaryKey(Integer daid);

    int updateByPrimaryKeySelective(Datacollect record);

    int updateByPrimaryKey(Datacollect record);

    //查询全部对标公司
    List<Datacollect> getAll();

    //查询单个公司的信息
    Datacollect getInfo(int daid);
}