package com.ujiuye.usual.mapper;

import com.ujiuye.usual.bean.Msg;

public interface MsgMapper {
    int deleteByPrimaryKey(Integer msgid);

    int insert(Msg record);

    int insertSelective(Msg record);

    Msg selectByPrimaryKey(Integer msgid);

    int updateByPrimaryKeySelective(Msg record);

    int updateByPrimaryKey(Msg record);
}