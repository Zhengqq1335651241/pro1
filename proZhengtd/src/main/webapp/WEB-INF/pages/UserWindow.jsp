<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="js/jquery.js" ></script>
      <script>
        $(function () {
            $("#n1").blur(function () {
                var p = $("#n1").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n1").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n1").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n2").blur(function () {
                var p = $("#n2").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n2").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n2").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n3").blur(function () {
                var p = $("#n3").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n3").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n3").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n4").blur(function () {
                var p = $("#n4").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n4").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n4").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n5").blur(function () {
                var p = $("#n5").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n5").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n5").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n6").blur(function () {
                var p = $("#n6").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n6").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n6").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n7").blur(function () {
                var p = $("#n7").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n7").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n7").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n8").blur(function () {
                var p = $("#n8").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n8").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n8").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n9").blur(function () {
                var p = $("#n9").val();
                var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
                if(reg.test(p)){
                    $("#n9").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n9").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        });
        $(function () {
            $("#n11").blur(function () {
                var p = $("#n11").val();
                var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if(reg.test(p)){
                    $("#n11").css('border','2px solid green');
                    $("#n10").removeAttr("disabled");
                }else {
                    $("#n11").css('border','1px solid red');
                    $("#n10").attr("disabled","a")
                }
            })
        })
    </script>
    <style>
        #b1{
            background: url(img/UserWin.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            color: white;
        }
        #d2{
            position: relative;
            margin-top: -400px;
            color: white;
            float:right;
            right: auto;
            width: 850px;
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
</head>
<body id="b1">


<div>

    <div>
        <fieldset>
            <legend>欢迎用户:${sessionScope.user.u_name}!</legend>
            <ul>
                <li><a href="getVitaeDetail?currentPage=1">个人简历</a></li>
                <li><a href="getDeliveryDetail?currentPage=1">投递详情</a></li>
                <li><a href="#">退出登陆</a></li>
            </ul>
        </fieldset>
    </div>

    <div style="height: 400px;width: 450px;font-size: 25px ;color: white;">
        <fieldset>
            <legend>添加一份简历吧</legend>
            <form method="post" action="addVC">
                <table style="text-align: center">
                    <tr>
                        <td>
                            <lable>姓名:</lable>
                        </td>
                        <td>
                            <input type="text" name="cv_name" id="n1"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <lable>出生日期:</lable>
                        </td>
                        <td>
                            <input type="date" name="cv_birthday"
                                   value="2018-07-26"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>性别:</label>
                        </td>
                        <td>
                            <input type="radio" name="cv_sex" value="男" checked>男
                            <input type="radio" name="cv_sex" value="女">女<br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>常住地:</label>
                        </td>
                        <td>
                            <input type="text" id="n2" name="cv_address"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>籍贯:</label>
                        </td>
                        <td>
                            <input type="text" id="n3" name="cv_hometown"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>电话:</label>
                        </td>
                        <td>
                            <input type="text" id="n9" name="cv_phone"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>邮箱:</label>
                        </td>
                        <td>
                            <input type="text" id="n11" name="cv_email"><br/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>学历:</label>
                        </td>
                        <td>
                            <input type="text"  name="cv_eduBackground"><br/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>毕业学校:</label>
                        </td>
                        <td>
                            <input type="text" id="n4" name="cv_school"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>专业:</label>
                        </td>
                        <td>
                            <input type="text" id="n5" name="cv_major"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>工作经历:</label>
                        </td>
                        <td>
                            <input type="text" id="n6" name="cv_experience"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>技能:</label>
                        </td>
                        <td>
                            <input type="text" id="n7" name="cv_able"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>其他:</label>
                        </td>
                        <td>
                            <input type="text" id="n8" name="cv_other"><br/>
                        </td>
                    </tr>
                </table>

                <input id="n10" type="submit" value="确认提交">
            </form>
        </fieldset>
    </div>

    <div id="d2">
        <table>
            <caption>招聘信息</caption>
            <tr>
                <td>职位</td>
                <td>薪资</td>
                <td>工作时间</td>
                <td>工作地点</td>
                <td>要求</td>
                <td>其他</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${sessionScope.recruit}" var="recruit">
                <tr>
                    <td>${recruit.r_job}</td>
                    <td>${recruit.r_salary}</td>
                    <td>${recruit.r_workTime}</td>
                    <td>${recruit.r_workPlace}</td>
                    <td>${recruit.r_jobRequirement}</td>
                    <td>${recruit.r_other}</td>
                    <td>
                        <form action="toudi" method="post">
                            <input name="r_id" type="hidden" value="${recruit.r_id}">
                            <input type="submit" value="投递">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>


</body>
</html>
