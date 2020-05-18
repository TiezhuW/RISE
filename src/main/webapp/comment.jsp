<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/5/15
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>评价</title>
</head>
<body>
    <h2>评价</h2>

    <p>房源信息</p>
    <table>
        <tr>
            <td> 城市 </td>
            <td> 区域 </td>
            <td> 朝向 </td>
            <td> 出租类型 </td>
            <td> 房源概述 </td>
            <td> 面积/平方米 </td>
            <td> 楼层 </td>
            <td> 房屋样式 </td>
            <td> 电梯 </td>
            <td> 地址 </td>
            <td> 价格 </td>
            <td> 链接 </td>
        </tr>
        <tr>
            <!-- house information -->
        </tr>
    </table>

    <p>房源评价</p>
    <!-- action -->
    <form action="" method="post">
        <textarea name="comment" rows="14" cols="40"></textarea> <br/>
        <input type="submit" value="评价">
    </form>

    <table>
        <tr>
            <td> 用户名 </td>
            <td> 时间 </td>
            <td> 评论 </td>
        </tr>
        <!-- for each comment -->
    </table>
</body>
</html>