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

    <form action="${pageContext.request.contextPath }/select.do" method="post">

        <!--搜索 start-->
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" name="type" lay-verify="type" autocomplete="off" placeholder="请输入商品类型查找"
                       class="layui-input" style="margin-left:550px">
            </div>
            <button class="layui-btn layui-btn-shop" lay-submit="" lay-filter="searchProduct"
                    style="background-color: #009688">
                <i class="layui-icon layui-icon-search"></i>
            </button>
        </div>
    </form>
    <a href="list_Manager.do" class="layui-btn" style="margin-top: 20px">返回商品列表</a>

</center>
</body>
</html>
