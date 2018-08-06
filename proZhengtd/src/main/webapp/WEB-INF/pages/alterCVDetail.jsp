<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/26
  Time: 13:53
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
            background: url(img/UserWin.jpg) no-repeat center center fixed;
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
            text-align: center;
        }
        table td{
            border: 1px solid skyblue;
            height: auto;
        }
    </style>
</head>
<body id="b1">

<a href="UserHomePage"><font color="red" >《返回首页</font></a>
<br/><br/><br/><br/>

<div style="height: 400px;width: 450px;font-size: 25px ;color: white;">
    <fieldset>
        <legend>修改简历详情</legend>
        <form action="alterCVDetail" method="post">
            <table style="text-align: center">
                <tr>
                    <td>
                        <lable>姓名:</lable>
                    </td>
                    <td>
                        <input type="text" name="cv_name" value="${sessionScope.vi.cv_name}"><br/>
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
                        <input type="text" name="cv_address" value="${sessionScope.vi.cv_address}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>籍贯:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_hometown" value="${sessionScope.vi.cv_hometown}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>电话:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_phone" value="${sessionScope.vi.cv_phone}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>邮箱:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_email" value="${sessionScope.vi.cv_email}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>学历:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_eduBackground" value="${sessionScope.vi.cv_eduBackground}"><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>毕业学校:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_school" value="${sessionScope.vi.cv_school}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>专业:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_major" value="${sessionScope.vi.cv_major}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>工作经历:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_experience" value="${sessionScope.vi.cv_experience}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>技能:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_able" value="${sessionScope.vi.cv_able}"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>其他:</label>
                    </td>
                    <td>
                        <input type="text" name="cv_other" value="${sessionScope.vi.cv_other}"><br/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="cv_id" value="${sessionScope.vi.cv_id}"><br/>
            <input type="submit" value="确认提交">
        </form>
    </fieldset>

    <p style="color: red; size: 30px">
        ${requestScope.str4}
    </p>
</div>

</body>
</html>
