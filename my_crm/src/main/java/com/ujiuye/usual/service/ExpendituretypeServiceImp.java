package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Expendituretype;
import com.ujiuye.usual.mapper.ExpendituretypeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExpendituretypeServiceImp implements ExpendituretypeService {

    @Resource
    ExpendituretypeMapper dao;

    //查询全部的报销类型
    public List<Expendituretype> queryExp() {
        return dao.queryExp();
    }
}
