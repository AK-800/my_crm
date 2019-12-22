package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Evaluate;
import com.ujiuye.usual.bean.Forumpost;
import com.ujiuye.usual.mapper.ForumpostMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ForumpostServiceImp implements ForumpostService{

    @Resource
    ForumpostMapper dao;

    //查询全部论坛帖子
    public List<Forumpost> getAllForum() {
        return dao.getAllForum();
    }

    //查询全部评论
    public Forumpost getComment(int id) {
        return dao.getComment(id);
    }

    //添加评论
    public int insertPin(Evaluate evaluate, Integer state) {
        return dao.insertPin(evaluate,state);
    }
}
