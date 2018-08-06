<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2
  Time: 10:10
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
    <title>员工界面</title>

    <style>
        #b1{
            background: url(img/window.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            color: white;
            text-align: center;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
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

<div>
    <div>
        <fieldset>
            <legend>欢迎用户:${sessionScope.emp.e_eName}!</legend>
            <ul>
                <li><a href="EmpDetail">个人信息</a></li>
                <li><a href="EmpLookDeptPost">部门职位员工</a></li>
                <li><a href="EmpLookTrain">培训</a></li>
                <li><a href="#">奖惩</a></li>
                <li><a href="#">考勤打卡</a></li>
                <li><a href="#">薪资</a></li>
                <li><a href="#">退出登陆</a></li>
            </ul>
        </fieldset>

        <p style="color:red; size: 30px">
            ${requestScope.str1}
        </p>
    </div>
</div>

</body>
</html>
