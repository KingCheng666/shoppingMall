package com.kc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kc.dao.OrderDao;
import com.kc.domain.GoodsItem;
import com.kc.domain.Order;
import com.kc.domain.Product;
import com.kc.domain.ShoppingCart;
import com.kc.domain.User;
import com.kc.service.OrderService;
import com.kc.service.ProductService;
import com.kc.utils.DataGridViewResult;
import com.kc.vo.OrderVo;

@Controller
@SessionAttributes("order")

public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productservice;

    @RequestMapping("submitOrder")
    public void submitOrder(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        ArrayList<GoodsItem> itemsList = new ArrayList<GoodsItem>(cart.getItems());

        User u = (User) session.getAttribute("u");
        String uname = u.getUname();
//		User user = (User) session.getAttribute("user");
//		String uname=user.getUname();

        //ArrayList<Product>products = (ArrayList<Product>)session.getAttribute("productList");

        //获取购物车列表itemsList
        for (GoodsItem goodsItem : itemsList) {
            Product product = goodsItem.getProduct();
            int id = product.getId();
            String pname = product.getPname();
            int quantity = goodsItem.getQuantity();
            String status = "未发货";
            String feedback = "待确认收货";
            //提交订单
            if (product != null && quantity != 0) {
                orderService.submitOrder(uname, id, pname, quantity, status, feedback);
            }
            //更新商品库存
            productservice.update(product.getStock());
        }
        //清空购物车
        cart.clear();
        session.setAttribute("cart", cart);

        PrintWriter out = response.getWriter();
        out.print("<script>alert('订单提交成功');window.location.href='list_User.do';</script>");
    }


    //用户查看所有订单
    @RequestMapping("OrderUser")
    public ModelAndView queryOrder(String uname, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Order> o = orderService.queryAllOrder(uname);
        mav.addObject("o", o);
        mav.setViewName("Order_User");
        return mav;
    }

    //管理员查看所有订单
    @RequestMapping("OrderManager")
    public ModelAndView ManageAllOrder() {
        ModelAndView mav = new ModelAndView();
        List<Order> o = orderService.ManageAllOrder();
        mav.addObject("o", o);
        mav.setViewName("Order_Manager");
        return mav;
        //		session.setAttribute("ManageOrderList", ManageOrderList);
    }

    //删除订单
    @RequestMapping("deleteOrder")
    public void deleteOrder(Integer oid, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        orderService.deleteOrder(oid);
        PrintWriter out = response.getWriter();
        out.print("<script>alert('订单删除成功');window.location.href='OrderManager.do';</script>");
    }

    //修改订单
    @RequestMapping("modifyOrder")
    public void modifyOrder(Integer oid, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        orderService.statusByOid(oid);
        PrintWriter out = response.getWriter();
        out.print("<script>alert('订单修改成功');window.location.href='OrderManager.do';</script>");
    }

    //用户反馈订单状态
    @RequestMapping("feedbackOrder")
    public void feedbackOrder(Integer oid, String uname, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        orderService.feedbackByOid(oid);
        PrintWriter out = response.getWriter();
        out.print("<script>alert('订单确认收货成功');window.location.href='index_Users.jsp';</script>");
    }


}
