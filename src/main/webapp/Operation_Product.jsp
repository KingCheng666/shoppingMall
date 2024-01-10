<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>查看商品列表</title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
</head>
<body>
<center>
    <h2 style="margin-top: 20px">商品列表</h2>
    <a href="QueryProduct_Manager.jsp" class="layui-btn" style="margin-top: 20px">查询商品</a>
    <a href="index_Manager.jsp" class="layui-btn" style="margin-top: 20px">返回</a>
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

            <c:forEach items="${ls}" var="p" varStatus="st">
                <tr>
                    <td>${p.id}</td>
                    <td><img src="${p.picture}"></td>
                    <td>${p.pname}</td>
                    <td>${p.type}</td>
                    <td>${p.stock}</td>
                    <td>${p.price}</td>
                    <td>
                        <a href="editgo.do?id=${p.id}" class="layui-btn">修改</a>
                        <a href="delete.do?id=${p.id}" class="layui-btn  layui-btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>