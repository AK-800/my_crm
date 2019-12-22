package com.ujiuye.pro.service;

import com.ujiuye.pro.bean.Module;
import com.ujiuye.pro.mapper.ModuleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ModuleServiceImp implements ModuleService {

    @Resource
    ModuleMapper dao;

    //查询全部模块
    public List<Module> queryAll() {
        return dao.queryAll();
    }

    //添加模块
    public void insertMod(Module module) {
        dao.insertMod(module);
    }

    //查询单个模块信息
    public Module queryMod(int id) {
        return dao.queryMod(id);
    }

    //修改模块信息
    public void updateMod(Module module) {
        dao.updateMod(module);
    }

    //查询有需求的模块
    public List<Module> queryModByAna(int id) {
        return dao.queryModByAna(id);
    }
}
