package com.kc.domain;

import java.util.Date;

import lombok.Data;

/**
 * 商品评论实体类
*/
@Data
public class Comment {
    private int cid;
    private String pname;
    private String uname;
    private Date commentTime;
    private String content;

    public Comment() {
    }

    public Comment(int cid, String pname, String uname, Date commentTime, String content) {
        this.cid = cid;
        this.pname = pname;
        this.uname = uname;
        this.commentTime = commentTime;
        this.content = content;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


}
