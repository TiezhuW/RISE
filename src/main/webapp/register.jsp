<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/4/26
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>注册</title>
</head>

<body>
    <h2>注册</h2>

    <form action="/user/register" method="post">
        用户名： <input type="text" name="username"><p>${usernameMsg}</p><br/>
        密码： <input type="password" name="password"><p>${passwordMsg}</p><br/>
        邮箱： <input type="email" name="email"><p>${emailMsg}</p><br/>
        手机号： <input type="text" name="phone"><p>${phoneMsg}</p><br/>
        <input type="submit" value="注册">
    </form>

    <p>${msg}</p>
    <button onclick="location='/house/homepage'">返回首页</button>
</body>
</html>
