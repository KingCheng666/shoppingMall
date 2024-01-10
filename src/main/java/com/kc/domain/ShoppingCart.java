package com.kc.domain;

import java.util.*;

public class ShoppingCart {
    HashMap<Integer, GoodsItem> items = null;

    public ShoppingCart() {
        items = new HashMap<Integer, GoodsItem>();
    }

    //加入购物车
    public void add(GoodsItem goodsItem) {
        int productid = goodsItem.getProduct().getId();
        if (items.containsKey(productid)) {
            GoodsItem scitem = (GoodsItem) items.get(productid);
            scitem.setQuantity(scitem.getQuantity() + goodsItem.getQuantity());
        } else {
            items.put(productid, goodsItem);
        }
    }

    //购物车删除单个商品
    public void remove(Integer productid) {
        if (items.containsKey(productid)) {
            GoodsItem scitem = (GoodsItem) items.get(productid);
            scitem.setQuantity(scitem.getQuantity() - 1);
            if (scitem.getQuantity() <= 0)
                items.remove(productid);
        }
    }

    public Collection<GoodsItem> getItems() {
        return items.values();
    }

    //获取总价格
    public double getTotal() {
        double amount = 0.0;
        for (Iterator<GoodsItem> i = getItems().iterator(); i.hasNext(); ) {
            GoodsItem item = (GoodsItem) i.next();
            Product product = (Product) item.getProduct();
            amount += item.getQuantity() * product.getPrice();
        }
        return roundOff(amount);
    }

    private double roundOff(double x) {
        long val = Math.round(x * 100); // cents
        return val / 100.0;
    }

    //清空购物车
    public void clear() {
        items.clear();
    }
}

