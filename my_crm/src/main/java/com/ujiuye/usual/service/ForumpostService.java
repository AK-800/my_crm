package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Evaluate;
import com.ujiuye.usual.bean.Forumpost;

import java.util.List;

public interface ForumpostService {

    //查询全部论坛帖子
    List<Forumpost> getAllForum();

    //查询全部评论
    Forumpost getComment(int id);

    //添加评论
    int insertPin(Evaluate evaluate, Integer state);
}
