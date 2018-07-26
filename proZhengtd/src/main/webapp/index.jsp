<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>首页</title>
    <style>
        #b1{
            background: url(images/ShouYe.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        #d1{
            color: white;
            float:right;
            margin:0px;
            width:20%;
            height:auto;
        }
        #d2{
            float: left;
            margin:0px;
            height: auto;
        }
        table{
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;
            collapse: 1px;
            margin: auto;
            text-align: center;
        }
        table td{
            border: 1px solid skyblue;
            color: white;
            height: auto;
        }
    </style>
</head>
<body id="b1">

<div id="d1">
    <fieldset>
        <legend>欢迎登陆</legend>
        <form action="login" method="post">
            账户:<input type="text" name="u_name"><br/>
            密码:<input type="text" name="u_pass"><br/>
            <input type="submit" value="登陆">
        </form>
        <a href="addUser">
            <input type=button value="注册" onclick="window.location.href('register')">
        </a>
    </fieldset>
</div>
<div id="d2">
    <table>
        <tr>
            <td>职位</td>
            <td>薪资</td>
            <td>工作地点</td>
            <td>工作要求</td>
            <td>其他</td>
        </tr>
        <tr>
            <td>Java工程师</td>
            <td>20w-30w</td>
            <td>上海</td>
            <td>5年经验,专业过硬</td>
            <td>>>>>>>></td>
        </tr>
        <tr>
            <td>Web前端</td>
            <td>15w-20w</td>
            <td>北京</td>
            <td>审美,5年经验</td>
            <td>>>>>>>></td>
        </tr>
        <tr>
            <td>市场开发</td>
            <td>10w-15w</td>
            <td>南京</td>
            <td>吃苦耐劳,有上进心</td>
            <td>>>>>>>></td>
        </tr>
        <tr>
            <td>客户经理</td>
            <td>15w-20w</td>
            <td>杭州</td>
            <td>开发客户5年经验</td>
            <td>>>>>>>></td>
        </tr>
    </table>
</div>

</body>
</html>
