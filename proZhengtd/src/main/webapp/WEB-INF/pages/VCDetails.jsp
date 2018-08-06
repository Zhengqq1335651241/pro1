<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/26
  Time: 11:13
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
<fieldset>
    <legend>简历信息</legend>

    <table>
        <tr>
            <td>姓名</td>
            <td>生日</td>
            <td>性别</td>
            <td>籍贯</td>
            <td>地址</td>
            <td>电话</td>
            <td>邮箱</td>
            <td>专业</td>
            <td>学历</td>
            <td>毕业学校</td>
            <td>能力</td>
            <td>履历</td>
            <td>其他</td>
            <td>修改</td>
            <td>删除</td>
        </tr>

        <c:forEach items="${sessionScope.vitaeList}" var="vitaeList">
            <tr>
                <td>${vitaeList.cv_name}</td>
                <td>${vitaeList.cv_birthday}</td>
                <td>${vitaeList.cv_sex}</td>
                <td>${vitaeList.cv_hometown}</td>
                <td>${vitaeList.cv_address}</td>
                <td>${vitaeList.cv_phone}</td>
                <td>${vitaeList.cv_email}</td>
                <td>${vitaeList.cv_major}</td>
                <td>${vitaeList.cv_eduBackground}</td>
                <td>${vitaeList.cv_school}</td>
                <td>${vitaeList.cv_able}</td>
                <td>${vitaeList.cv_experience}</td>
                <td>${vitaeList.cv_other}</td>
                <td>
                    <form action="updateCV">
                        <input name="cv_id" type="hidden" value="${vitaeList.cv_id}">
                        <input type="submit" value="修改">
                    </form>
                </td>
                <td>
                    <form action="deleteCV">
                        <input name="cv_id" type="hidden" value="${vitaeList.cv_id}">
                        <input type="submit" value="删除">
                    </form>
                </td>
            </tr>
        </c:forEach>

        <tr>
            <td colspan="15">
                <c:forEach begin="1" end="${sessionScope.totalPages}" var="PAGESIZE">
                    <a href="getVitaeDetail?currentPage=${PAGESIZE}">${PAGESIZE}</a>
                </c:forEach>
            </td>
        </tr>
    </table>
    <p style="color:red; size: 40px">${requestScope.str3}</p>
    <p style="color:red; size: 40px">${requestScope.str4}</p>
</fieldset>
</body>
</html>
