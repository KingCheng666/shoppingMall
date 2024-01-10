package com.kc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

import com.kc.domain.Product;
import com.kc.domain.User;
import com.kc.service.UserService;


@Controller
//@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    public UserService userService;

    @RequestMapping(value = "/login_Users", method = RequestMethod.POST)
    public ModelAndView login(User model, HttpSession session, HttpServletResponse response, HttpServletRequest request, String check) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        boolean flag = false;
        check = request.getParameter("check");
        String uname = request.getParameter("uname");
        String upassword = request.getParameter("upassword");

        User u = userService.findUserByName(model.getUname());
//    	User user = userService.findUserByName(model.getUname());
        String b = "禁用";
        if (u == null || !u.getUpassword().equals(model.getUpassword()) || u.getValid().equals(b)) {
            return new ModelAndView("redirect:/error_Users.jsp");
        } else {
            session.setAttribute("u", u);
            flag = true;
            if (flag) {
                if ((check != null) && (check.equals(check))) {
                    //��������Cookie����
                    Cookie unameCookie = new Cookie("uname", uname);
                    unameCookie.setPath("/");
                    //����Cookie����Ч��
                    unameCookie.setMaxAge(60 * 60);
                    Cookie upwdCookie = new Cookie("upassword", upassword);
                    upwdCookie.setPath("/");
                    upwdCookie.setMaxAge(60 * 60);
                    response.addCookie(unameCookie);
                    response.addCookie(upwdCookie);

                }

                ModelAndView mav = new ModelAndView();
                mav.setViewName("index_Users");
                return mav;
            }
        }
        return null;
    }

    //查询用户
    @RequestMapping("/searchUser")
    public ModelAndView search(int uid, HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
//		String uname=request.getParameter("uname");
//		int uid= Integer.parseInt(request.getParameter("uid"));

        System.out.println(uid);

        User u = userService.get(uid);

//		System.out.println(u);
        ModelAndView mav = new ModelAndView();
        mav.addObject("u", u);
        mav.setViewName("show_Users");

        return mav;
    }

    //去编辑用户
    @RequestMapping("editgo_User")
    public ModelAndView editgoUser(int uid) {
        User u = userService.get(uid);
        ModelAndView mav = new ModelAndView("ModifyUsers");
        mav.addObject("u", u);
        return mav;
    }

    //修改用户信息
    @RequestMapping("edit_User")
    public void ModifyUser(User user, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        System.out.println(user);
        userService.modify(user);

        PrintWriter out = response.getWriter();
        out.print("<script>alert('修改成功');window.location.href='index_Users.jsp';</script>");
    }

    @RequestMapping("AllUser")
    public ModelAndView AllUser() {
        ModelAndView mav = new ModelAndView();
        List<User> us = userService.list();
        mav.addObject("us", us);
        mav.setViewName("doUserValid");
        return mav;
    }

    //禁用用户
    @RequestMapping("doValidById")
    @ResponseBody
    public void doValidById(Integer uid, String valid, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        userService.validById(uid, valid);
        PrintWriter out = response.getWriter();
        out.print("<script>alert('禁用成功');window.location.href='AllUser.do';</script>");
    }

    //启用用户
    @RequestMapping("doValidById2")
    @ResponseBody
    public void doValidById2(Integer uid, String valid, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        userService.validById2(uid, valid);
        PrintWriter out = response.getWriter();
        out.print("<script>alert('启用成功');window.location.href='AllUser.do';</script>");
    }



}
    


    
