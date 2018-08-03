<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 19:41
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
    <%--<script src="js/jquery.js" ></script>--%>
    <%--<script>--%>
        <%--$(function () {--%>
            <%--$("#dept").click(function () {--%>
                <%--var a=$("#dept").val();--%>
                <%--$.ajax({--%>
                    <%--url:"getPosition",--%>
                    <%--data:"d_id="+a,--%>
                    <%--type:"post",--%>
                    <%--success:function (obj) {--%>
                        <%--$("#pos option").remove();--%>
                        <%--$.each(obj,function (i,item) {--%>
                            <%--var b=item.p_id;--%>
                            <%--$("#pos").append(--%>
                                <%--"<option value="+b+">"+item.p_name+"</option>"--%>
                            <%--)--%>
                        <%--})--%>
                    <%--}--%>
                <%--})--%>
            <%--})--%>
        <%--})--%>

    <%--</script>--%>
    <style>
        #b1{
            background: url(img/window.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            color: white;
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
<a href="AdminHomePage"><font color="red">《返回首页</font></a>
<br/>
<div style="height: auto;width: auto;font-size: 25px ;color: white;">
    <fieldset style="height: 50%;width: auto">
        <legend>未发布培训信息</legend>
            <table>
                <tr>
                    <td>培训主题</td>
                    <td>培训内容</td>
                    <td>培训开始时间</td>
                    <td>培训结束时间</td>
                    <td>培训地点</td>
                    <td>培训对象</td>
                    <td>修改</td>
                    <td>删除</td>
                </tr>

                    <c:forEach items="${requestScope.trains1}" var="trains1">
                <tr>
                        <td>${trains1.t_topic}</td>
                        <td>${trains1.t_content}</td>
                        <td>${trains1.t_startTime}</td>
                        <td>${trains1.t_endTime}</td>
                        <td>${trains1.t_place}</td>
                        <td>${trains1.t_eid}</td>

                        <td>
                            <form action="goUpdateTrain">
                                <input name="t_id" type="hidden" value="${trains1.t_id}">
                                <input type="submit" value="修改">
                            </form>
                        </td>

                        <td>
                            <form action="deleteUnpushTrain">
                                <input name="t_id" type="hidden" value="${trains1.t_id}">
                                <input type="submit" value="删除">
                            </form>
                        </td>
                </tr>
                    </c:forEach>

            </table>


        <p style="color:red; size: 40px">${requestScope.str2}</p>
    </fieldset>



    <fieldset style="height: 50%;width: 50%">
        <legend>发布培训信息</legend>
        <form method="post" action="addTrain">
            <table style="text-align: center">

                <tr>
                    <td>培训对象:</td>

                    <td>
                        <select id="t_obj" name="t_obj">
                            <option>培训对象</option>
                            <option value="-1" name="t_obj">试用期员工</option>
                            <c:forEach items="${requestScope.depts1}" var="d">
                                <option value="${d.d_id}" name="t_obj">${d.d_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>培训主题:</td>
                    <td>
                        <input type="text" name="t_topic" id="n1">
                    </td>
                </tr>

                <tr>
                    <td>培训内容:</td>
                    <td>
                        <input type="text" name="t_content" id="n2">
                    </td>
                </tr>

                <tr>
                    <td>培训开始时间:</td>
                    <td>
                        <input type="datetime-local" name="t_startTime" id="n3"
                               value="2018-08-01-12:00">
                    </td>
                </tr>

                <tr>
                    <td>培训结束时间:</td>
                    <td>
                        <input type="datetime-local" name="t_endTime" id="n"
                        value="2018-08-01-12:00">
                    </td>
                </tr>

                <tr>
                    <td>培训地点:</td>
                    <td>
                        <input type="text"  name="t_place" id="n4">
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
        <p style="color:red; size: 40px">${requestScope.str3}</p>
        <p style="color:red; size: 40px">${requestScope.str1}</p>
    </fieldset>
</div>

</body>
</html>
