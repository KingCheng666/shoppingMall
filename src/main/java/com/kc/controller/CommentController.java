package com.kc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kc.domain.Comment;
import com.kc.domain.Order;
import com.kc.domain.Product;
import com.kc.service.CommentService;

@Controller

public class CommentController {
    @Autowired
    private CommentService commentService;

//		@RequestMapping("commentGo")
//		public ModelAndView commentGo(int id,HttpServletResponse response,HttpServletRequest request) {
//			ModelAndView mav = new ModelAndView();
////				Comment m=commentService.get(id);
//			
//			
//			
////			ModelAndView mav = new ModelAndView("Comment_User");
////			mav.addObject("m",m);
//			
////			mav.addObject("m", m);
////			
////			System.out.println("------------"+m);
////			System.out.println("------------"+m);
//			mav.setViewName("Comment_User");
//			return mav;
//		}

    //提交评论
    @RequestMapping("submitComment")
    public void submitComment(Comment comment, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        commentService.submitComment(comment);

        PrintWriter out = response.getWriter();
        out.print("<script>alert('提交评论成功');window.location.href='index_Users.jsp';</script>");
    }

    //查询用户评论
    @RequestMapping("UserComment")
    public ModelAndView queryComment(String uname, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Comment> c = commentService.queryAllComment(uname);
        mav.addObject("c", c);
        mav.setViewName("UserComment");
        return mav;
    }

    //展示商品评论
    @RequestMapping("showProductComment")
    public ModelAndView showProductComment(String pname, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Comment> c = commentService.queryProductComment(pname);
        mav.addObject("c", c);
        mav.setViewName("showProductComment");
        return mav;
    }

    //评论管理
    @RequestMapping("ManagerComment")
    public ModelAndView ManagerComment() {
        ModelAndView mav = new ModelAndView();
        List<Comment> c = commentService.ManagerAllComment();
        mav.addObject("c", c);
        mav.setViewName("ManagerComment");
        return mav;
    }

    //删除评论
    @RequestMapping("deleteComment")
    public void deleteComment(int cid, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
//			out.print("<script>confirm('ȷ��Ҫɾ����')</script>");

        commentService.deleteComment(cid);
        out.print("<script>alert('删除评论成功');window.location.href='ManagerComment.do';</script>");

    }


}
