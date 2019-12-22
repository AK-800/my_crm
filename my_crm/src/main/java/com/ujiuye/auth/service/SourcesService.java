package com.ujiuye.auth.service;

import com.ujiuye.auth.bean.Sources;

import java.util.List;

public interface SourcesService {

    //查询全部的权限
    List<Sources> getAll();

    //根据用户的id查询他的全部权限
    List<Sources> getSouByEmp(Integer eid);
}
