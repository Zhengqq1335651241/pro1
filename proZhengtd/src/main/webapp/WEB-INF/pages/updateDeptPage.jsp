<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/3
  Time: 13:18
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
    <title>部门职位修改</title>
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

<div style="height: 80%;width: 80%;font-size: 25px ;color: white;">
    <fieldset>
        <legend>部门</legend>
        <form action="updateDept" method="post">
            <table style="text-align: center">
                <caption>部门详情</caption>
                <tr>
                    <td>部门ID</td>
                    <td>部门名称</td>
                    <td>部门地址</td>
                    <td>创建时间</td>
                    <td>修改</td>
                </tr>
                <form action="updateDept" method="post">
                    <tr>
                        <td>
                            <input type="text" value="${requestScope.dept2.d_id}" name="d_id" readonly>
                        </td>
                        <td>
                            <input type="text" value="${requestScope.dept2.d_name}" name="d_name">
                        </td>
                        <td>
                            <input type="text" value="${requestScope.dept2.d_loc}" name="d_loc">
                        </td>
                        <td>
                            <input type="text" value="${requestScope.dept2.d_addTime}" name="d_addTime" readonly>
                        </td>
                        <td>
                            <input name="d_id" type="hidden" value="${requestScope.dept2.d_id}">
                            <input type="submit" value="修改">
                        </td>
                    </tr>
                </form>
            </table>
        </form>
        <p style="color:red; size: 30px">
            ${requestScope.updateDept1}
            ${requestScope.str1}
        </p>

    </fieldset>

    <fieldset>
        <legend>职位</legend>
        <form action="updatePosition" method="post">
            <table style="text-align: center">
                <tr>
                    <td>职位名称</td>
                    <td>创建时间</td>
                    <td>修改</td>
                </tr>

                <c:forEach var="${requestScope.positions2}" items="positions2">
                    <form action="updateDept" method="post">
                        <tr>
                            <td>
                                <input type="text" value="${requestScope.positions2.p_name}" name="p_name">
                            </td>
                            <td>
                                <input type="text" value="${requestScope.positions2.p_addTime}"
                                       name="p_addTime" readonly>    </td>
                            <td>
                                <input name="p_id" type="hidden" value="${requestScope.positions2.p_id}">
                                <input type="submit" value="修改">
                            </td>
                        </tr>
                    </form>
                </c:forEach>

            </table>
        </form>
        <p style="color:red; size: 30px">
            ${requestScope.updateDept1}
            ${requestScope.str1}
        </p>
    </fieldset>

</div>

</body>
</html>
