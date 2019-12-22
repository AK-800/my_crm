package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Baoxiao;
import com.ujiuye.usual.bean.Baoxiaoreply;
import com.ujiuye.usual.bean.Expendituretype;

import java.util.List;

public interface BaoxiaoService {

    //查询登录用户的全部报销
    List<Baoxiao> getMyBx(int id);

    //根据报销单的ID，查询单个报销单
    Baoxiao queryBx(String bxid);

    //查询全部的报销单
    List<Baoxiao> getAllBx();

    //查询报销的全部种类
    List<Expendituretype> getPaymode();

    //添加报销单
    boolean addBx(Baoxiao baoxiao);

    //审批订单
    boolean shenpiBx(Baoxiao baoxiao, Baoxiaoreply baoxiaoreply);

    //修改驳回和未审批的订单
    boolean updateBx(Baoxiao baoxiao);
}
