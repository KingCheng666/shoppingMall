package com.kc.service;

import java.util.List;

import com.kc.domain.Comment;
import com.kc.domain.Order;
import com.kc.domain.Product;

import org.apache.ibatis.annotations.Param;

public interface CommentService {
    //提交评论
    int submitComment(Comment comment);

    //用户查看自己的评论
    List<Comment> queryAllComment(String uname);

    //查看商品评论
    List<Comment> queryProductComment(String pname);

    //管理员查看所有评论
    List<Comment> ManagerAllComment();

    //删除评论
    void deleteComment(int cid);

}
