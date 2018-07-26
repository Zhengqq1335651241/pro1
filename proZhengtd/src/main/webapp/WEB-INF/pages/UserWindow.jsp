<%@ page import="com.zhengtd.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/21
  Time: 20:06
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
    <title>用户界面</title>
    <style>
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
            background-color: #111;
        }
    </style>

</head>
<body>

<div>
    <fieldset>
        <legend>欢迎用户:${sessionScope.user.u_name}!</legend>
        <ul>
            <li><a href="getVitaeDetail">个人简历</a></li>
            <li><a href="goodDetail?currentPage=1">#</a></li>
            <li><a href="#">#</a> </li>
            <li><a href="#">#</a> </li>
            <li><a href="#">退出登陆</a></li>
        </ul>
    </fieldset>
</div>

<div>
    <fieldset>
        <legend>添加一份简历吧</legend>
        <form method="post" action="addCV">
            姓&nbsp;&nbsp;名:<input type="text" name="cv_name"><br/>
            出生日期:<input type="text" name="cv_birthday"><br/>
            性&nbsp;&nbsp;别:<input type="text" name="cv_sex"><br/>
            常&nbsp;住&nbsp;地:<input type="text" name="cv_address"><br/>
            籍&nbsp;&nbsp;贯:<input type="text" name="cv_hometown"><br/>
            电&nbsp;&nbsp;话:<input type="text" name="cv_phone"><br/>
            邮&nbsp;&nbsp;箱:<input type="text" name="cv_email"><br/>
            毕业学校:<input type="text" name="cv_school"><br/>
            专&nbsp;&nbsp;业:<input type="text" name="cv_major"><br/>
            工作经历:<input type="text" name="cv_experience"><br/>
            技&nbsp;&nbsp;能:<input type="text" name="cv_able"><br/>
            其&nbsp;&nbsp;他:<input type="text" name="cv_other"><br/>
            <input type="submit" value="确认提交">
        </form>
    </fieldset>
</div>


</body>
</html>
