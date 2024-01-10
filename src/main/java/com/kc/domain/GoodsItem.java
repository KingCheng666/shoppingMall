package com.kc.domain;

import java.io.Serializable;

/**
 * 购物车实体类
*/
public class GoodsItem implements Serializable {
    private Product product;    // 商品对象
    private int quantity;       // 商品数量

    public GoodsItem(Product product) {
        this.product = product;
        quantity = 1;
    }

    public GoodsItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

