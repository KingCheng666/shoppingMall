<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改商品</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>
<center>
    <h2 style="margin-top:20px">修改商品</h2>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>
    <form method="post" action="${pageContext.request.contextPath }/edit.do">
        <div class="layui-form-item">
            <label class="layui-form-label">商品号</label>
            <div class="layui-input-block">
                <input type="text" name="id" value="${c.id}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名</label>
            <div class="layui-input-block">
                <input type="text" name="pname" value="${c.pname}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品类别</label>
            <div class="layui-input-block">
                <input type="text" name="type" value="${c.type}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-block">
                <input type="text" name="stock" value="${c.stock}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" name="price" value="${c.price}" class="layui-input">
            </div>
        </div>

        <tr align="center">
            <td colspan="3">
                <div class="layui-form-item">
                    <a href="list_Manager.do" class="layui-btn">返回</a>
                    <input type="submit" class="layui-btn" value="修改">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </td>
        </tr>
    </form>

</body>
</html>