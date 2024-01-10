<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户订单管理</title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
</head>
<body>


<center>
    <h2 style="margin-top: 20px">订单信息列表</h2>
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
                <th>订单号</th>
                <th>用户名</th>
                <th>商品号</th>
                <th>商品名</th>
                <th>数量</th>
                <th>订单提交时间</th>
                <th>卖家状态</th>
                <th>订单状态</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>

            <c:forEach items="${o}" var="o" varStatus="st">
                <tr>
                    <td>${o.oid}</td>
                    <td>${o.uname}</td>
                    <td>${o.id}</td>
                    <td>${o.pname}</td>
                    <td>${o.quantity}</td>
                    <td><fmt:formatDate value="${o.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${o.status}</td>
                    <td>${o.feedback}</td>
                    <td>
                        <a href="${pageContext.request.contextPath }/modifyOrder.do?oid=${o.oid}"
                           class="layui-btn">发货</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath }/deleteOrder.do?oid=${o.oid}"
                           class="layui-btn  layui-btn-danger">删除订单</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
</center>
</body>
</html>