<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/3
  Time: 19:15
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
    <title>个人信息</title>

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
            color: honeydew;
            text-align: center;
        }
        table td{
            border: 1px solid skyblue;
            color: honeydew;
            height: auto;
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

        $(function () {
            $("#n3").blur(function () {
                var p = $("#n3").val();
                var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
                if(reg.test(p)){
                    $("#n3").css('border','2px solid green');
                    $("#nq").removeAttr("disabled");
                }else {
                    $("#n3").css('border','1px solid red');
                    $("#nq").attr("disabled","a")
                }
            })
        });

        $(function () {
            $("#n4").blur(function () {
                var p = $("#n4").val();
                var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if(reg.test(p)){
                    $("#n4").css('border','2px solid green');
                    $("#nq").removeAttr("disabled");
                }else {
                    $("#n4").css('border','1px solid red');
                    $("#nq").attr("disabled","a")
                }
            })
        });
    </script>
</head>
<body id="b1">

<a href="EmpHomePage"><font color="red">《返回首页</font></a>
<br/>

<div style="height: auto;width: auto;font-size: 25px ;color: white;">
    <fieldset>
        <legend>员工个人信息</legend>
        <table style="text-align: center">
            <tr>
                <td>员工ID</td>
                <td>员工账户</td>
                <td>员工密码</td>
                <td>性别</td>
                <td>地址</td>
                <td>教育背景</td>
                <td>生日</td>
                <td>籍贯</td>
                <td>电话</td>
                <td>邮箱</td>
                <td>专业</td>
                <td>毕业院校</td>
                <td>部门</td>
                <td>职位</td>
                <td>入职时间</td>
                <td>在职状态</td>
            </tr>
            <tr>
                <td>${sessionScope.emp.e_eid}</td>
                <td>${sessionScope.emp.e_eName}</td>
                <td>${sessionScope.emp.e_ePass}</td>
                <td>${sessionScope.emp.e_sex}</td>
                <td>${sessionScope.emp.e_address}</td>
                <td>${sessionScope.emp.e_eduBackground}</td>
                <td>${sessionScope.emp.e_birthday}</td>
                <td>${sessionScope.emp.e_hometown}</td>
                <td>${sessionScope.emp.e_phone}</td>
                <td>${sessionScope.emp.e_email}</td>
                <td>${sessionScope.emp.e_major}</td>
                <td>${sessionScope.emp.e_graduateSchool}</td>
                <td>${requestScope.dept.d_name}</td>
                <td>${requestScope.position.p_name}</td>
                <td>${sessionScope.emp.e_hireDate}</td>

                <td>
                    <c:if test="${sessionScope.emp.e_state==-1}">
                        ${"试用期员工"}
                    </c:if>
                    <c:if test="${sessionScope.emp.e_state==-2}">
                        ${"离职员工"}
                    </c:if>
                    <c:if test="${sessionScope.emp.e_state==-3}">
                        ${"正式员工"}
                    </c:if>
                </td>
            </tr>

        </table>

        <p style="color:red; size: 30px">

        </p>
    </fieldset>

    <fieldset style="height: 120px">
        <legend>修改个人信息</legend>
        <form method="post" action="updateEmpDetail">
            <table>

                <tr>
                    <td>个人账户:</td>
                    <td>
                        <input id="n1" type="text" name="e_eName" value="${sessionScope.emp.e_eName}"
                               placeholder="字母开头,5-16字节" readonly>
                    </td>
                </tr>
                <tr>
                    <td>账户密码:</td>
                    <td>
                        <input id="n2" type="text" name="e_ePass" value="${sessionScope.emp.e_ePass}"
                               placeholder="字母开头，6~18之间">
                    </td>
                </tr>
                <tr>
                    <td>电话:</td>
                    <td>
                        <label for="n3"></label>
                        <input id="n3" type="text" name="e_phone" value="${sessionScope.emp.e_phone}">
                    </td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td>
                        <label for="n4"></label>
                        <input id="n4" type="text" name="e_email" value="${sessionScope.emp.e_email}"><br/>
                    </td>
                </tr>

               <tr>
                   <td colspan="2">
                       <input type="submit" value="提交" id="nq">
                   </td>
                </tr>
            </table>
        </form>


        <p style="color:red; size: 40px">${requestScope.str1}</p>
    </fieldset>
</div>
</body>
</html>
