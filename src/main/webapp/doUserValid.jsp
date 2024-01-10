<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户权限管理</title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
</head>
<body>
<center>
    <h2 style="margin-top: 20px">用户列表</h2>
    <a href="index_Manager.jsp" class="layui-btn" style="margin-top: 20px">返回</a>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>

    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="200">
                <col width="200">
                <col width="300">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>用户名</th>
                <th>联系方式</th>
                <th>收货地址</th>
                <th>状态</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>

            <c:forEach items="${us}" var="u" varStatus="st">
                <tr>
                    <td>${u.uname}</td>
                    <td>${u.utel}</td>
                    <td>${u.address}</td>
                    <td>${u.valid}</td>
                    <td>
                        <a href="${pageContext.request.contextPath }/doValidById2.do?uid=${u.uid}"
                           class="layui-btn">启用</a>
                        <a href="${pageContext.request.contextPath }/doValidById.do?uid=${u.uid}"
                           class="layui-btn layui-btn-danger">禁用</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>