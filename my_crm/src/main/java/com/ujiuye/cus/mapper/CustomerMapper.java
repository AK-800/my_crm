package com.ujiuye.cus.mapper;

import com.ujiuye.cus.bean.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper {
    int addCustomer(Customer customer);

    //查询全部用户信息
    List<Customer> getAllCustomer();

    List<Customer> searchCustomer01(@Param("cid") int cid, @Param("oid") int oid, @Param("keyword") String keyword);

    Customer getCustomer(int id);

    void updateCustomer(Customer customer);

    //分页查询
    List<Customer> getCustomerByPage(@Param("startPage") int startPage, @Param("size") int size);

    //获取数据总条数
    int getCount();

    //批量删除
    int batchDelete(int id);

    //根据选择的条件查询用户数据
    List<Customer> getCustomerByCond(@Param("cid")int cid,@Param("oid")int oid,@Param("keyword")String keyword);
}
