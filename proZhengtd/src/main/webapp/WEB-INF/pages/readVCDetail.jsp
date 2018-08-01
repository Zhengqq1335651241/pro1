<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/1
  Time: 13:14
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
    <title>已读简历</title>
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
<div style="width: 80%;height: 80%">
    <fieldset>
        <legend>已读简历</legend>
        <table>
            <tr>
                <td>职位</td>
                <td>姓名</td>
                <td>投递时间</td>
                <td>邀请状况</td>
                <td>简历详情</td>
                <td>邀请操作</td>
                <td>录用操作</td>
            </tr>
            <c:forEach items="${requestScope.rcv1}" var="rcv1">
                <tr>
                    <td>${rcv1.rv_job}</td>
                    <td>${rcv1.rv_uname}</td>
                    <td>${rcv1.rv_time}</td>

                    <td>
                        <c:if test="${rcv1.rv_invite==1}">
                            ${"无邀请"}
                        </c:if>
                        <c:if test="${rcv1.rv_invite==2}">
                            ${"邀请"}
                        </c:if>
                        <c:if test="${rcv1.rv_invite==4}">
                            ${"录用"}
                        </c:if>
                        <c:if test="${rcv1.rv_invite==5}">
                            ${"不录用"}
                        </c:if>
                        <c:if test="${rcv1.rv_invite==6}">
                            ${"已邀请"}
                        </c:if>
                    </td>

                    <td>
                        <form action="lookVC" method="post">
                            <input name="rv_cvId" type="hidden" value="${rcv1.rv_cvId}">
                            <input type="submit" value="查看简历详情">
                        </form>
                    </td>



                    <td>
                        <form action="invite" method="post">
                            <input name="rv_id" type="hidden" value="${rcv1.rv_id}">
                            <input type="submit" value="邀请面试">
                        </form>
                        <form action="refuseInvite" method="post">
                            <input name="rv_id" type="hidden" value="${rcv1.rv_id}">
                            <input type="submit" value="直接拒绝">
                        </form>
                    </td>

                    <td>
                        <form action="hire" method="post">
                            <input name="rv_id" type="hidden" value="${rcv1.rv_id}">
                            <input type="submit" value="录用">
                        </form>
                    </td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="7">
                    <c:forEach begin="1" end="${requestScope.totalPages}" var="PAGESIZE">
                        <a href="readVCDetail?currentPage=${PAGESIZE}">${PAGESIZE}</a>
                    </c:forEach>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

</body>
</html>
