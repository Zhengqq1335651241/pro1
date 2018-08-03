<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 9:04
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
    <title>管理员界面</title>
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
                <legend>欢迎用户:${sessionScope.admin.a_name}!</legend>
                <ul>
                    <li><a href="getRecruitDetail?currentPage=1">招聘信息</a></li>
                    <li><a href="getDeliveryCenter">简历信息</a></li>
                    <li><a href="goDeptPostPage">部门职位</a></li>
                    <li><a href="goTrainPage">培训管理</a></li>
                    <li><a href="#">员工管理</a></li>
                    <li><a href="#">薪资管理</a></li>
                    <li><a href="#">奖惩管理</a></li>
                    <li><a href="#">考勤管理</a></li>
                    <li><a href="#">退出登陆</a></li>
                </ul>
            </fieldset>
        </div>
    </div>

</body>
</html>
