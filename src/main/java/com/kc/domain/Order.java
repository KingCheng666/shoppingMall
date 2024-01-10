package com.kc.domain;

import java.util.Date;

import lombok.Data;

/**
 * 商品订单实体类
*/
@Data
public class Order {
    private Integer oid;//商品订单id
    private String uname;
    private int id;
    private String pname;
    private Integer quantity;
    private Date orderTime;
    private String status;
    private String feedback;

    public Order() {
    }

    public Order(Integer oid, String uname, int id, String pname, Integer quantity, Date orderTime, String status, String feedback) {
        this.oid = oid;
        this.uname = uname;
        this.id = id;
        this.pname = pname;
        this.quantity = quantity;
        this.orderTime = orderTime;
        this.status = status;
        this.feedback = feedback;

    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }


}
