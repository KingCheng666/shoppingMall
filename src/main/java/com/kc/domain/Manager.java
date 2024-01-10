package com.kc.domain;

import java.io.Serializable;
/**
 * 管理员实体类
*/
public class Manager implements Serializable {
    private String mid;  //管理员账号
    private String mpassword;  //管理员密码
    private String mtel;  //联系方式

    public Manager() {
    }

    public Manager(String mid, String mpassword, String mtel) {
        super();
        this.mid = mid;
        this.mpassword = mpassword;
        this.mtel = mtel;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMpassword() {
        return mpassword;
    }

    public void setMpassword(String mpassword) {
        this.mpassword = mpassword;
    }

    public String getMtel() {
        return mtel;
    }

    public void setMtel(String mtel) {
        this.mtel = mtel;
    }


}
