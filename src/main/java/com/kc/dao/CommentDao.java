package com.kc.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kc.domain.Comment;
import com.kc.domain.Order;
import com.kc.domain.Product;

public interface CommentDao {
    //提交评论
    public int submitComment(Comment comment);

    //查询所有评论
    public List<Comment> queryAllComment(String uname);

    //查询商品评论
    public List<Comment> queryProductComment(String pname);


    //管理所有评论
    public List<Comment> ManagerAllComment();

    //删除评论
    public void deleteComment(int cid);


}
