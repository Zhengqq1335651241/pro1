<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 11:36
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
    <title>投递详情</title>
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
        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: darkgrey;
        }
    </style>

</head>
<body id="b1">
<a href="UserHomePage"><font color="red" >《返回首页</font></a>
<br/><br/><br/><br/>
    <div style="width: 80%;height:80%;">
        <fieldset>
            <legend>投递详情</legend>
                <table>
                <tr>
                    <td>投递职位</td>
                    <td>应聘者姓名</td>
                    <td>投递时间</td>
                    <td>投递状态</td>
                    <td>简历状态</td>
                    <td>是否邀请</td>
                    <td>删除</td>
                </tr>
            <c:forEach items="${sessionScope.rcvList}" var="rcvList">
                <tr>
                    <td>${rcvList.rv_job}</td>
                    <td>${rcvList.rv_uname}</td>
                    <td>${rcvList.rv_time}</td>
                    <td>
                        <c:if test="${rcvList.rv_state==1}">
                            ${"未查看"}
                        </c:if>
                        <c:if test="${rcvList.rv_state==2}">
                            ${"已查看"}
                        </c:if>
                    </td>

                    <td>
                        <c:if test="${rcvList.rv_invite==1}">
                            ${"无邀请"}
                        </c:if>
                        <c:if test="${rcvList.rv_invite==2}">
                            <p style="color: yellow ;size: 50px">${"邀请"}</p>
                        </c:if>
                        <c:if test="${rcvList.rv_invite==3}">
                            ${"接受邀请"}
                        </c:if>
                        <c:if test="${rcvList.rv_invite==4}">
                                <p style="color: red ;size: 50px">${"恭喜被录用"}</p>
                        </c:if>
                        <c:if test="${rcvList.rv_invite==5}">
                            ${"不录用"}
                        </c:if>
                        <c:if test="${rcvList.rv_invite==6}">
                            ${"拒接邀请"}
                        </c:if>

                    </td>

                    <td>
                        <form action="acceptInvite" method="post">
                            <input name="rv_id" type="hidden" value="${rcvList.rv_id}">
                            <input type="submit" value="接受邀请">
                        </form>

                        <form action="refuseIn" method="post">
                            <input name="rv_id" type="hidden" value="${rcvList.rv_id}">
                            <input type="submit" value="拒绝邀请">
                        </form>
                    </td>

                    <td>
                        <form action="deleteRCVTouDi" method="post">
                            <input name="rv_id" type="hidden" value="${rcvList.rv_id}">
                            <input type="submit" value="删除">
                        </form>
                    </td>
                </tr>
            </c:forEach>

                <tr>
                    <td colspan="4">
                        <c:forEach begin="1" end="${requestScope.totalPages}" var="PAGESIZE">
                            <a href="getDeliveryDetail?currentPage=${PAGESIZE}">${PAGESIZE}</a>
                        </c:forEach>
                    </td>

                    <td colspan="3">
                        <form action="deleteAllUserRCV" method="post">
                            <input type="submit" value="删除所有">
                        </form>
                    </td>
                </tr>

            </table>
        </fieldset>
    </div>

</body>
</html>
