package com.kc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kc.dao.ManagerDao;
import com.kc.dao.UserDao;
import com.kc.domain.Manager;
import com.kc.domain.User;
import com.kc.service.ManagerService;
import com.kc.service.UserService;


@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;

    @Override
    public Manager findManagerById(String id) {
        // TODO Auto-generated method stub
        return this.managerDao.findByMid(id);
    }

//    public int findUtel(String utel) {
//		if(userDao.findUtel(utel)==0){
//			return 0;
//		}
//		return 1;
//	}

}
