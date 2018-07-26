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
            color: white;
            float:right;
            right: auto;
            top: 40px;
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
                <li><a href="getVitaeDetail">个人简历</a></li>
                <li><a href="goodDetail?currentPage=1">#</a></li>
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
                            <input type="text" name="cv_name"><br/>
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
                            <input type="text" name="cv_address"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>籍贯:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_hometown"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>电话:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_phone"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>邮箱:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_email"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>毕业学校:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_school"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>专业:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_major"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>工作经历:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_experience"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>技能:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_able"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>其他:</label>
                        </td>
                        <td>
                            <input type="text" name="cv_other"><br/>
                        </td>
                    </tr>
                </table>

                <input type="submit" value="确认提交">
            </form>
        </fieldset>
    </div>

    <div id="d2">
        <table>
            <caption>招聘信息</caption>
            <tr>
                <td>id</td>
                <td>职位</td>
                <td>薪资</td>
                <td>工作时间</td>
                <td>工作地点</td>
                <td>福利待遇</td>
                <td>要求</td>
                <td>其他</td>
            </tr>
            <c:forEach items="${sessionScope.recruit}" var="recruit">
                <tr>
                    <td>${recruit.r_id}</td>
                    <td>${recruit.r_job}</td>
                    <td>${recruit.r_salary}</td>
                    <td>${recruit.r_workTime}</td>
                    <td>${recruit.r_workPlace}</td>
                    <td>${recruit.r_treatment}</td>
                    <td>${recruit.r_jobRequirement}</td>
                    <td>${recruit.r_other}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>


</body>
</html>
