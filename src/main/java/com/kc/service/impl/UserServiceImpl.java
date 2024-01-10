package com.kc.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kc.dao.UserDao;
import com.kc.domain.Product;
import com.kc.domain.User;
import com.kc.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findUserByName(String name) {
        // TODO Auto-generated method stub
        return this.userDao.findByUname(name);
    }

    @Override
    public List<User> list() {
        // TODO Auto-generated method stub
        return userDao.listU();
    }

    public User searchUserByUname(String uname) {
        return this.userDao.searchByUname(uname);
    }

    @Override
    public int modify(User user) {
        // TODO Auto-generated method stub
        return userDao.modifyUser(user);
    }

    @Override
    public User get(int uid) {
        // TODO Auto-generated method stub
        return userDao.getU(uid);
    }

    public void register(String uname, String upassword, String utel, String address) {
        this.userDao.register(uname, upassword, utel, address);
    }

    @Override
    public int validById(Integer uid, String valid) {
        return userDao.validById(uid, valid);
    }

    @Override
    public int validById2(Integer uid, String valid) {
        return userDao.validById2(uid, valid);
    }

}