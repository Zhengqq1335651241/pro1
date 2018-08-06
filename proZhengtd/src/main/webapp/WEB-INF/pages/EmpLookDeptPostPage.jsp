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
<a href="EmpHomePage"><font color="red">《返回首页</font></a>
<br/>

<div style="height: 80%;width: 80%;font-size: 25px ;color: white;">
    <fieldset>
        <legend>部门</legend>
            <table style="text-align: center">
                <caption>部门详情</caption>
                <tr>
                    <td>部门ID</td>
                    <td>部门名称</td>
                    <td>部门地址</td>
                    <td>创建时间</td>
                    <td>部门职位</td>
                    <td>部门员工</td>
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
                            <a href="empLookPosition?d_id=${depts1.d_id}">查看部门职位</a>
                        </td>

                        <td>
                            <a href="empLookEmp?d_id=${depts1.d_id}">查看部门员工</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        <p style="color:red; size: 30px">
            ${requestScope.str1}
        </p>

    </fieldset>
</div>

</body>
</html>
