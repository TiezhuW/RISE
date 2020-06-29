<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/4/28
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>用户信息</title>
    <style type="text/css">
        h2, h3 {text-align: center}

        a {
            color: black;
            text-decoration: none
        }

        button {
            padding: 7px;
            border-radius: 4px;
            border: 2px solid black;
            margin: 7px;
            background-color: white;
            font-size: 14px;
            transition-duration: 0.4s;
        }

        button:hover {
            background-color: grey;
            color: white;
            box-shadow: 0 7px 7px 0 rgba(0,0,0,0.07), 0 14px 14px 0 rgba(0,0,0,0.14)
        }

        table {
            border-collapse: collapse;
            width: 100%
        }

        th, td {
            border: 1px solid black;
            text-align: center;
            padding: 4px;
            white-space: nowrap
        }

        .top {text-align: right}

        ul {
            list-style-type: none;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="top">
        <a href="/house/homepage"> 返回首页 </a>
        <a href="/user/quit"> 退出登录 </a>
        <hr/>
    </div>

    <h2> 用户信息 </h2>
    <hr/>


    <ul>
        <li> 用户名：${sessionScope.username} </li>
        <li> 邮箱：&emsp;${sessionScope.email} </li>
        <li> 手机号：${sessionScope.phone} </li>
    </ul>
    <hr/>

    <h3> 已收藏房源 </h3>
    <table>
        <tr>
            <th> 城市 </th>
            <th> 区域 </th>
            <th> 朝向 </th>
            <th> 出租类型 </th>
            <th> 房源概述 </th>
            <th> 面积/m<sup>2</sup> </th>
            <th> 楼层 </th>
            <th> 房屋样式 </th>
            <th> 电梯 </th>
            <th> 地址 </th>
            <th> 价格 </th>
            <th/><th/>
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
                <td>
                    <button onclick="moreInfo('${house.url}')"> 详情 </button>
                </td>
                <td>
                    <button onclick="cancelCollect('${sessionScope.username}', '${house.url}')"> 取消收藏 </button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <hr/>

    <script>
        function moreInfo(url) {
            let xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.open("POST", "/house/moreInfo", true);
            xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest.send("url=" + url);
            window.open(url);
        }

        function cancelCollect(username, url) {
            let xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function() {
                if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                    switch (xmlHttpRequest.responseText) {
                        case "success":
                            window.location.href = window.location.href;
                            alert("收藏取消成功");
                            break;
                        case "fail":
                            alert("收藏取消失败");
                            break;
                        default:
                            alert("服务器错误，收藏取消失败");
                    }
                }
                if (xmlHttpRequest.status == 404) {
                    alert("服务器错误，收藏取消失败");
                }
            };
            xmlHttpRequest.open("POST", "/house/cancelCollect", true);
            xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest.send("username=" + username + "&url=" + url);
        }
    </script>
</body>
</html>
