<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29
  Time: 7:54
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
    </style>

    <script src="js/jquery.js" ></script>
    <script>
        $(function () {
            $("#n1").blur(function () {
                var p = $("#n1").val();
                var reg = /\S/;
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
                var reg = /^[0-9]*$/;
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
                var reg = /\S/;
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
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n4").css('border','2px solid green');
                    $("#nq").removeAttr("disabled");
                }else {
                    $("#n4").css('border','1px solid red');
                    $("#nq").attr("disabled","a")
                }
            })
        });

        $(function () {
            $("#n4").blur(function () {
                var p = $("#n4").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n4").css('border','2px solid green');
                    $("#nq").removeAttr("disabled");
                }else {
                    $("#n4").css('border','1px solid red');
                    $("#nq").attr("disabled","a")
                }
            })
        });

        $(function () {
            $("#n6").blur(function () {
                var p = $("#n6").val();
                var reg = /\S/;
                if(reg.test(p)){
                    $("#n6").css('border','2px solid green');
                    $("#nq").removeAttr("disabled");
                }else {
                    $("#n6").css('border','1px solid red');
                    $("#nq").attr("disabled","a")
                }
            })
        });
    </script>
</head>
<body id="b1">

<div style="height: 400px;width: 450px;font-size: 25px ;color: white;">
    <fieldset>
        <legend>添加一份招聘信息吧</legend>
        <form method="post" action="addRec">
            <table style="text-align: center">
                <tr>
                    <td>
                        <lable>职位:</lable>
                    </td>
                    <td>
                        <input type="text" name="r_job" id="n1"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <lable>薪资:</lable>
                    </td>
                    <td>
                        <input type="text" id="n2" name="r_salary"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>工作时间:</label>
                    </td>
                    <td>
                        <input type="text" name="r_workTime"
                               id="n3" ><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>工作地方:</label>
                    </td>
                    <td>
                        <input type="text" id="n4"
                               name="r_workPlace"><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>要求:</label>
                    </td>
                    <td>
                        <input type="text" id="n5"
                               name="r_jobRequirement"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>其他:</label>
                    </td>
                    <td>
                        <input type="text" id="n6" name="r_other"><br/>
                    </td>
                </tr>
            </table>

            <input id="nq" type="submit" value="确认提交">
        </form>
    </fieldset>
</div>

</body>
</html>
