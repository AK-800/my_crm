package com.ujiuye.duibiao.service;

import com.ujiuye.duibiao.bean.Datacollect;

import java.util.List;

public interface DatacollectService {
    //查询全部对标公司
    List<Datacollect> getAll();

    //查询单个公司的信息
    Datacollect getInfo(int daid);
}
