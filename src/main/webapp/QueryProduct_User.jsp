<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>商品查询</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
</head>
<body>
<center>
    <h2 style="margin-top: 20px">查询商品信息</h2>

    <hr>

    <form action="${pageContext.request.contextPath }/select2.do" method="post">

        <!--搜索 start-->
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" name="pname" lay-verify="pname" autocomplete="off" placeholder="搜索你想要的商品"
                       class="layui-input" style="margin-left:550px">
            </div>
            <button class="layui-btn layui-btn-shop" lay-submit="" lay-filter="searchProduct"
                    style="background-color: #009688">
                <i class="layui-icon layui-icon-search"></i>
            </button>
        </div>
    </form>
    <a href="list_User.do" class="layui-btn" style="margin-top: 20px">返回商品列表</a>

</center>
</body>
</html>
