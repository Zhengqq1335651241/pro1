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

    <script src="js/jquery.js" ></script>
    <script>
        $(function () {
            $("#n1").blur(function () {
                var p = $("#n1").val();
                var reg = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
                if(reg.test(p)){
                    $("#n1").css('border','2px solid green');
                    $("#nq").removeAttr("disabled");
                }else {
                    $("#n1").css('border','1px solid red');
                    $("#nq").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n2").blur(function () {
                var p = $("#n2").val();
                var reg = /^[a-zA-Z]\w{5,17}$/;
                if(reg.test(p)){
                    $("#n2").css('border','2px solid green');
                    $("#nq").removeAttr("disabled");
                }else {
                    $("#n2").css('border','1px solid red');
                    $("#nq").attr("disabled","a")
                }
            })
        });

    </script>
</head>
<body id="b1">
<div >
   <img src="">
    <div id="d1">
        <fieldset>
            <legend>欢迎注册</legend>
            <form action="register" method="post">
                账户:<input type="text" name="u_name"
                          id="n1" placeholder="字母开头,5-16字节"><br/>
                密码:<input type="text" name="u_pass"
                          id="n2" placeholder="字母开头，6~18之间"><br/>
                <input type="submit" value="注册" id="nq">

                <a href="#">
                    <input type=button value="登陆" onclick="window.location.href('#')">
                </a>
            </form>

        </fieldset>
    </div>


</div>

</body>
</html>
