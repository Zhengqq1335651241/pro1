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
    <script src="js/jquery.js" ></script>
    <script>
        $(function () {
            $("#dept").click(function () {
                var a=$("#dept").val();
                $.ajax({
                    url:"getPosition",
                    data:"d_id="+a,
                    type:"post",
                    success:function (obj) {
                        $("#pos option").remove();
                        $.each(obj,function (i,item) {
                            var b=item.p_id;
                            $("#pos").append(
                                "<option value="+b+">"+item.p_name+"</option>"
                            )
                        })
                    }
                })
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


<div style="height: auto;width: 450px;font-size: 25px ;color: white;">
    <fieldset>
        <legend>添加新员工</legend>
        <form method="post" action="addEmp">
            <table style="text-align: center">

                <tr>
                    <td>
                        员工账号:
                    </td>

                    <td>
                        <input type="text" name="e_eName"
                               value="${sessionScope.vitae3.cv_email}">
                    </td>
                </tr>

                <tr>
                    <td>
                        登陆密码:
                    </td>
                    <td>
                        <input type="text" name="e_ePass"
                               value="${sessionScope.vitae3.cv_phone}">
                    </td>
                </tr>

                <tr>
                    <td>
                        性别:
                    </td>
                    <td>
                        <input type="radio" name="e_sex" value="${sessionScope.vitae3.cv_sex}" checked>男
                        <input type="radio" name="e_sex" value="${sessionScope.vitae3.cv_sex}">女
                    </td>
                </tr>

                <tr>
                    <td>
                        常住地:
                    </td>
                    <td>
                        <input type="text"  name="e_address" value="${sessionScope.vitae3.cv_address}">
                    </td>
                </tr>


                <tr>
                    <td>部门职位</td>

                    <td>
                        <select id="dept" name="d_id">
                            <option>请选择部门</option>
                            <c:forEach items="${sessionScope.depts}" var="d">
                                <option value="${d.d_id}" id="dept1">${d.d_name}</option>
                            </c:forEach>
                        </select>

                        <select id="pos" name="p_id">
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        学历:
                    </td>
                    <td>
                        <input type="text" name="e_eduBackground"
                               value="${sessionScope.vitae3.cv_eduBackground}">
                    </td>
                </tr>

                <tr>
                    <td>
                        生日:
                    </td>
                    <td>
                        <input type="date" name="e_birthday" value="${sessionScope.vitae3.cv_birthday}">
                    </td>
                </tr>

                <tr>
                    <td>
                        籍贯:
                    </td>
                    <td>
                        <input type="text" name="e_hometown" value="${sessionScope.vitae3.cv_hometown}">
                    </td>
                </tr>

                <tr>
                    <td>
                        电话:
                    </td>
                    <td>
                        <input type="text" name="e_phone" value="${sessionScope.vitae3.cv_phone}">
                    </td>
                </tr>

                <tr>
                    <td>
                        邮箱:
                    </td>
                    <td>
                        <input type="text" name="e_email" value="${sessionScope.vitae3.cv_email}">
                    </td>
                </tr>


                <tr>
                    <td>
                        专业:
                    </td>
                    <td>
                        <input type="text" name="e_major" value="${sessionScope.vitae3.cv_major}">
                    </td>
                </tr>

                <tr>
                    <td>
                        毕业学校:
                    </td>
                    <td>
                        <input type="text" name="e_graduateSchool" value="${sessionScope.vitae3.cv_school}">
                    </td>
                </tr>

                <tr>
                    <td>入职时间:</td>
                    <td>
                        <input type="date" name="e_hireDate">
                    </td>
                </tr>

                <tr>
                    <td>岗位状态:</td>
                    <td>
                        <input name="e_state" type="text" value="1">
                    </td>
                </tr>

            </table>
            <input type="submit" value="确认提交">
        </form>
    </fieldset>
</div>

</body>
</html>
