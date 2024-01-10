package com.kc.service;

import java.util.List;

import com.kc.domain.Product;


public interface ProductService {
    List<Product> list();//查看所有商品

    Product get(int id); //获取单个商品

    List<Product> listSelect(String type); //按商品类型模糊查询商品

    List<Product> listSelect2(String pname); //按商品名模糊查询商品

    int add(Product product); // 新增商品

    void delete(int id); // 删除商品

    int modify(Product product); // 修改商品

    void update(int id); //更新商品库存


}

