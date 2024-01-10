package com.kc.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kc.dao.OrderDao;
import com.kc.dao.ProductDao;
import com.kc.domain.Order;
import com.kc.service.OrderService;
import com.kc.service.ProductService;
import com.kc.vo.OrderVo;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {


    @Autowired
    OrderDao orderDao;

    //提交订单
    public void submitOrder(@Param("uname") String uname, @Param("id") int id,
                            @Param("pname") String pname, @Param("quantity") int quantity, @Param("status") String status, @Param("feedback") String feedback) {
        orderDao.submitOrder(uname, id, pname, quantity, status, feedback);
    }

    //用户查看所有订单
    public List<Order> queryAllOrder(@Param("uname") String uname) {
        return orderDao.queryAllOrder(uname);
    }

    //管理员查看所有订单
    public List<Order> ManageAllOrder() {
        return orderDao.ManageAllOrder();
    }

    //删除订单
    public boolean deleteOrder(@Param("oid") Integer oid) {
        return orderDao.deleteOrder(oid);
    }

    //管理员修改订单状态
    public int statusByOid(@Param("oid") Integer oid) {
        return orderDao.statusByOid(oid);
    }

    //用户反馈订单状态
    public int feedbackByOid(@Param("oid") Integer oid) {
        return orderDao.feedbackByOid(oid);
    }

}
