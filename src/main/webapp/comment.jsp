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
    <style type="text/css">
        h2, h3 {text-align: center}

        button, textarea {
            padding: 7px;
            border-radius: 4px;
            border: 2px solid black;
            margin: 7px;
        }

        button {
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

        textarea {
            width: 100%;
            resize: none;
        }

        textarea:focus {
            background-color: lightblue;
            border: 3px solid black;
        }
    </style>
</head>

<body>
    <h2>评价</h2>
    <hr/>

    <h3>房源信息</h3>
    <table>
        <tr>
            <th> 城市 </th>
            <th> 区域 </th>
            <th> 朝向 </th>
            <th> 出租类型 </th>
            <th> 房源概述 </th>
            <th> 面积/平方米 </th>
            <th> 楼层 </th>
            <th> 房屋样式 </th>
            <th> 电梯 </th>
            <th> 地址 </th>
            <th> 价格 </th>
            <th/>
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
            <td>
                <button onclick="moreInfo('${house.url}')"> 详情 </button>
            </td>
        </tr>
    </table>
    <hr/>

    <h3>房源评价</h3>
    <textarea id="commentContent" rows="14" cols="40"></textarea> <br/>
    <div style="text-align: center">
        <button id="change" type="button" onclick="commentSubmit('${sessionScope.username}', '${house.url}')"> 评价 </button>
    </div>

    <table>
        <tr>
            <th> 用户名 </th>
            <th> 时间 </th>
            <th> 评论 </th>
            <td class="delete"/>
        </tr>
        <c:forEach items="${comments}" var="comment">
            <tr>
                <td> ${comment.user.username} </td>
                <td> ${comment.time} </td>
                <td> ${comment.comment} </td>
                <td class="delete"> <button onclick="commentDelete('${comment.user.username}', '${house.url}')"> 删除 </button> </td>
            </tr>
        </c:forEach>
    </table>

    <script>
        let elements = document.getElementsByClassName("delete");
        if ("${sessionScope.username}" != "Administrator") {
            //非管理员模式下隐藏删除按钮
            let len = elements.length;
            for (let i = 0; i < len; i++) {
                elements[i].style.display = "none";
            }
        }

        function moreInfo(url) {
            let xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.open("POST", "/house/moreInfo", true);
            xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest.send("url=" + url);
            window.open(url);
        }

        function commentDelete(username, url) {
            let xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function(){
                if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                        switch (xmlHttpRequest.responseText) {
                            case "success":
                                window.location.href = window.location.href;
                                alert("评论已删除");
                                break;
                            case "fail":
                                alert("评论删除失败");
                                break;
                            default:
                                alert("服务器错误，评论删除失败");
                        }
                    }
                }
                if (xmlHttpRequest.status == 404) {
                    alert("服务器错误,评论删除失败");
                }
            };
            xmlHttpRequest.open("POST", "/house/comment/delete", true);
            xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest.send("username="+ username + "&url=" + url);
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
