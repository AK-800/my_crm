package com.ujiuye.duibiao.service;

import com.ujiuye.duibiao.bean.Datacollect;
import com.ujiuye.duibiao.mapper.DatacollectMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DatacollectServiceImp implements DatacollectService {

    @Resource
    DatacollectMapper dao;

    //查询全部对标公司
    public List<Datacollect> getAll() {
        return dao.getAll();
    }

    //查询单个公司的信息
    public Datacollect getInfo(int daid) {
        return dao.getInfo(daid);
    }
}
