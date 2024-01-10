<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
</head>
<body>
<center>
    <h2 style="margin-top: 20px">个人信息</h2>
    <a href="editgo_User.do?uid=${u.uid}" class="layui-btn" style="margin-top: 20px">修改个人信息</a>
    <a href="index_Users.jsp" class="layui-btn" style="margin-top: 20px">返回</a>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>

    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="50">
                <col width="50">
                <col width="50">
                <col>
            </colgroup>
            <tr align="center">
                <td>用户名</td>
                <td>${u.uname}</td>
            </tr>
            <tr align="center">
                <td>联系方式</td>
                <td>${u.utel} </td>
            </tr>
            <tr align="center">
                <td>收货地址</td>
                <td>${u.address}</td>
            </tr>

        </table>
    </div>
</body>
</html>
