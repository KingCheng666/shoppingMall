<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加商品</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>
<center>
    <h2 style="margin-top:20px">添加商品</h2>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>
    <form method="post" action="${pageContext.request.contextPath }/add.do">
        <div class="layui-form-item">
            <label class="layui-form-label">商品号</label>
            <div class="layui-input-block">
                <input type="text" name="id" placeholder="请输入商品号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名</label>
            <div class="layui-input-block">
                <input type="text" name="pname" placeholder="请输入商品名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品类别</label>
            <div class="layui-input-block">
                <input type="text" name="type" placeholder="请输入商品类别" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-block">
                <input type="text" name="stock" placeholder="请输入库存" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" name="price" placeholder="请输入价格" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品图片</label>
	            <div class="layui-input-block">
	                <input type="file" name="picture" class="layui-input">
	            </div>
        </div>


        <tr align="center">
            <td colspan="3">
                <div class="layui-form-item">
                    <a href="list_Manager.do" class="layui-btn">返回</a>
                    <input type="submit" class="layui-btn" value="添加">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </td>
        </tr>
    </form>

    <script>
        layui.use('upload', function () {
            var $ = layui.jquery
                , upload = layui.upload;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#test1'
                , url: 'https://httpbin.org/post' //改成您自己的上传接口
                , before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                , done: function (res) {
                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg('上传失败');
                    }
                    //上传成功
                }
                , error: function () {
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });
    </script>

</body>
</html>