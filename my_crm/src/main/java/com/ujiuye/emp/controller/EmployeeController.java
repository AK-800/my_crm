package com.ujiuye.emp.controller;

import com.ujiuye.emp.bean.Employee;
import com.ujiuye.emp.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("Employee")
public class EmployeeController {

    @Resource
    EmployeeService service;


    //查询全部的员工
    @RequestMapping("getAllEmp")
    @ResponseBody
    public List<Employee> getAllEmp(){
        List<Employee> list = service.getAllEmp();
        return list;
    }

    //登录到index.jsp，在session域拿用户的信息
    @RequestMapping("getEmp")
    @ResponseBody
    public Employee getEmp(HttpSession session){
        Employee emp = (Employee) session.getAttribute("emp");
        return emp;
    }

    //登录验证
    @RequestMapping("login")
    @ResponseBody
    public boolean login(Employee employee, HttpSession session){
        Employee emp = service.login(employee);
        if(emp != null){
            session.setAttribute("emp",emp);
            return true;
        }else {
            return false;
        }
    }


    //根据部门编号查询员工
    @RequestMapping("getEmpByDept")
    @ResponseBody
    public List<Employee> getEmpByDept(int id){
        List<Employee> list = service.getEmpByDept(id);
        return list;
    }


    //根据position的等级来查询员工
    @RequestMapping("getEmpByP_fk")
    @ResponseBody
    public List<Employee> getEmpByP_fk(int p_fk){
        // System.out.println(p_fk);
        List<Employee> list = service.getEmpByP_fk(p_fk);
        return list;
    }
}
