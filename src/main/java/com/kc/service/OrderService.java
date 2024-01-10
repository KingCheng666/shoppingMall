package com.kc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kc.domain.Order;
import com.kc.vo.OrderVo;

public interface OrderService {
    //提交订单
    void submitOrder(@Param("uname") String uname, @Param("id") int id,
                     @Param("pname") String pname, @Param("quantity") int quantity, @Param("status") String status, @Param("feedback") String feedback);

    //用户查看自己的订单
    List<Order> queryAllOrder(@Param("uname") String uname);


    //管理员查看所有订单
    public List<Order> ManageAllOrder();

    //删除订单
    public boolean deleteOrder(@Param("oid") Integer oid);

    //管理员修改订单状态
    int statusByOid(@Param("oid") Integer oid);

    //用户反馈订单状态
    int feedbackByOid(@Param("oid") Integer oid);

}
