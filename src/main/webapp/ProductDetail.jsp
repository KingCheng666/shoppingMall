<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>详情页面</title>
</head>
<body>
<center>
    <h2>商品详情</h2>
    <a href="list_Manager.do">
        <button>返回</button>
    </a>
    <hr>
    <table border="1" cellpadding="5" cellspacing="0" width="60%">

        <tr align="center">
            <th>商品号</th>
            <th>商品名</th>
            <th>类型</th>
            <th>库存</th>
            <th>价格</th>
        </tr>
        <tr align="center">
            <td>${c.id}</td>
            <td>${c.pname}</td>
            <td>${c.type}</td>
            <td>${c.stock}</td>
            <td>${c.price}</td>
        </tr>
    </table>

</center>
</body>
</html>