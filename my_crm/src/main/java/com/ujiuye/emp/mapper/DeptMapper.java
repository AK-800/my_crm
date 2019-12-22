package com.ujiuye.emp.mapper;

import com.ujiuye.emp.bean.Dept;

public interface DeptMapper {
    int deleteByPrimaryKey(Integer deptno);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer deptno);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);

    //根据主键deptno查询部门
    Dept getDept(int deptno);
}