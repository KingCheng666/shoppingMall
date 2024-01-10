<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>查看所有评论</title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>


<center>
    <h2 style="margin-top: 20px">用户评论列表</h2>
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
                <th>评论编号</th>
                <th>商品名</th>
                <th>用户名</th>
                <th>评论时间</th>
                <th>评论内容</th>
                <th>操作</th>
            </tr>
            </thead>

            <c:forEach items="${c}" var="c" varStatus="st">
                <tr>
                    <td>${c.cid}</td>
                    <td>${c.pname}</td>
                    <td>${c.uname}</td>
                    <td><fmt:formatDate value="${c.commentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${c.content}</td>
                    <td>
                        <a href="deleteComment.do?cid=${c.cid}" class="layui-btn layui-btn-danger">删除评论</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
</center>

</body>
</html>