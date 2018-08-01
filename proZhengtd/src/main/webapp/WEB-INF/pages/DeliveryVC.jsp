<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 9:59
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
            background: url(img/UserWin.jpg) no-repeat center center fixed;
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

<a href="UserHomePage"><font color="red" >《返回首页</font></a>
<br/><br/><br/><br/>


<table>
    <caption>选择简历</caption>
    <tr>
        <td>姓名</td>
        <td>专业</td>
        <td>能力</td>
        <td>履历</td>
        <td>其他</td>
        <td>操作</td>
    </tr>

    <c:forEach items="${sessionScope.vitaes}" var="vitaes">
        <tr>
            <td>${vitaes.cv_name}</td>
            <td>${vitaes.cv_major}</td>
            <td>${vitaes.cv_able}</td>
            <td>${vitaes.cv_experience}</td>
            <td>${vitaes.cv_other}</td>
            <td>
                <form action="DeliveryVC">
                    <input name="cv_id" type="hidden" value="${vitaes.cv_id}">
                    <input type="submit" value="选择">
                </form>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
