package com.kc.dao;

import com.kc.domain.Product;

import java.util.List;


public interface ProductDao {
    //	public Product findById(int id);
    public List<Product> listP();//查看所有商品

    public Product getP(int id); // 获取单个商品

    public List<Product> listSelectP(String type); //按商品类型模糊查询商品

    public List<Product> listSelectP2(String pname); //按商品名模糊查询商品

    public int addP(Product product); // 新增商品

    public void deleteP(int id); // 删除商品

    public int modifyP(Product product); //修改商品

    public void updateP(int id);  //更新商品库存


}
