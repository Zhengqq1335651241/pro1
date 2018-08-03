<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/31
  Time: 17:05
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
                    <td>部门职位</td>
                    <td>部门员工</td>
                    <td>修改</td>
                    <td>删除</td>
                </tr>
                <c:forEach items="${requestScope.depts1}" var="depts1">
                    <tr>
                        <td>
                            ${depts1.d_id}
                        </td>
                        <td>
                            ${depts1.d_name}
                        </td>
                        <td>
                            ${depts1.d_loc}
                        </td>
                        <td>
                            ${depts1.d_addTime}
                        </td>

                        <td>
                            <a href="adminLookPosition?d_id=${depts1.d_id}">查看部门职位</a>
                        </td>

                        <td>
                            <a href="adminLookEmp?d_id=${depts1.d_id}">查看部门员工</a>
                        </td>

                        <td>
                            <a href="updateDeptPage?d_id=${depts1.d_id}">修改</a>
                        </td>

                        <td>
                            <form action="deleteDept" method="post">
                                <input name="d_id" type="hidden" value="${depts1.d_id}">
                                <input type="submit" value="删除">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </form>
        <p style="color:red; size: 30px">
                ${requestScope.updateDept1}
                ${requestScope.updateDept2}
                ${requestScope.deleteDept1}
                ${requestScope.deleteDept2}
            ${requestScope.str1}
        </p>

    </fieldset>

    <%--<fieldset>--%>
        <%--<legend>职位</legend>--%>
        <%--<form action="updatePosition" method="post">--%>
        <%--<table style="text-align: center">--%>
            <%--<tr>--%>
                <%--<td>职位名称</td>--%>
                <%--<td>创建时间</td>--%>
                <%--<td>操作</td>--%>
            <%--</tr>--%>
            <%--<c:forEach items="${requestScope.positions1}" var="positions1">--%>
                <%--<tr>--%>
                    <%--<td>--%>
                          <%--<input name="p_name" value="${positions1.p_name}">--%>
                    <%--</td>--%>
                    <%--<td>${positions1.p_addTime}</td>--%>
                    <%--<td>--%>
                        <%--<input name="p_id" type="hidden" value="${positions1.p_id}">--%>
                        <%--<input type="submit" value="修改">--%>
                    <%--<form action="deletePosition" method="post">--%>
                        <%--<input name="p_id" type="hidden" value="${positions1.p_id}">--%>
                        <%--<input type="submit" value="删除">--%>
                    <%--</form>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
        <%--</table>--%>
        <%--</form>--%>

        <%--<p style="color:red; size: 30px">--%>
                <%--${requestScope.updatePosition1}--%>
                <%--${requestScope.updateposition2}--%>
                <%--${requestScope.deletePosition1}--%>
                <%--${requestScope.deleteposition2}--%>
        <%--</p>--%>
    <%--</fieldset>--%>
</div>

</body>
</html>
