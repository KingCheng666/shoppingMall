package com.kc.domain;

/**
 * 商品实体类
*/
public class Product {
    private int id;  //商品id
    private String pname;  //商品名
    private String type;  //商品类型
    private int stock;  //商品库存
    private float price;  //商品价格
    private String picture; //商品图片路径

    public Product() {
        super();
    }

    public Product(int id, String pname, String type, int stock, float price, String picture) {
        super();
        this.id = id;
        this.pname = pname;
        this.type = type;
        this.stock = stock;
        this.price = price;
        this.picture = picture;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

}