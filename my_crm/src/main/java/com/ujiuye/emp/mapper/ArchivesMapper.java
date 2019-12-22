package com.ujiuye.emp.mapper;

import com.ujiuye.emp.bean.Archives;

public interface ArchivesMapper {
    int deleteByPrimaryKey(String dnum);

    int insert(Archives record);

    int insertSelective(Archives record);

    Archives selectByPrimaryKey(String dnum);

    int updateByPrimaryKeySelective(Archives record);

    int updateByPrimaryKey(Archives record);
}