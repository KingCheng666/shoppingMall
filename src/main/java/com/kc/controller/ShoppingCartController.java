package com.kc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kc.domain.Comment;
import com.kc.domain.GoodsItem;
import com.kc.domain.Product;
import com.kc.domain.ShoppingCart;
import com.kc.domain.User;
import com.kc.service.CommentService;
import com.kc.service.ProductService;


@Controller
@SessionAttributes("shoppingCart")
public class ShoppingCartController {

    @Autowired
    private ServletContext servletContext;
    private ProductService productService;
    private CommentService commentService;

    //加入购物车时查看商品详情
    @RequestMapping("/ProductDetails")
    public String showProductDetails(int id, String pname, HttpSession session, HttpServletRequest request) {

        int productId = id;
////	User u=userService.get(uid);
////	ModelAndView mav = new ModelAndView();
////	mav.addObject("u", u);

//		System.out.println(pname);

        List<Product> products = (List<Product>) session.getAttribute("ls");
//		List<Comment> cm=commentService.queryProductComment(pname);
        Product product = new Product();
//		Comment comment=new Comment();

        if (!CollectionUtils.isEmpty(products)) {
            for (Product p : products) {
                if (p.getId() == productId) {
                    product = p;
                }
            }
        }

//		productService.update(id);
        session.setAttribute("product", product);
//		session.setAttribute("cm", cm);
        return "details_Product";
    }


    //添加到购物车
    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    public String addToCart(int id, HttpSession session, HttpServletRequest request) {
        int productId = 0;
        int quantity = 0;
        productId = Integer.parseInt(request.getParameter("id"));
        quantity = Integer.parseInt(request.getParameter("quantity"));
        List<Product> products = (List<Product>) session.getAttribute("ls");
        Product product = new Product();
        for (Product p : products) {
            if (p.getId() == productId) {
                product = p;
            }
        }
        if (product != null && quantity >= 0) {
            GoodsItem goodsItem = new GoodsItem(product, quantity);
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            cart.add(goodsItem);

        }
        return "show_ShoppingCart";
    }

    //删除购物车单个商品
    @RequestMapping(value = "/deleteItem", method = RequestMethod.GET)
    public String deleteItem(int id, HttpSession session, HttpServletRequest request) {
        //�õ����ﳵ�е���Ϣ
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            GoodsItem item = null;
            for (GoodsItem shopItem : cart.getItems()) {
                if (shopItem.getProduct().getId() == productId) {
                    item = shopItem;
                    break;
                }
            }
            cart.remove(item.getProduct().getId());
        } catch (NumberFormatException e) {
            System.out.println("删除商品失败：" + e.getMessage());
        }
        session.setAttribute("cart", cart);
        return "show_ShoppingCart";
    }


    //清空购物车
    @RequestMapping(value = "/clear", method = RequestMethod.GET)
    public String clearItem(HttpSession session) {
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        cart.clear();
        session.setAttribute("cart", cart);
        return "show_ShoppingCart";
    }


}	
