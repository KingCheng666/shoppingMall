package com.kc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

import com.kc.domain.Manager;
import com.kc.service.ManagerService;

import javax.servlet.http.HttpServletResponse;

@Controller
//@RequestMapping(value = "/manager")
public class ManagerController {
    @Autowired
    public ManagerService managerService;

    @RequestMapping(value = "/login_Manager", method = RequestMethod.POST)
    public ModelAndView login(Manager model, HttpSession session, HttpServletResponse response, HttpServletRequest request, String check) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        boolean flag = false;  //�������
        check = request.getParameter("check");
        String mid = request.getParameter("mid");
        String mpassword = request.getParameter("mpassword");
        Manager manager = managerService.findManagerById(model.getMid());
        if (manager == null || !manager.getMpassword().equals(model.getMpassword())) {
            return new ModelAndView("redirect:/error_Manager.jsp");
        } else {
            session.setAttribute("manager", manager);
            flag = true;
            if (flag) {
                if ((check != null) && (check.equals(check))) {
                    //设置cookie
                    Cookie midCookie = new Cookie("mid", mid);
                    midCookie.setPath("/");
                    //设置cookie过期时间
                    midCookie.setMaxAge(60 * 60);
                    Cookie mpwdCookie = new Cookie("mpassword", mpassword);
                    mpwdCookie.setPath("/");
                    mpwdCookie.setMaxAge(60 * 60);
                    response.addCookie(midCookie);
                    response.addCookie(mpwdCookie);

                }

                ModelAndView mav = new ModelAndView();
                mav.setViewName("index_Manager");
                return mav;
            }
        }
        return null;

    }
}
    


    

