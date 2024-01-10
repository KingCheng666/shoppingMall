package com.kc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kc.dao.ProductDao;
import com.kc.domain.Product;
import com.kc.service.ProductService;


@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    public List<Product> list() {
        // TODO Auto-generated method stub
        return productDao.listP();
    }

    @Override
    public Product get(int id) {
        // TODO Auto-generated method stub
        return productDao.getP(id);
    }

    @Override
    public List<Product> listSelect(String type) {
        // TODO Auto-generated method stub
        return productDao.listSelectP(type);
    }

    @Override
    public List<Product> listSelect2(String pname) {
        // TODO Auto-generated method stub
        return productDao.listSelectP2(pname);
    }


    @Override
    public int add(Product product) {
        // TODO Auto-generated method stub
        return productDao.addP(product);
    }

    @Override
    public void delete(int id) {
        // TODO Auto-generated method stub
        productDao.deleteP(id);
    }

    @Override
    public int modify(Product product) {
        // TODO Auto-generated method stub
        return productDao.modifyP(product);
    }

    public void update(int id) {
        // TODO Auto-generated method stub
        productDao.updateP(id);
    }


}