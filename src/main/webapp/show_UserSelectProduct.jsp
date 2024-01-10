<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>详情页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
</head>
<body>
<center>
    <h2 style="margin-top: 20px">商品详情</h2>
    <a href="QueryProduct_User.jsp" class="layui-btn" style="margin-top: 20px">继续搜索商品</a>
    <a href="index.jsp" class="layui-btn" style="margin-top: 20px">返回商城首页</a>
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
                <th>商品号</th>
                <th>商品图片</th>
                <th>商品名</th>
                <th>类型</th>
                <th>库存量</th>
                <th>价格</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>

            <c:forEach items="${c}" var="c" varStatus="st">
                <tr>
                    <td>${c.id}</td>
                    <td><img src="${c.picture}"></td>
                    <td>${c.pname}</td>
                    <td>${c.type}</td>
                    <td>${c.stock}</td>
                    <td>${c.price}</td>
                    <td>
                        <a href="${pageContext.request.contextPath }/ProductDetails.do?id=${c.id}" class="layui-btn">加入购物车</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>
</center>
</body>
</html>