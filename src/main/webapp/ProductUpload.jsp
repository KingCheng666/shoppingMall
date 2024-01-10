<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head><title>上传商品</title></head>
<body>
<h2 align="center">上传商品</h2>
<center><a href="index_Manager.jsp">
    <button>返回</button>
</a></center>
<hr>
<form action="${pageContext.request.contextPath }/fileUpload.do" enctype="multipart/form-data" method="post">
    <table align="center" border="1" width="60%">
        <tr>
            <td align="right"><font size="5">商品号：</font></td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td align="right"><font size="5">商品名：</font></td>
            <td><input type="text" name="pname"></td>
        </tr>
        <tr>
            <td align="right"><font size="5">商品类别：</font></td>
            <td><input type="text" name="type"></td>
        </tr>
        <tr>
            <td align="right"><font size="5">库存：</font></td>
            <td><input type="text" name="stock"></td>
        </tr>
        <tr>
            <td align="right"><font size="5">价格：</font></td>
            <td><input type="text" name="price"></td>
        </tr>
        <tr>
            <td align="right"><font size="5">图片：</font></td>
            <td><input type="file" name="file"></td>
        </tr>
        <tr align="center">
            <td colspan="3">
                <input type="submit" value="上传">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
