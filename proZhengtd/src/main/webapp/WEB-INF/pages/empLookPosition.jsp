<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/3
  Time: 10:35
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
<a href="EmpHomePage"><font color="red">《返回首页</font></a>
<br/>

<fieldset>
    <legend></legend>
    <table style="text-align: center">
        <tr>
            <td>职位名称</td>
            <td>创建时间</td>
        </tr>
        <c:forEach items="${requestScope.positions2}" var="positions2">
            <tr>
                <td>
                        ${positions2.p_name}
                </td>
                <td>
                        ${positions2.p_addTime}
                </td>
            </tr>
        </c:forEach>
    </table>

</fieldset>
</body>
</html>
