<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/4/28
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>用户信息</title>
</head>
<body>
    <h2>用户信息</h2>

    <p>用户名： ${sessionScope.username}</p>
    <p>邮箱： ${sessionScope.email}</p>
    <p>手机号： ${sessionScope.phone}</p>
    <button onclick="location='/user/quit'">退出登录</button>
    <button onclick="location='/house/homepage'">返回首页</button>
    <hr/>

    <p>已收藏房源：</p>
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
        <c:forEach items="${collection}" var="house">
            <tr>
                <td> ${house.city} </td>
                <td> ${house.domain} </td>
                <td> ${house.direction} </td>
                <td> ${house.type} </td>
                <td> ${house.name} </td>
                <td> ${house.area} </td>
                <td> ${house.floor} </td>
                <td> ${house.layout} </td>
                <td> ${house.lift} </td>
                <td> ${house.location} </td>
                <td> ${house.price} </td>
                <td> <button onclick="moreInfo('${house.url}')"> 详情 </button> </td>
                <td> <button onclick="cancelCollect('${sessionScope.username}', '${house.url}')"> 取消收藏 </button> </td>
            </tr>
        </c:forEach>
    </table>

    <script>
        function moreInfo(url) {
            let xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.open("POST", "/house/moreInfo", true);
            xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest.send("url=" + url);
            window.open(url);
        }

        function cancelCollect(username, url) {
            let xmlHttpRequest1 = new XMLHttpRequest();
            xmlHttpRequest1.open("POST", "/house/cancelCollect", true);
            xmlHttpRequest1.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest1.send("username=" + username + "&url=" + url);
            //refresh
        }
    </script>
</body>
</html>
