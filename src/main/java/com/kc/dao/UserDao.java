package com.kc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kc.domain.Product;
import com.kc.domain.User;

public interface UserDao {
    public User findByUname(String uname); //通过用户名查询用户

    public List<User> listU();//查看用户

    //注册用户
    public void register(@Param("uname") String uname, @Param("upassword") String upassword, @Param("utel") String utel, @Param("address") String address);

    public User searchByUname(String uname);// 查询用户

    public int modifyUser(User user); //修改用户

    public User getU(int uid); //获取单个用户
//	 public int findUtel(@Param("utel")String utel);

    //禁用用户
    public int validById(@Param("uid") Integer uid, @Param("valid") String valid);

    //启用用户
    public int validById2(@Param("uid") Integer uid, @Param("valid") String valid);


}