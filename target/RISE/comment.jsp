<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/5/15
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
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
        </tr>
    </table>

    <p>房源评价</p>
    <textarea id="commentContent" rows="14" cols="40"></textarea> <br/>
    <p>${msg123}</p>
    <button id="change" type="button" onclick="commentSubmit('${sessionScope.username}', '${house.url}')"> 评价 </button>

    <table>
        <tr>
            <td> 用户名 </td>
            <td> 时间 </td>
            <td> 评论 </td>
        </tr>
        <c:forEach items="${comments}" var="comment">
            <tr>
                <td> ${comment.user.username} </td>
                <td> ${comment.time} </td>
                <td> ${comment.comment} </td>
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

        function commentSubmit(username, url) {
            if (username.length == 0) {
                alert("请先登录后评论");
            } else {
                let date = new Date();
                let commentContent = document.getElementById("commentContent").value;
                let comment = {
                    user: {
                        username: username
                    },
                    house: {
                      url: url
                    },
                    time: date.getFullYear() + "年 "
                        + date.getMonth()  + "月"
                        + date.getDate() + "日 "
                        + date.getHours() + ":" + date.getMinutes(),
                    comment: commentContent
                };
                let xmlHttpRequest = new XMLHttpRequest();
                xmlHttpRequest.onreadystatechange = function() {
                    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                        switch (xmlHttpRequest.responseText) {
                            case "success":
                                window.location.href = window.location.href;
                                alert("评论成功");
                                break;
                            case "fail":
                                alert("每个用户对每个房源仅能评价一次");
                                break;
                            default:
                                alert("服务器错误，评论失败");
                        }
                    }
                    if (xmlHttpRequest.status == 404) {
                        alert("服务器错误，评论失败");
                    }
                };
                xmlHttpRequest.open("POST", "/house/comment/submit", true);
                xmlHttpRequest.setRequestHeader("Content-type", "application/json");
                xmlHttpRequest.send(JSON.stringify(comment));
            }
        }
    </script>
</body>
</html>
