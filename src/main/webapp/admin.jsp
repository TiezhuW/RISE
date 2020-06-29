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

        input[type=text]:focus {
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

        .top {text-align: right;}
    </style>
</head>

<body>
    <div id="all">
        <div class="top">
            <a href="/house/homepage"> 返回首页 </a>
            <a href="/user/quit"> 退出登录 </a>
            <hr/>
        </div>

        <h2> 房源信息添加 </h2>
        <hr/>

        <form action="/house/add" method="post">
            城市：&emsp;&emsp;<input type="text" name="city" required="required"><br/>
            区域：&emsp;&emsp;<input type="text" name="domain" required="required"><br/>
            朝向：&emsp;&emsp;<input type="text" name="direction"><br/>
            出租类型：<input type="text" name="type"><br/>
            房源概述：<input type="text" name="name"><br/>
            面积/m<sup>2</sup>：<input type="text" name="area"><br/>
            楼层：&emsp;&emsp;<input type="text" name="floor"><br/>
            房屋样式：<input type="text" name="layout"><br/>
            电梯：&emsp;&emsp;<input type="text" name="lift"><br/>
            地址：&emsp;&emsp;<input type="text" name="location"><br/>
            价格：&emsp;&emsp;<input type="text" name="price"><br/>
            链接：&emsp;&emsp;<input type="text" name="url" required="required"><br/>
            <input type="submit" value="添加"> <span>${msg}</span>
        </form>
        <hr/>
    </div>


    <script>
        if ("${sessionScope.username}" != "Administrator") {
            document.getElementById("all").style.display = "none";
            alert("您不具有管理员权限！");
        }
    </script>
</body>
</html>
