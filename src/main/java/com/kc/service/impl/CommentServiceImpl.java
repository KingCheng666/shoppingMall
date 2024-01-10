package com.kc.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kc.dao.*;
import com.kc.domain.Comment;
import com.kc.domain.Order;
import com.kc.service.*;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;

    //提交评论
    public int submitComment(Comment comment) {
        return commentDao.submitComment(comment);
    }

    //用户查看自己的评论
    public List<Comment> queryAllComment(String uname) {
        return commentDao.queryAllComment(uname);
    }

    //用户查看商品的评论
    public List<Comment> queryProductComment(String pname) {
        return commentDao.queryProductComment(pname);
    }

    //管理员查看所有评论
    public List<Comment> ManagerAllComment() {
        return commentDao.ManagerAllComment();
    }

    //管理员删除评论
    public void deleteComment(int cid) {
        // TODO Auto-generated method stub
        commentDao.deleteComment(cid);
    }


}
