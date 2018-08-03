<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2
  Time: 17:08
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
    <title></title><style>
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
</head>
<body id="b1">
<a href="AdminHomePage"><font color="red">《返回首页</font></a>
<br/>

<div>

    <fieldset style="height: 50%;width: 50%">
        <legend>修改培训信息</legend>
        <form method="post" action="updateUnPushTrain">
            <table style="text-align: center">

                <tr>
                    <td>培训主题:</td>
                    <td>
                        <input type="text" value="${requestScope.train1.t_topic}"
                               name="t_topic" id="n1" >
                    </td>
                </tr>

                <tr>
                    <td>培训内容:</td>
                    <td>
                        <input type="text" value="${requestScope.train1.t_content}"
                               name="t_content" id="n2">
                    </td>
                </tr>

                <tr>
                    <td>培训开始时间:</td>
                    <td>
                        <input type="datetime-local" name="t_startTime" id="n3"
                               value="${requestScope.train1.t_startTime}">
                    </td>
                </tr>

                <tr>
                    <td>培训结束时间:</td>
                    <td>
                        <input type="datetime-local" name="t_endTime" id="n"
                               value="${requestScope.train1.t_endTime}">
                    </td>
                </tr>

                <tr>
                    <td>培训地点:</td>
                    <td>
                        <input type="text"  value="${requestScope.train1.t_place}"
                               name="t_place" id="n4">
                    </td>
                </tr>

                <tr>
                    <td>培训部门:</td>

                    <td>
                        <input name="t_eid" type="text" value="${requestScope.train1.t_eid}">
                    </td>
                </tr>

                <tr>
                    <td>是否发布:</td>
                    <td>
                        <input type="radio" name="t_push" value="1" checked>否
                        <input type="radio" name="t_push" value="2">是
                    </td>
                </tr>

            </table>
            <input type="submit" value="确认提交">
        </form>
        <p style="color:red; size: 40px">${requestScope.str1}</p>
    </fieldset>
</div>
</body>
</html>
