<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>查看商品列表</title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>
<center>
    <h2 style="margin-top: 20px">商品列表</h2>
    <a href="QueryProduct_User.jsp" class="layui-btn" style="margin-top: 20px">查询商品</a>
    <a href="show_ShoppingCart.jsp" class="layui-btn" style="margin-top: 20px">我的购物车</a>
    <a href="index_Users.jsp" class="layui-btn" style="margin-top: 20px">返回</a>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>
    <div class="layui-form">

        <!--
        <div id="demo7">
        <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-10">
            <a href="javascript:;" class="layui-laypage-prev" data-page="1">上一页</a>
            <span class="layui-laypage-curr">
            <em class="layui-laypage-em"></em>
            <em>1</em></span>
            <a href="javascript:;" data-page="2">2</a>
            <a href="javascript:;" data-page="3">3</a>
            <a href="javascript:;" data-page="4">4</a>
            <a href="javascript:;" data-page="5">5</a>
            <span class="layui-laypage-spr">…</span>
            <a href="javascript:;" class="layui-laypage-last" title="尾页" data-page="10">10</a>
            <a href="javascript:;" class="layui-laypage-next" data-page="3">下一页</a>
            <span class="layui-laypage-limits">
                <select lay-ignore="">
                <option value="10" selected="">10 条/页</option>
                <option value="20">20 条/页</option>
                <option value="30">30 条/页</option>
                <option value="40">40 条/页</option><option value="50">50 条/页</option></select>
            </span>
            <a href="javascript:;" data-page="2" class="layui-laypage-refresh">
            <i class="layui-icon layui-icon-refresh"></i></a>
            <span class="layui-laypage-skip">到第<input type="text" min="1" value="2" class="layui-input">页<button type="button" class="layui-laypage-btn">确定</button></span>
            </div>
        </div>
          -->
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>商品号</th>
                <th>商品图片</th>
                <th>商品名</th>
                <th>类型</th>
                <th>库存量</th>
                <th>价格</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>

            <c:forEach items="${ls}" var="p" varStatus="st">
                <tr>
                    <td>${p.id}</td>
                    <td><img src="${p.picture}"></td>
                    <td>${p.pname}</td>
                    <td>${p.type}</td>
                    <td>${p.stock}</td>
                    <td>${p.price}</td>
                    <td>
                        <a href="${pageContext.request.contextPath }/ProductDetails.do?id=${p.id}&pname=${p.pname}"
                           class="layui-btn">加入购物车</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
    <script>
        //完整功能
        laypage.render({
            elem: 'demo7'
            , count: 100
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            , jump: function (obj) {
                console.log(obj)
            }
        });
    </script>


</body>
</html>