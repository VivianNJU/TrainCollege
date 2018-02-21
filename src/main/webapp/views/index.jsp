<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/1/21
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Train COLLEGE | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/static/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/static/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/css/AdminLTE.min.css">
    <!-- iCheck -->
    <%--<link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">--%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <b>Train</b>COLLEGE
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登陆即可报名课程</p>

        <form action="login" method="post">

            <div class="input-group">
                <div class="input-group-btn">
                    <button id="typename" type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">学员
                        <span class="fa fa-caret-down"></span></button>
                    <ul class="dropdown-menu">
                        <li><a onclick="chooose_student()">学员</a></li>
                        <li><a onclick="chooose_college()">机构</a></li>
                    </ul>
                </div>
                <!-- /btn-group -->
                <input required name="id" type="email" class="form-control" placeholder="邮箱">
            </div>
            <%--学员类型为0，机构类型为1--%>
            <input name="type" type="hidden" value="0">
            <p style="color: red">${error}</p>

            <div class="input-group">
                <div class="input-group-btn" disabled>
                    <button type="button" class="btn btn-warning">密码</button>
                </div>
                <!-- /btn-group -->
                <input required name="password" type="password" class="form-control" placeholder="密码">
            </div>
            <br>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> 记住密码
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登陆</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <a href="/student/register" class="text-center">注册成为新学员</a><br>
        <a href="/college/register" class="text-center">注册成为新教学机构</a>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="/static/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>

<script>
    function chooose_student() {
        document.getElementById("typename").innerText="学员";
        node = document.getElementsByName("id").item(0);
        node.type="email";
        node.placeholder="邮箱";
        document.getElementsByName("type").item(0).value = 0;
    }

    function chooose_college() {
        document.getElementById("typename").innerText="机构";
        node = document.getElementsByName("id").item(0);
        node.type="text";
        node.placeholder="机构编号";
        document.getElementsByName("type").item(0).value = 1;
    }
</script>
</body>
</html>

