<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/4/26
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>登录</title>
</head>
<body>
    <h2>登录</h2>

    <form action="/user/login" method="post">
        用户名： <input type="text" name="username"/><br/>
        密码： <input type="password" name="password"/><br/>
        <input type="submit" value=" 登录 "/>
    </form>

    <p> ${msg} </p>
    <button onclick="location='/house/homepage'"> 返回首页 </button>
</body>
</html>
