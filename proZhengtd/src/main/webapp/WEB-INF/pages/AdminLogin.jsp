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
            background: url(img/window.jpg) no-repeat center center fixed;
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

<div>
    <fieldset>
        <legend>管理员登陆</legend>
        <form action="adminLogin" method="post">
            账户:<input type="text" name="a_name"
                      id="n1" placeholder="字母开头,5-16字节"><br/>
            密码:<input type="password" name="a_pass"
                      id="n2" placeholder="字母开头，6~18之间"><br/>
            <br/>
            <input type="submit" value="登陆" id="nq">
            <input type="reset" value="重置">
        </form>
    </fieldset>
</div>


</body>
</html>
