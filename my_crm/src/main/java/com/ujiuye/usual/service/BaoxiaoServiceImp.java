package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Baoxiao;
import com.ujiuye.usual.bean.Baoxiaoreply;
import com.ujiuye.usual.bean.Expendituretype;
import com.ujiuye.usual.mapper.BaoxiaoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BaoxiaoServiceImp implements BaoxiaoService {

    @Resource
    BaoxiaoMapper dao;

    //查询登录用户的全部报销
    public List<Baoxiao> getMyBx(int id) {
        return dao.getMyBx(id);
    }

    //根据报销单的ID，查询单个报销单
    public Baoxiao queryBx(String bxid) {
        return dao.queryBx(bxid);
    }

    //查询全部的报销单
    public List<Baoxiao> getAllBx() {
        return dao.getAllBx();
    }


    //查询报销的全部种类
    public List<Expendituretype> getPaymode() {
        return dao.getPaymode();
    }

    //添加报销单
    public boolean addBx(Baoxiao baoxiao) {
        return dao.addBx(baoxiao);
    }

    //审批订单
    public boolean shenpiBx(Baoxiao baoxiao, Baoxiaoreply baoxiaoreply) {
        boolean f1 = dao.updateBxStatus(baoxiao);    //修改报销单的状态，同意审批或者驳回审批
        boolean f2 = dao.addBxreply(baoxiaoreply);    //添加审批回复
        return f1 && f2;
    }

    //修改驳回和未审批的订单
    public boolean updateBx(Baoxiao baoxiao) {
        return dao.updateBx(baoxiao);
    }
}
