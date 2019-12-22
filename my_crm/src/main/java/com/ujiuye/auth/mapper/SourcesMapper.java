package com.ujiuye.auth.mapper;

import com.ujiuye.auth.bean.Sources;

import java.util.List;

public interface SourcesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Sources record);

    int insertSelective(Sources record);

    Sources selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sources record);

    int updateByPrimaryKey(Sources record);

    //查询全部的权限
    List<Sources> getAll();

    //根据用户的id查询他的全部权限
    List<Sources> getSouByEmp(Integer eid);
}