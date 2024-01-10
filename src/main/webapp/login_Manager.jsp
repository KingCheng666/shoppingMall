<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.mydomain.com/sample" prefix="demo" %>
<!DOCTYPE html>
<html>
<head><title>立即淘商城-管理员登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui/lib/layui-v2.5.5/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>
<center>

    <form action="${pageContext.request.contextPath }/login_Manager.do" method="post">
        <div class="login layui-anim layui-anim-up">
            <div class="message">管理员后台登录</div>
            <div id="darkbannerwrap"></div>

            <form method="post" class="layui-form">
                <input name="mid" placeholder="用户名" type="text" lay-verify="required" lay-reqText="请输入登录用户名"
                       class="layui-input" value="${cookie.mid.value}">
                <hr class="hr15">
                <input name="mpassword" lay-verify="required" lay-reqText="请输入密码" placeholder="密码" type="password"
                       class="layui-input" value="${cookie.mpassword.value}">
                <hr class="hr15">
                <input type="checkbox" name="check" value="check"> 记住密码
                <hr class="hr15">
                <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
                <hr class="hr20">
                <a href="index.jsp" class="layui-btn">返回首页</a>
            </form>
        </div>
    </form>
</center>
</body>
</html>