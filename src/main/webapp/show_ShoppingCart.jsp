<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.kc.domain.*" %>
<%@ page import="org.springframework.util.CollectionUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>购物车信息</title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>
<center>
    <%
        // 从会话作用域中取出购物车对象cart
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        // 从购物车中取出每件商品并存储在ArrayList中
        ArrayList<GoodsItem> items = new ArrayList<>();
        if (cart != null) {
            items = new ArrayList<GoodsItem>(cart.getItems());
        } else {
            cart = new ShoppingCart();
        }
    %>


    <h2 style="margin-top: 20px">购物车信息</h2>
    <a href="clear.do" class="layui-btn" style="margin-top: 20px">清空购物车</a>
    <a href="submitOrder.do" class="layui-btn" style="margin-top: 20px">提交订单</a>
    <a href="list_User.do" class="layui-btn" style="margin-top: 20px">继续购物</a>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>
    <div class="layui-form">

        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>数量</th>
                <th>商品名</th>
                <th>价格</th>
                <th>小计</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>
            <%
                // 显示购物车中每件商品信息
                if (!CollectionUtils.isEmpty(items)) {
                    for (GoodsItem goodsItem : items) {
                        Product product = goodsItem.getProduct();
            %>

            <tr>
                <td><%=goodsItem.getQuantity() %>
                </td>
                <td><%=product.getPname() %>
                </td>
                <td><%=product.getPrice() %>
                </td>
                <td><%=((int) (product.getPrice() * goodsItem.getQuantity() * 100 + 0.5)) / 100.00 %>
                </td>
                <td>
                    <a href=" ${pageContext.request.contextPath }/deleteItem.do?id=<%=product.getId() %>"
                       class="layui-btn">删除</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <p style="margin-right:260px;">总计:<%=cart.getTotal() %>
        </p>
    </div>
    <script>
        //完整功能
        laypage.render({
            elem: 'demo7'
            , count: 100
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            , jump: function (obj) {
                console.log(obj)
            }
        });
    </script>

</center>
</body>
</html>