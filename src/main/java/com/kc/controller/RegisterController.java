package com.kc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kc.domain.User;
import com.kc.service.UserService;


@Controller
@ResponseBody
public class RegisterController {
    private static final long serialVersionUID = 1L;
    @Autowired
    public UserService userService;

    @RequestMapping(value = "/findUsers")
    public void findUser(User model, HttpServletRequest request,
                         HttpServletResponse response, String uname)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control", "no-cache");

        uname = request.getParameter("uname");
//	    uname = URLDecoder.decode(uname, "UTF-8");
        String message = null;
        User user = userService.findUserByName(model.getUname());

        PrintWriter out = response.getWriter();

        if (user == null) {
            System.out.println("message" + "===========");
            message = "用户名可以使用";
        } else {
            message = "该用户名已存在";
        }

        out.println("<response>");
        out.println("<message>" + message + "</message>");
        out.println("</response>");

    }


    @RequestMapping(value = "/register_Users", method = RequestMethod.POST)
    public void doPost(User model, HttpServletRequest request,
                       HttpServletResponse response, String uname, String upassword, String utel, String address)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        User user = userService.findUserByName(model.getUname());

        if (user == null) {
            userService.register(uname, upassword, utel, address);
            PrintWriter out = response.getWriter();
            out.print("<script>alert('注册成功');window.location.href='login_Users.jsp';</script>");

        }
    }
}


