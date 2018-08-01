<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/31
  Time: 13:31
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
    <title>部门职位管理</title>
    <script src="js/jquery.js" ></script>
    <script>
        $(function () {
            $(".n1").blur(function () {
                var p = $(".n1").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $(".n1").css('border','2px solid green');
                    $("#n2").removeAttr("disabled");
                }else {
                    $(".n1").css('border','1px solid red');
                    $("#n2").attr("disabled","a")
                }
            })
        });
    </script>
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


<br/><br/><br/><br/>

<ul>
    <li><a href="AdminHomePage">返回首页</a></li>
    <li><a href="lookDeptPost">查看职位&部门</a></li>
</ul>

<div style="height: 500px;width: 400px;font-size: 25px ;color: white;">
    <fieldset>
        <legend>添加部门</legend>
        <form action="addDept" method="post">
            <table style="text-align: center">
                <tr>
                    <td>部门名称:</td>
                    <td>
                        <input type="text" class="n1" name="d_name">
                    </td>
                </tr>

                <tr>
                    <td>部门地址:</td>
                    <td>
                        <input type="text" class="n1" name="d_loc">
                    </td>
                </tr>
            </table>

            <input type="submit" value="确认提交">
        </form>
        <p style="color:red; size: 30px">
            ${requestScope.addDept1}
            ${requestScope.addDept2}
        </p>

    </fieldset>

    <fieldset>
        <legend>添加职位</legend>
        <form action="addPosition" method="post">
            <table style="text-align: center">
                <tr>
                    <td>职位名称:</td>
                    <td>
                        <input type="text" class="n1" name="p_name">
                    </td>
                </tr>

                <tr>
                    <td>职位部门:</td>
                    <td>
                        <input type="text" class="n1" name="p_deptName">
                    </td>
                </tr>
            </table>

            <input type="submit" id="n2" value="确认提交">
        </form>

        <p style="color:red; size: 30px">
            ${requestScope.addPosition1}
            ${requestScope.addPosition2}
        </p>
    </fieldset>

</div>

</body>
</html>
