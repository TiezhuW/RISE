<%--
  Created by IntelliJ IDEA.
  User: WangHaixing
  Date: 2020/4/10
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>租房信息搜索引擎</title>

    <style type="text/css">
        h1 {text-align: center}

        a {
            color: black;
            text-decoration: none
        }

        input, select, button {
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

        footer p {text-align: center}
        .top {text-align: right}
    </style>
</head>

<body>
    <header>
        <div class="top">
            <a id="login"></a>
            <a href="/user/registerPage"> 注册 </a>
        </div>
        <hr/>
        <a href="/house/homepage"> <h1> 租房信息搜索引擎 </h1> </a>
    </header>

    <nav>
        <hr/>
        <form action="/house/get">
            城市：
            <select name="city" onchange="domainSelectChange()">
                <option selected></option>
                <option value="北京">北京</option>
                <option value="上海">上海</option>
                <option value="广州">广州</option>
                <option value="深圳">深圳</option>
                <option value="杭州">杭州</option>
                <option value="南京">南京</option>
                <option value="苏州">苏州</option>
                <option value="无锡">无锡</option>
                <option value="天津">天津</option>
                <option value="重庆">重庆</option>
                <option value="成都">成都</option>
                <option value="武汉">武汉</option>
                <option value="西安">西安</option>
            </select>
            市
            <br/>
            区域：
            <select name="domain">
                <option/>
            </select>
            区/县
            <p> ${nullCityAndDomain} </p>
            价格：
            <input type="text" name="minPrice"/>元/月 ~ <input type="text" name="maxPrice"/>元/月
            <br/>
            面积：
            <input type="text" name="minArea"/>平方米 ~ <input type="text" name="maxArea"/>平方米
            <br/>
            排序：
            <input type="radio" name="order" value="disorder" checked id="order1"/> <label for="order1">不排序 </label>
            <input type="radio" name="order" value="areaOrderAsc" id="order2"/> <label for="order2">按面积升序 </label>
            <input type="radio" name="order" value="areaOrderDesc" id="order3"/> <label for="order3">按面积降排序 </label>
            <input type="radio" name="order" value="priceOrderAsc" id="order4"/> <label for="order4">按价格升序 </label>
            <input type="radio" name="order" value="priceOrderDesc" id="order5"/> <label for="order5">按价格降序 </label>
            <br/>
            &emsp;&emsp;&emsp;
            <input type="submit" value="搜索"/>
        </form>
    </nav>

    <section>
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
            </tr>
            <c:forEach items="${houses}" var="house">
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
                    <td style="border: none">
                        <button onclick="moreInfo('${house.url}')"> 详情 </button>
                    </td>
                    <td style="border: none">
                        <button class="collect" onclick="collect('${sessionScope.username}', '${house.url}')"> 收藏 </button>
                    </td>
                    <td style="border: none">
                        <button onclick="commentLook('${sessionScope.username}', '${house.url}')"> 评价 </button>
                    </td>
                    <td style="border: none">
                        <button class="delete" onclick="deleteHouse('${house.url}')"> 删除 </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </section>

    <footer>
        <hr/>
        <p>开发者：王海兴、乐严彬、李光辉</p>
    </footer>

    <script>
        let deletes = document.getElementsByClassName("delete");
        let collects = document.getElementsByClassName("collect")
        if ("${sessionScope.username}".length == 0){
            document.getElementById("login").innerHTML = " 登录 ";
            document.getElementById("login").setAttribute("href", "/user/loginPage");
            //非管理员模式下隐藏删除按钮
            let len = deletes.length;
            for (let i = 0; i < len; i++) {
                deletes[i].style.display = "none";
            }
        } else {
            document.getElementById("login").innerHTML = "${sessionScope.username}" + "（已登录）";
            if ("${sessionScope.username}" == "Administrator"){
                document.getElementById("login").setAttribute("href", "/house/admin");
                //管理员模式下隐藏收藏按钮
                let len = collects.length;
                for (let i = 0; i < len; i++) {
                    collects[i].style.display = "none";
                }
            } else {
                document.getElementById("login").setAttribute("href", "/user/info?username=" + "${sessionScope.username}");
                let len = deletes.length;
                for (let i = 0; i < len; i++) {
                    deletes[i].style.display = "none";
                }
            }
        }

        function deleteHouse(url) {
            let xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function(){
                if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                    switch (xmlHttpRequest.responseText) {
                        case "success":
                            window.location.href = window.location.href;    //刷新
                            alert("删除成功");
                            break;
                        case "fail":
                            alert("删除失败");
                            break;
                        default:
                            alert("服务器错误，删除失败");
                    }
                }
                if (xmlHttpRequest.status == 404) {
                    alert("服务器错误，删除失败");
                }
            };
            xmlHttpRequest.open("POST", "/house/delete", true);
            xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest.send("url=" + url);
        }

        function commentLook(username, url) {
            if (username.length == 0) {
                alert("请先登录后评论");
            } else {
                window.open("/house/comment/look?url=" + url);
            }
        }

        function collect(username, url) {
            if (username.length == 0) {
                alert("请先登录再收藏");
            } else {
                let xmlHttpRequest = new XMLHttpRequest();
                xmlHttpRequest.onreadystatechange = function(){
                    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                        switch (xmlHttpRequest.responseText) {
                            case "success":
                                window.location.href = window.location.href;    //刷新
                                alert("收藏成功");
                                break;
                            case "fail":
                                alert("您已经收藏过该房源");
                                break;
                            default:
                                alert("服务器错误，评论失败");
                        }
                    }
                    if (xmlHttpRequest.status == 404) {
                        alert("服务器错误，收藏失败");
                    }
                };
                xmlHttpRequest.open("POST", "/house/collect", true);
                xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlHttpRequest.send("username=" + username + "&url=" + url);
            }
        }

        function moreInfo(url) {
            let xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.open("POST", "/house/moreInfo", true);
            xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttpRequest.send("url=" + url);
            window.open(url);
        }

        function domainSelectChange() {
            const citySelectValue = document.getElementsByName("city")[0].value;
            let domainSelect = document.getElementsByName("domain")[0];
            let domainBeijing = ["东城","西城","朝阳","海淀","丰台","通州","昌平","大兴","顺义","房山","平谷","怀柔","密云","延庆","石景山","门头沟","亦庄开发","北京周边"];
            let domainShanghai = ["徐汇","闵行","静安","松江","黄浦","宝山","长宁","青浦","虹口","杨浦","普陀","金山","嘉定","崇明","奉贤","浦东","闸北","卢湾","新静安","上海花桥","上海周边"];
            let domainGuangzhou = ["海珠","白云","番禺","黄埔","天河","越秀","白云","从化","增城","花都","南沙","广州周边"];
            let domainShenzhen = ["南山","福田","罗湖","宝安","龙岗","龙华","盐田","光明","坪山","布吉","大鹏新","深圳周边"];
            let domainHangzhou = ["西湖","下城","江干","拱墅","上城","下沙","滨江","余杭","萧山","富阳","临安","桐庐","淳安","建德","钱塘新","杭州周边"];
            let domainNanjing = ["鼓楼","建邺","秦淮","玄武","栖霞","江宁","浦口","六合","溧水","高淳","白下","下关","雨花台","滨江开发","南京周边"];
            let domainSuzhou = ["姑苏","吴中","相城","吴江","常熟","昆山","太仓","金阊","沧浪","平江","虎丘","高新","张家港","工业园","苏州周边"];
            let domainWuxi = ["滨湖","梁溪","锡山","新吴","惠山","宜兴","江阴","无锡周边"];
            let domainTianjin = ["和平","南开","河东","河西","河北","红桥","西青","北辰","东丽","津南","塘沽","武清","宝坻","蓟州","静海","大港","汉沽","宁河","开发","滨海新","海河教育园","天津周边"];
            let domainChongqing = ["江北","渝北","渝中","南岸","巴南","江津","长寿","垫江","巫溪","开州","奉节","荣昌","巫山","忠县","城口","北碚","万州","璧山","永川","合川","铜梁","涪陵","潼南","大足","开州","垫江", "綦江","南川","梁平","万盛","云阳","丰都","黔江","武隆","石柱","彭水","酉阳","秀山","沙坪坝","九龙坡","大渡口"];
            let domainChengdu =["锦江","青羊","武侯","高新","成华","金牛","双流","温江","郫都","彭州","简阳","邛崃","大邑","蒲江","新津","龙泉驿","新都","金堂","崇州","天府新","高新西","青白江","都江堰","天府新区南","成都周边"];
            let domainWuhan = ["江夏","江岸","江汉","硚口","武昌","洪山","汉阳","青山","汉南","蔡甸","黄陂","新洲","东西湖","东湖高新","沌口开发","武汉周边"];
            let domainXian = ["碑林","莲湖","未央","雁塔","高新","经开","新城","长安","灞桥","高陵","浐灞","临潼","鄠邑","周至","蓝田","阎良","大兴新","西咸新","曲江新","西安周边"];
            function plus(value) {
                domainSelect.innerHTML += ("<option>" + value + "</option>");
            }
            switch (citySelectValue) {
                case "北京":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainBeijing.sort();
                    domainBeijing.forEach(plus);
                    break;
                case "上海":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainShanghai.sort();
                    domainShanghai.forEach(plus);
                    break;
                case "广州":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainGuangzhou.sort();
                    domainGuangzhou.forEach(plus);
                    break;
                case "深圳":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainShenzhen.sort();
                    domainShenzhen.forEach(plus);
                    break;
                case "杭州":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainHangzhou.sort();
                    domainHangzhou.forEach(plus);
                    break;
                case "南京":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainNanjing.sort();
                    domainNanjing.forEach(plus);
                    break;
                case "苏州":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainSuzhou.sort();
                    domainSuzhou.forEach(plus);
                    break;
                case "无锡":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainWuxi.sort();
                    domainWuxi.forEach(plus);
                    break;
                case "天津":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainTianjin.sort();
                    domainTianjin.forEach(plus);
                    break;
                case "重庆":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainChongqing.sort();
                    domainChongqing.forEach(plus);
                    break;
                case "成都":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainChengdu.sort();
                    domainChengdu.forEach(plus);
                    break;
                case "武汉":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainWuhan.sort();
                    domainWuhan.forEach(plus);
                    break;
                case "西安":
                    domainSelect.innerHTML = "<option selected></option>";
                    domainXian.sort();
                    domainXian.forEach(plus);
                    break;
                default:
                    domainSelect.innerHTML = "<option/>"
            }
        }
    </script>
</body>
</html>
