package com.ujiuye.usual.mapper;

import com.ujiuye.usual.bean.Evaluate;
import com.ujiuye.usual.bean.Forumpost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ForumpostMapper {
    int deleteByPrimaryKey(Integer forumid);

    int insert(Forumpost record);

    int insertSelective(Forumpost record);

    Forumpost selectByPrimaryKey(Integer forumid);

    int updateByPrimaryKeySelective(Forumpost record);

    int updateByPrimaryKey(Forumpost record);

    //查询全部论坛帖子
    List<Forumpost> getAllForum();

    //查询全部评论
    Forumpost getComment(int id);

    //添加评论
    //多个参数给对象加别名的时候，xml文件里面要用别名.属性名调用
    int insertPin(@Param("evaluate") Evaluate evaluate,@Param("state") Integer state);
}