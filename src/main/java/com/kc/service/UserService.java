package com.kc.service;

import java.util.List;

import com.kc.domain.Product;
import com.kc.domain.User;

public interface UserService {
    //按用户名查询用户
    public User findUserByName(String name);

    //查询用户列表
    List<User> list();

    //注册用户
    void register(String uname, String upassword, String utel, String address);

    public User searchUserByUname(String uname);

    //修改用户
    int modify(User user);

    //按用户id查询用户
    User get(int uid);

    //禁用用户
    int validById(Integer uid, String valid);

    //启用用户
    int validById2(Integer uid, String valid);
}