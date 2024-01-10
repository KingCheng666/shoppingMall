package com.kc.service;

import com.kc.domain.Manager;

public interface ManagerService {
    //查询管理员信息
    public Manager findManagerById(String id);

}
