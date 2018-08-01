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
    <title>修改招聘信息</title>
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
</head>
<body id="b1">

<div style="height: 400px;width: 450px;font-size: 25px ;color: white;">
    <fieldset>
        <legend>修改招聘信息</legend>

        <form method="post" action="alterRec">
            <table style="text-align: center">
                <tr>
                    <td><lable>职位:</lable></td>
                    <td>
                        <input type="text" name="r_job" id="n1" value="${sessionScope.re.r_job}"><br/>
                    </td>
                </tr>

                <tr>
                    <td><lable>薪资:</lable></td>
                    <td>
                        <input type="text" name="r_salary" value="${sessionScope.re.r_salary}"><br/>
                    </td>
                </tr>

                <tr>
                    <td><label>工作时间:</label></td>
                    <td>
                        <input type="text" name="r_workTime" value="${sessionScope.re.r_workTime}">
                    </td>
                </tr>

                <tr>
                    <td><label>工作地点:</label></td>
                    <td>
                        <input type="text" name="r_workPlace" value="${sessionScope.re.r_workPlace}">
                    </td>
                </tr>

                <tr>
                    <td><label>要求:</label></td>
                    <td>
                        <input type="text" id="n3" value="${sessionScope.re.r_jobRequirement}"
                               name="r_jobRequirement"><br/>
                    </td>
                </tr>
                <tr>
                    <td><label>其他:</label></td>
                    <td>
                        <input type="text" id="n9" value="${sessionScope.re.r_other}"
                               name="r_other"><br/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="r_id" value="${sessionScope.re.r_id}"><br/>
            <input type="submit" value="确认提交" >
        </form>

        <p style="color: red; size: 30px">
            ${requestScope.str1}
        </p>
    </fieldset>


</div>

</body>
</html>