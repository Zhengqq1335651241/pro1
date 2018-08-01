<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 9:35
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
    <caption>招聘信息</caption>
    <tr>
        <td>职位</td>
        <td>薪资</td>
        <td>工作时间</td>
        <td>工作地点</td>
        <td>要求</td>
        <td>其他</td>
        <td>修改</td>
        <td>删除</td>
    </tr>

    <c:forEach items="${requestScope.recruitList}" var="recruitList">
        <tr>
            <td>${recruitList.r_job}</td>
            <td>${recruitList.r_salary}</td>
            <td>${recruitList.r_workTime}</td>
            <td>${recruitList.r_workPlace}</td>
            <td>${recruitList.r_jobRequirement}</td>
            <td>${recruitList.r_other}</td>
            <td>
                <form action="updateRecruit">
                    <input name="r_id" type="hidden" value="${recruitList.r_id}">
                    <input type="submit" value="修改">
                </form>
            </td>
            <td>
                <form action="deleteRecruit">
                    <input name="r_id" type="hidden" value="${recruitList.r_id}">
                    <input type="submit" value="删除">
                </form>
            </td>
        </tr>
    </c:forEach>

    <tr>
        <td colspan="9">
            <c:forEach begin="1" end="${requestScope.totalPages}" var="PAGESIZE">
                <a href="getRecruitDetail?currentPage=${PAGESIZE}">${PAGESIZE}</a>
            </c:forEach>
        </td>
    </tr>


    <tr>
        <td colspan="9">
            <a href="addRecruitPage">添加招聘信息</a>
        </td>
    </tr>

    <p style="color: red; size: 30px">
        ${requestScope.str1}
    </p>
</table>

</body>
</html>
