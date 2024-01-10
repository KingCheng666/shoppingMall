<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>立即淘商城-后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理系统</div>
        <!-- 头部区域
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item"><a href="">控制台</a></li>
          <li class="layui-nav-item"><a href="login_Users.jsp">商品管理</a></li>
          <li class="layui-nav-item"><a href="">用户</a></li>
        </ul>
        -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <img src=" ${pageContext.request.contextPath}/statics/front/images/logo.png" class="layui-nav-img">
                你好，管理员！
            </li>
            <li class="layui-nav-item"><a href="index.jsp">商城首页</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="javascript:;">商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="list_Manager.do">商品列表</a></dd>
                        <dd><a href="addProduct.jsp">上传商品</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="OrderManager.do">用户订单管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="ManagerComment.do">用户评论管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="AllUser.do">用户权限管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <img src="statics/front/images/logo.png">
        <span style="padding: 15px;font-size:30px;margin-left:80px;margin-bottom:50px">欢迎进入立即淘后台管理系统！</span>
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