<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/1/23
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Train COLLEGE | Activate Page</title>
    <link rel="stylesheet" href="/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<!-- Content Wrapper. Contains page content -->
<!-- Main content -->
<section class="login-page">
    <div class="error-page">
        <h2 class="headline text-yellow"> ${title}</h2>

        <div class="error-content" style="top: 100px">
            <h3><i class="fa fa-warning text-yellow"></i> ${message}</h3>

            <p>
                现在去登陆 <a href="../index">>>></a><br>
                重新注册新学员 <a href="/student/register">>>></a>
            </p>
        </div>
        <!-- content -->
    </div>
    <!-- page -->
</section>
</body>
</html>
