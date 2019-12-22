package com.ujiuye.emp.mapper;


import com.ujiuye.emp.bean.Employee;

import java.util.List;

public interface EmployeeMapper {

    //根据position的等级来查询员工
    List<Employee> getEmpByP_fk(int p_fk);

    Employee getEmpByEid(int eid);

    //根据部门编号查询员工
    List<Employee> getEmpByDept(int id);

    //登录验证
    Employee login(Employee employee);

    //查询全部的员工
    List<Employee> getAllEmp();
}
