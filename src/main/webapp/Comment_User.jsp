<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户发表评论</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
</head>
<body>

<center>
    <h2 style="margin-top:20px">发表评论</h2>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>
    <form method="post" action="${pageContext.request.contextPath }/submitComment.do">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名</label>
            <div class="layui-input-block">
                <input type="text" name="pname" value="${param.pname}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="uname" value="${param.uname}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">评论文字</label>
            <div class="layui-input-block">
                <textarea name="content" placeholder="请输入评论的文字" class="layui-textarea"></textarea>
            </div>
        </div>

        <tr align="center">
            <td colspan="3">
                <div class="layui-form-item">
                    <input type="submit" class="layui-btn" value="提交">
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