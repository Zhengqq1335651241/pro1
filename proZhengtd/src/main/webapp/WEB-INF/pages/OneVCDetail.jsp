<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 14:52
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
    <title></title>
    <style>
        #b1{
            background: url(img/window.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            color: white;
        }
        table{
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;
            collapse: 1px;
            margin: auto;
            color: white;
            font-size: 20px;
            text-align: center;
        }
        table td{
            border: 1px solid skyblue;
            height: auto;
            font-size: 20px;
        }
    </style>
</head>
<body id="b1">

<a href="AdminHomePage"><font color="red" >《返回首页</font></a>
<br/><br/><br/><br/>
<table>
    <caption>简历信息</caption>
    <tr>
        <td>姓名</td>
        <td>生日</td>
        <td>性别</td>
        <td>籍贯</td>
        <td>地址</td>
        <td>电话</td>
        <td>邮箱</td>
        <td>专业</td>
        <td>毕业学校</td>
        <td>能力</td>
        <td>履历</td>
        <td>其他</td>
    </tr>
    <tr>
        <td>${sessionScope.vitae.cv_name}</td>
        <td>${sessionScope.vitae.cv_birthday}</td>
        <td>${sessionScope.vitae.cv_sex}</td>
        <td>${sessionScope.vitae.cv_hometown}</td>
        <td>${sessionScope.vitae.cv_address}</td>
        <td>${sessionScope.vitae.cv_phone}</td>
        <td>${sessionScope.vitae.cv_email}</td>
        <td>${sessionScope.vitae.cv_major}</td>
        <td>${sessionScope.vitae.cv_school}</td>
        <td>${sessionScope.vitae.cv_able}</td>
        <td>${sessionScope.vitae.cv_experience}</td>
        <td>${sessionScope.vitae.cv_other}</td>
    </tr>
</table>

</body>
</html>
