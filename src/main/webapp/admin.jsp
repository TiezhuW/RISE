<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/6/3
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title> 管理员界面 </title>
</head>

<body>
    <h2> 房源信息添加 </h2>

    <form action="/house/add" method="post">
        城市： <input type="text" name="city" required="required"><br/>
        区域： <input type="text" name="domain" required="required"><br/>
        朝向： <input type="text" name="direction"><br/>
        出租类型： <input type="text" name="type"><br/>
        房源概述： <input type="text" name="name"><br/>
        面积/平方米： <input type="text" name="area"><br/>
        楼层： <input type="text" name="floor"><br/>
        房屋样式： <input type="text" name="layout"><br/>
        电梯： <input type="text" name="lift"><br/>
        地址： <input type="text" name="location"><br/>
        价格： <input type="text" name="price"><br/>
        链接： <input type="text" name="url" required="required"><br/>
        <input type="submit" value="添加">
    </form>
    <p>${msg}</p>
</body>
</html>
