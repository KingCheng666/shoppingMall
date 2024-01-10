package com.kc.domain;

public class User {
    private String uname;  //用户名
    private int uid;  //用户id
    private String upassword;  //用户密码
    private String utel;  //联系方式
    private String address;  //联系地址
    private String valid; //用户状态

    public User() {
        super();
    }

    public User(String uname, int uid, String upassword, String utel, String address, String valid) {
        super();
        this.uname = uname;
        this.uid = uid;
        this.upassword = upassword;
        this.utel = utel;
        this.address = address;
        this.valid = valid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }
}

