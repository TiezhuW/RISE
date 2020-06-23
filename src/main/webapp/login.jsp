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
    <style type="text/css">
        h2 {text-align: center}

        a {
            color: black;
            text-decoration: none
        }

        input, button {
            padding: 7px;
            border-radius: 4px;
            border: 2px solid black;
            margin: 7px;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: lightblue;
            border: 3px solid black;
        }

        input[type=submit], button {
            background-color: white;
            font-size: 14px;
            transition-duration: 0.4s;
        }

        input[type=submit]:hover, button:hover {
            background-color: grey;
            color: white;
            box-shadow: 0 7px 7px 0 rgba(0,0,0,0.07), 0 14px 14px 0 rgba(0,0,0,0.14)
        }

        .top {text-align: right}
    </style>
</head>
<body>
    <div class="top">
        <a href="/house/homepage"> 返回首页 </a>
        <hr/>
    </div>

    <h2>登录</h2>
    <hr/>

    <form action="/user/login" method="post">
        用户名：<input type="text" name="username"/><br/>
        密码：&emsp;<input type="password" name="password"/><br/>
        <input type="submit" value=" 登录 "/> <span> ${msg} </span>
    </form>
    <hr/>
</body>
</html>
