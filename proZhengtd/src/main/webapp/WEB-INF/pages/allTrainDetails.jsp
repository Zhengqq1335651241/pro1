<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2
  Time: 12:12
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
    <title>全部培训信息</title>

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
            color: honeydew;
            text-align: center;
        }
        table td{
            border: 1px solid skyblue;
            color: honeydew;
            height: auto;
        }
    </style>

</head>
<body id="b1">
<a href="AdminHomePage"><font color="red">《返回首页</font></a>
<br/>

<div style="height: auto;width: auto;font-size: 25px ;color: white;">
    <fieldset style="height: 80%;width: auto">
        <legend>已发布培训信息</legend>
        <table>
            <tr>
                <td>培训主题</td>
                <td>培训内容</td>
                <td>培训开始时间</td>
                <td>培训结束时间</td>
                <td>培训地点</td>
                <td>培训部门</td>
                <td>删除</td>
            </tr>

            <c:forEach items="${sessionScope.trainList}" var="trainList">
                <tr>
                    <td>${trainList.t_topic}</td>
                    <td>${trainList.t_content}</td>
                    <td>${trainList.t_startTime}</td>
                    <td>${trainList.t_endTime}</td>
                    <td>${trainList.t_place}</td>
                    <td>${trainList.t_deptId}</td>

                    <td>
                        <form action="deletePushTrain">
                            <input name="t_id" type="hidden" value="${trainList.t_id}">
                            <input type="submit" value="删除">
                        </form>
                    </td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="7">
                    <c:forEach begin="1" end="${requestScope.totalPages}" var="PAGESIZE">
                        <a href="getAllTrain?currentPage=${PAGESIZE}">${PAGESIZE}</a>
                    </c:forEach>
                </td>
            </tr>
        </table>


        <p style="color:red; size: 40px">${requestScope.str3}</p>
    </fieldset>
</div>

</body>
</html>
