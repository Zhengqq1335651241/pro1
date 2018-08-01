<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 16:55
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
    <caption>已录用名单</caption>
    <tr>
        <td>录用人员姓名</td>
        <td>录用人员地址</td>
        <td>录用人员邮箱</td>
        <td>录用人员电话</td>
        <td>操作</td>
    </tr>

    <c:forEach items="${sessionScope.vitae2}" var="vitae2">
        <tr>
            <td>${vitae2.cv_name}</td>
            <td>${vitae2.cv_address}</td>
            <td>${vitae2.cv_email}</td>
            <td>${vitae2.cv_phone}</td>
            <td>
                <form action="addEmpPage">
                    <input name="cv_id" type="hidden" value="${vitae2.cv_id}">
                    <input type="submit" value="开户">
                </form>
            </td>

        </tr>
    </c:forEach>

</body>
</html>
