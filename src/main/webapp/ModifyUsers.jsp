<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>修改个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
</head>
<body>
<center>
    <h2 style="margin-top: 20px">个人信息</h2>
    <a href="index_Users.jsp" class="layui-btn" style="margin-top: 20px">返回</a>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    </fieldset>
    <form action="${pageContext.request.contextPath }/edit_User.do?uid=${u.uid}" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="uid" value="${u.uname}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-block">
                <input type="text" name="upassword" value="${u.upassword}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
                <input type="text" name="utel" value="${u.utel}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收货地址</label>
            <div class="layui-input-block">
                <input type="text" name="address" value="${u.address}" class="layui-input">
            </div>
        </div>

        <tr align="center">
            <td colspan="3">
                <div class="layui-form-item">
                    <a href="index_Users.jsp" class="layui-btn">返回个人主页</a>
                    <input type="submit" class="layui-btn" value="修改">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </td>
        </tr>
    </form>
</body>
</html>