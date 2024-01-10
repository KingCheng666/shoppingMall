<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>立即淘商城-用户主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">立即淘商城</div>
        <!-- 头部区域
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item"><a href="">控制台</a></li>
          <li class="layui-nav-item"><a href="login_Users.jsp">商品管理</a></li>
          <li class="layui-nav-item"><a href="">用户</a></li>
        </ul>
        -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src=" ${pageContext.request.contextPath}/statics/front/images/logo.png" class="layui-nav-img">
                    欢迎您，${u.uname}！
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="searchUser.do?uid=${u.uid}">个人资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="index.jsp">商城首页</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">

                <li class="layui-nav-item">
                    <a href="javascript:;">去购物</a>
                    <dl class="layui-nav-child">
                        <dd><a href="list_User.do">商品列表</a></dd>
                        <dd><a href="show_ShoppingCart.jsp">我的购物车</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="OrderUser.do?uname=${u.uname}">我的订单</a>
                </li>
                <li class="layui-nav-item">
                    <a href="UserComment.do?uname=${u.uname}">我的评论</a>
                </li>
                <li class="layui-nav-item">
                    <a href="fileDownload.do">了解更多</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <img src="statics/front/images/logo.png">
        <span style="padding: 15px;font-size:30px;margin-left:80px;margin-bottom:50px">欢迎进入立即淘网上购物商城！</span>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <p><a href="#">版权所有©</a>立即淘商城 </p>
    </div>
</div>

<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>
</html>