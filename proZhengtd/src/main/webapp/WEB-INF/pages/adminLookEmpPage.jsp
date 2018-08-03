<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/3
  Time: 10:59
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
<a href="AdminHomePage"><font color="red">《返回首页</font></a>
<br/><br/><br/><br/>

<fieldset>
    <legend>职位</legend>
        <table style="text-align: center">
            <tr>
                <td>员工账户</td>
                <td>性别</td>
                <td>地址</td>
                <td>教育背景</td>
                <td>生日</td>
                <td>籍贯</td>
                <td>电话</td>
                <td>邮箱</td>
                <td>专业</td>
                <td>毕业院校</td>
                <td>职位</td>
                <td>入职时间</td>
                <td>在职状态</td>
            </tr>
            <c:forEach items="${requestScope.emp1}" var="emp1">
                <tr>
                    <td>${emp1.e_eName}</td>
                    <td>${emp1.e_sex}</td>
                    <td>${emp1.e_address}</td>
                    <td>${emp1.e_eduBackground}</td>
                    <td>${emp1.e_birthday}</td>
                    <td>${emp1.e_hometown}</td>
                    <td>${emp1.e_phone}</td>
                    <td>${emp1.e_email}</td>
                    <td>${emp1.e_major}</td>
                    <td>${emp1.e_graduateSchool}</td>
                    <td>${emp1.e_pId}</td>
                    <td>${emp1.e_hireDate}</td>
                    <td>${emp1.e_state}</td>
                </tr>
            </c:forEach>
        </table>

    <p style="color:red; size: 30px">
        ${requestScope.str1}
        ${requestScope.updatePosition1}
        ${requestScope.updateposition2}
        ${requestScope.deletePosition1}
        ${requestScope.deleteposition2}
    </p>
</fieldset>

</body>
</html>
