package com.ujiuye.auth.service;

import com.ujiuye.auth.bean.Sources;
import com.ujiuye.auth.mapper.SourcesMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SourcesServiceImp implements SourcesService {

    @Resource
    SourcesMapper dao;

    //查询全部的权限
    public List<Sources> getAll() {
        return dao.getAll();
    }

    //根据用户的id查询他的全部权限
    public List<Sources> getSouByEmp(Integer eid) {
        return dao.getSouByEmp(eid);
    }
}
