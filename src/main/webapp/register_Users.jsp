<%@page import="javax.security.auth.login.LoginException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui/lib/layui-v2.5.5/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>

    <title>用户注册</title>
    <script type="text/javascript">
        var xmlHttp;

        function createXMLHttpRequest() {
            if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            } else {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }

        function validate() {
            createXMLHttpRequest();
            var uname = document.getElementById("uname");
            var url = "${pageContext.request.contextPath }/findUsers.do?uname=" + escape(uname.value);
//      var url = "RegisterServlet?uname="+encodeURI(encodeURI(uname));
            xmlHttp.open("GET", url, true);
            xmlHttp.onreadystatechange = handleStateChange;
            xmlHttp.send(null);
        }

        function handleStateChange() {
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    var message = xmlHttp.responseXML.getElementsByTagName("message")[0].firstChild.data;
                    var messageArea = document.getElementById("results");
                    messageArea.innerHTML = "<p><font color='red'>" + message + "</font></p>";
                }
            }
        }
    </script>

</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
%>
<form action="${pageContext.request.contextPath }/register_Users.do" method="post">
    <h2 align="center" style=margin-top:20px>用户注册</h2>
    <hr class="hr15">

    <form method="post" class="layui-form">
        <div class="layui-form-item" style=margin-left:100px>
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="uname" id="uname" onblur="validate()" lay-verify="uname" autocomplete="off"
                       placeholder="请输入用户名" class="layui-input" style=width:1000px>
                <td>
                    <div id="results"></div>
                </td>
            </div>
            <hr class="hr15">
            <div class="layui-form-item">
                <label class="layui-form-label">登录密码</label>
                <div class="layui-input-block">
                    <input type="upassword" name="upassword" placeholder="请输入密码" class="layui-input" style=width:1000px>
                </div>
            </div>
            <hr class="hr15">
            <div class="layui-form-item">
                <label class="layui-form-label">联系方式</label>
                <div class="layui-input-block">
                    <input type="text" name="utel" lay-verify="utel" autocomplete="off" placeholder="请输入联系方式"
                           class="layui-input" style=width:1000px>
                </div>
                <hr class="hr15">
                <div class="layui-form-item">
                    <label class="layui-form-label">收货地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" lay-verify="address" autocomplete="off" placeholder="请输入收货地址"
                               class="layui-input" style=width:1000px>
                    </div>
                    <hr class="hr15">
                    <input type="submit" style=margin-left:500px class="layui-btn" value="注册">
                    <a href="index.jsp" class="layui-btn">返回首页</a>

    </form>

</form>
</body>
</html>