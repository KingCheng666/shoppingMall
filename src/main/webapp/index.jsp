<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="fly-html-layui fly-html-store">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/global.css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/global(1).css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/store.css" charset="utf-8">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/statics/front/images/logo.png">
    <title>立即淘商城</title>
<body>
<!-- 顶部start -->
<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li class="layui-nav-item layui-hide-xs" style="margin-right:1200px">立即淘商城</li>
        </ul>

        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav" href="JavaScript:void(0);">首页</a>
            </li>
            <li data-id="login_Users" class="layui-nav-item layui-hide-xs ">
                <a class="fly-case-active" data-type="toTopNav" href="login_Users.jsp">用户登录</a>
            </li>
            <li data-id="login_Manager" class="layui-nav-item layui-hide-xs ">
                <a class="fly-case-active" data-type="toTopNav" href="login_Manager.jsp">后台登录</a>
            </li>
            <span class="layui-nav-bar" style="left: 560px; top: 55px; width: 0px; opacity: 0;"></span>
        </ul>
    </div>
</div>
<!-- 顶部end -->

<!-- 中间区域开始 -->
<div class="shop-nav shop-index">
    <!--搜索 start-->
    <div id="LAY-topbar" style="height: auto;">
        <form class="layui-form layuimini-form" action="${pageContext.request.contextPath }/select2.do" method="post">
            <div class="input-search">
                <div id="search">
                    <input type="text" placeholder="搜索你想要的商品" name="pname" id="searchKeywords"
                           autocomplete="off" value="">
                    <button class="layui-btn layui-btn-shop" lay-submit="" lay-filter="searchProduct"
                            style="background-color: #009688">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </div>
                <div class="layui-container layui-hide-xs"><a href="#" class="topbar-logo">
                    <img src="${pageContext.request.contextPath}/statics/front/images/logo-1.png" alt="layui"> </a>
                </div>
            </div>
        </form>
    </div>
    <!--搜索 end-->

    <!-- 轮播图开始 -->
    <div class="layui-carousel" lay-filter="LAY-store-banner" id="LAY-store-banner" lay-anim lay-indicator="inside">
        <div carousel-item>
            <div class="layui-this">
                <div class="layui-container"><a href="javascript:;" target="_blank">
                    <img src="${pageContext.request.contextPath}/statics/front/images/1.png" alt="立即淘商城系统"></a>
                </div>
            </div>
            <div class="">
                <div class="layui-container"><a href="javascript:;" target="_blank">
                    <img src="${pageContext.request.contextPath}/statics/front/images/2.png" alt="立即淘商城系统"></a>
                </div>
            </div>
            <div class="">
                <div class="layui-container"><a href="javascript:;" target="_blank">
                    <img src="${pageContext.request.contextPath}/statics/front/images/3.png" alt="立即淘商城系统"> </a>
                </div>
            </div>
            <div class="">
                <div class="layui-container"><a href="javascript:;" target="_blank">
                    <img src="${pageContext.request.contextPath}/statics/front/images/4.png" alt="立即淘商城系统"> </a>
                </div>
            </div>
            <div class="">
                <div class="layui-container"><a href="javascript:;" target="_blank">
                    <img src="${pageContext.request.contextPath}/statics/front/images/5.png" alt="立即淘商城系统"> </a>
                </div>
            </div>
            <div class="">
                <div class="layui-container"><a href="javascript:;" target="_blank">
                    <img src="${pageContext.request.contextPath}/statics/front/images/6.png" alt="立即淘商城系统"> </a>
                </div>
            </div>
        </div>


        <div class="layui-carousel-ind">
            <ul>
                <li class="layui-this"></li>
                <li class=""></li>
                <li class=""></li>
                <li class=""></li>
                <li class=""></li>
                <li class=""></li>
            </ul>
        </div>
        <button class="layui-icon layui-carousel-arrow" lay-type="sub"></button>
        <button class="layui-icon layui-carousel-arrow" lay-type="add"></button>
    </div>
    <!-- 轮播图结束 -->

    <!-- 底部 -->
    <div class="fly-footer">
        <p><a href="#">版权所有©</a>立即淘商城 </p>
        <p>联系我们</p>
    </div>


    <script>
        layui.use(["form", "element", "carousel"], function () {
            var form = layui.form,
                layer = layui.layer,
                element = layui.element,
                carousel = layui.carousel,
                $ = layui.$;

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });

            //渲染轮播图
            carousel.render({
                elem: '#LAY-store-banner'
                , width: '100%' //设置容器宽度
                , height: '460' //设置容器高度
                , arrow: 'always' //始终显示箭头
            });
        });
    </script>

    <ul class="layui-fixbar">
        <li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li>
    </ul>
    <div class="layui-layer-move"></div>

</body>
</html>
