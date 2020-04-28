<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/4/28
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

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
</body>
</html>
