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
<a href="AdminHomePage"><font color="red">《返回首页</font></a>
<br/><br/><br/><br/>

<fieldset>
    <legend>职位删除</legend>
        <table style="text-align: center">
            <tr>
                <td>职位名称</td>
                <td>创建时间</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${requestScope.positions2}" var="positions2">
                <tr>
                    <td>
                            ${positions2.p_name}
                    </td>
                    <td>
                            ${positions2.p_addTime}
                    </td>
                    <td>
                        <form action="deletePosition" method="post">
                            <input name="p_id" type="hidden" value="${positions2.p_id}">
                            <input type="submit" value="删除">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>


    <p style="color:red; size: 30px">
        ${requestScope.str1}
        ${requestScope.updatePosition1}
        ${requestScope.updateposition2}
        ${requestScope.deletePosition1}
        ${requestScope.deleteposition2}
    </p>
</fieldset>

<%--<fieldset>--%>
    <%--<legend>职位删除</legend>--%>
    <%--<table style="text-align: center">--%>
        <%--<tr>--%>
            <%--<td>职位名称</td>--%>
            <%--<td>创建时间</td>--%>
            <%--<td>操作</td>--%>
        <%--</tr>--%>
        <%--<c:forEach items="${requestScope.positions2}" var="positions2">--%>
            <%--<tr>--%>
                <%--<td>--%>
                        <%--${positions2.p_name}--%>
                <%--</td>--%>
                <%--<td>--%>
                        <%--${positions2.p_addTime}--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form action="deletePosition" method="post">--%>
                        <%--<input name="p_id" type="hidden" value="${positions2.p_id}">--%>
                        <%--<input type="submit" value="删除">--%>
                    <%--</form>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
    <%--</table>--%>


    <%--<p style="color:red; size: 30px">--%>
        <%--${requestScope.str1}--%>
        <%--${requestScope.updatePosition1}--%>
        <%--${requestScope.updateposition2}--%>
        <%--${requestScope.deletePosition1}--%>
        <%--${requestScope.deleteposition2}--%>
    <%--</p>--%>
<%--</fieldset>--%>

</body>
</html>
