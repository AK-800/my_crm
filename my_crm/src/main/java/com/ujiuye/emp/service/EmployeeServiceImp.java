package com.ujiuye.emp.service;

import com.ujiuye.emp.bean.Employee;
import com.ujiuye.emp.mapper.EmployeeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmployeeServiceImp implements EmployeeService {

    @Resource
    EmployeeMapper dao;

    //根据position的等级来查询员工
    public List<Employee> getEmpByP_fk(int p_fk) {
        return dao.getEmpByP_fk(p_fk);
    }

    //根据部门编号查询员工
    public List<Employee> getEmpByDept(int id) {
        return dao.getEmpByDept(id);
    }

    //登录验证
    public Employee login(Employee employee) {
        return dao.login(employee);
    }

    //查询全部的员工
    public List<Employee> getAllEmp() {
        return dao.getAllEmp();
    }
}
