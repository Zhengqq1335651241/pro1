<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 9:06
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
            background: url(img/admin.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            color: white;
            text-align: center;
        }
        div{
            border-radius: 20px 20px 20px 20px;
            width: 800px;
            height: 300px;
            font-size: 20px;
            font-family:行书;
            margin: auto;
            position: absolute;
            left:0;
            right: 0;
            top: 230px;
        }
        input{
            border-radius: 10px 10px 10px 10px;
            border-width: 3px;
            height: 30px;
            background-color: white;
            text-decoration: none;
            color: #333333;
        }
    </style>
</head>
<body id="b1">

<div>

        <form action="adminLogin" method="post">
            账户:<input type="text" name="a_name"><br/>
            密码:<input type="text" name="a_pass"><br/>
            <br/>
            <input type="submit" value="登陆">
            <input type="reset" value="重置">
        </form>
</div>


</body>
</html>
