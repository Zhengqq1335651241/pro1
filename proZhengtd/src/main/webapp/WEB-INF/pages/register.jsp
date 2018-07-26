<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/21
  Time: 18:50
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
    <title>注册页面</title>
    <style>
        #b1{
            background: url(img/zhuce.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        #d1{
            color: white;
            float:right;
            margin:0px;
            width: 250px;
            height:auto;
        }
    </style>
</head>
<body id="b1">
<div >
   <img src="">
    <div id="d1">
        <fieldset>
            <legend>欢迎注册</legend>
            <form action="register" method="post">
                账户:<input type="text" name="u_name"><br/>
                密码:<input type="text" name="u_pass"><br/>
                <input type="submit" value="注册">

                <a href="#">
                    <input type=button value="登陆" onclick="window.location.href('#')">
                </a>
            </form>

        </fieldset>
    </div>


</div>

</body>
</html>
