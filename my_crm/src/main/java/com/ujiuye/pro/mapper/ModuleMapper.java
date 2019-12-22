package com.ujiuye.pro.mapper;

import com.ujiuye.pro.bean.Module;

import java.util.List;

public interface ModuleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Module record);

    int insertSelective(Module record);

    Module selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Module record);

    int updateByPrimaryKey(Module record);

    //查询全部模块
    List<Module> queryAll();

    //添加模块
    void insertMod(Module module);

    //查询单个模块信息
    Module queryMod(int id);

    //修改模块信息
    void updateMod(Module module);

    //查询有需求的模块
    List<Module> queryModByAna(int id);
}