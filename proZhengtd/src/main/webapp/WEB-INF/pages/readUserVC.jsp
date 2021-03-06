<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/1
  Time: 20:26
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

<table>
    <caption>投递详情</caption>
    <tr>
        <td>职位</td>
        <td>姓名</td>
        <td>投递时间</td>
        <td>投递状态</td>
        <td>简历状态</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${requestScope.rcv1}" var="rcv1">
        <tr>
            <td>${rcv1.rv_job}</td>
            <td>${rcv1.rv_uname}</td>
            <td>${rcv1.rv_time}</td>
            <td>
                <c:if test="${rcv1.rv_state==1}">
                    ${"未查看"}
                </c:if>
                <c:if test="${rcv1.rv_state==2}">
                    ${"已查看"}
                </c:if>
            </td>

            <td>
                <c:if test="${rcv1.rv_invite==1}">
                    ${"无邀请"}
                </c:if>
                <c:if test="${rcv1.rv_invite==2}">
                    ${"邀请"}
                </c:if>
                <c:if test="${rcv1.rv_invite==3}">
                    ${"接受邀请"}
                </c:if>
                <c:if test="${rcv1.rv_invite==4}">
                    <p style="color: red ;size: 50px">${"恭喜被录用"}</p>
                </c:if>
                <c:if test="${rcv1.rv_invite==5}">
                    ${"不录用"}
                </c:if>
                <c:if test="${rcv1.rv_invite==6}">
                    ${"拒接邀请"}
                </c:if>
            </td>

            <td>
                <form action="acceptInvite" method="post">
                    <input name="rv_id" type="hidden" value="${rcv1.rv_id}">
                    <input type="submit" value="接受邀请">
                </form>
                <form action="refuseIn" method="post">
                    <input name="rv_id" type="hidden" value="${rcv1.rv_id}">
                    <input type="submit" value="拒绝邀请">
                </form>
            </td>
        </tr>
    </c:forEach>

    <tr>
        <td colspan="6">
            <c:forEach begin="1" end="${requestScope.totalPages}" var="PAGESIZE">
                <a href="readUserVC?currentPage=${PAGESIZE}">${PAGESIZE}</a>
            </c:forEach>
        </td>
    </tr>
</table>


</body>
</html>
