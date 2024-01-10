package com.kc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kc.domain.Product;
import com.kc.domain.User;
import com.kc.service.ProductService;


@Controller
@RequestMapping("")
public class ProductController {

    @Autowired
    public ProductService productService;

    // ����
//	@RequestMapping("fanhui")
//	public ModelAndView fanhui() {
//		ModelAndView mav = new ModelAndView("redirect:/list");
//		return mav;
//	}

    //管理员查看商品列表
    @RequestMapping("list_Manager")
    public ModelAndView list_Manager() {
        ModelAndView mav = new ModelAndView();
        List<Product> ls = productService.list();
        mav.addObject("ls", ls);
        mav.setViewName("Operation_Product");
        return mav;
    }

    // 用户查看商品列表
    @RequestMapping("list_User")
    public ModelAndView list_User(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Product> ls = productService.list();
        session.setAttribute("ls", ls);
        mav.addObject("ls", ls);
        mav.setViewName("show_AllProduct");
        return mav;
    }

    // 查看商品详情
    @RequestMapping("get")
    public ModelAndView get(int id) {
        Product c = productService.get(id);
        ModelAndView mav = new ModelAndView("ProductDetail");
        mav.addObject("c", c);
        return mav;
    }

    //按商品类型模糊查询商品
    @RequestMapping("select")
    public ModelAndView select(String type, HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("UTF-8");
        List<Product> c = productService.listSelect(type);
        ModelAndView mav = new ModelAndView("show_SelectProduct");
        mav.addObject("c", c);
        return mav;
    }

    //按商品名称模糊查询商品
    @RequestMapping("select2")
    public ModelAndView select2(String pname, HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("UTF-8");
        List<Product> c = productService.listSelect2(pname);
        ModelAndView mav = new ModelAndView("show_UserSelectProduct");
        mav.addObject("c", c);
        return mav;
    }

    //去修改商品
    @RequestMapping("editgo")
    public ModelAndView editgo(int id) {
        Product c = productService.get(id);
        ModelAndView mav = new ModelAndView("Modify_Product");
        mav.addObject("c", c);
        return mav;
    }

    //编辑修改商品
    @RequestMapping("edit")
    public void modify(Product product, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        productService.modify(product);

        PrintWriter out = response.getWriter();
        out.print("<script>alert('商品修改成功');window.location.href='list_Manager.do';</script>");
    }

    //删除商品
    @RequestMapping("delete")
    public void delete(int id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        productService.delete(id);
        out.print("<script>alert('商品删除成功');window.location.href='list_Manager.do';</script>");

    }

    // 去新增商品
    @RequestMapping("addgo")
    public ModelAndView addgo() {
        ModelAndView mav = new ModelAndView("addProduct");
        return mav;
    }

    // 新增商品
    @RequestMapping("add")
    public void add(MultipartFile file, Product product, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        productService.add(product);

        PrintWriter out = response.getWriter();
        out.print("<script>alert('商品新增成功');window.location.href='list_Manager.do';</script>");
//		ModelAndView mav = new ModelAndView("redirect:/Operation_Product");
//		return mav;
    }


}