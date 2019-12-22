package com.ujiuye.emp.mapper;

import com.ujiuye.emp.bean.Position;

public interface PositionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Position record);

    int insertSelective(Position record);

    Position selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKey(Position record);

    //根据主键id查询职位
    Position getPosition(int id);
}