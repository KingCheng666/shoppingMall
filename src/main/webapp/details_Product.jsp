<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.kc.domain.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>商品详细信息</title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>
<%
    Product product = (Product) session.getAttribute("product");
    Comment cm = (Comment) session.getAttribute("cm");
%>
<center>

    <h2 style="margin-top: 20px">商品详细信息</h2>
    <form name="myform" method='post' action=' ${pageContext.request.contextPath }/addToCart.do'>
        <!--使用隐藏表单域将id请求参数传递给addToCart动作 -->
        <input type='hidden' name='id' value='<%=product.getId() %>'/>

        <a href="list_User.do" class="layui-btn" style="margin-top: 20px">查看商品列表</a>
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
                <tr>
                    <th>商品名</th>
                    <td>${product.pname}</td>
                    <td align="center" rowspan="4"><img src="${product.picture}"></td>
                </tr>
                <tr>
                    <th>类型</th>
                    <td>${product.type}</td>
                </tr>
                <tr>
                    <th>库存</th>
                    <td>${product.stock}</td>
                </tr>
                <th>价格</th>
                <td>${product.price}</td>
                </tr>
                <tr>
                    <th>请输入数量</th>
                    <th>
                        <input type="text" name='quantity' id='quantity' class="layui-input"/>
                    </th>
                    <td><input type='submit' class="layui-btn" value='添加到购物车'
                               onclick="return check(this.form)"/>
                        <a href="showProductComment.do?pname=${product.pname}" class="layui-btn">查看商品评论</a>
                </tr>
            </table>

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
        <!--使用JavaScript脚本保证文本域中输入整数值 -->
        <script language="JavaScript" type="text/javascript">
            function check(form) {
                var regu = /^[1-9]\d*$/;
                if (form.quantity.value == '') {
                    alert("数量值不能为空!");
                    form.quantity.focus();
                    return false;
                }
                if (!regu.test(form.quantity.value)) {
                    alert("必须输入整数!");
                    form.quantity.focus();
                    return false;
                }
            }
        </script>


</center>
</body>
</html>