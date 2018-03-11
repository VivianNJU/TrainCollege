<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/2/7
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Train COLLEGE | Error</title>
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
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/css/skins/_all-skins.min.css">
</head>
<body class="skin-green-light sidebar-mini">
<div class="wrapper">
    <jsp:include page="../public/student_header.jsp" flush="true" />

    <jsp:include page="../public/student_nav.jsp" flush="true" />
        <%--<jsp:param name="browse" value="active"/>--%>

        <%--<jsp:param name="browse" value="active menu-open"/>--%>
        <%--<jsp:param name="all_lessons" value="active"/>--%>
    <%--</jsp:include>--%>

    <div class="content-wrapper">

        <!-- 大标题 -->
        <section class="content-header">
            <h1>
                异常报告
                <small>到底发生了什么</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/student/homepage"><i class="fa fa-home"></i> 主页</a></li>
                <li class="active">异常报告</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="error-page">
                <h2 class="headline text-yellow"> 出错啦</h2>

                <div class="error-content">
                    <h3><i class="fa fa-warning text-yellow"></i> 你大概有一些操作不当</h3>

                    <p>
                        ${reason}
                        你可以选择 <a href="/student/homepage">回到主页</a>
                            或者 <a href="javascript:history.go(-1);">回到刚刚的页面</a>.
                    </p>
                </div>
                <!-- /.error-content -->
            </div>
            <!-- /.error-page -->
        </section>
        <!-- /.content -->

    </div>

    <jsp:include page="../public/footer.jsp" flush="true" />
</div>

<!-- jQuery 3 -->
<script src="/static/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
<%--<!-- SlimScroll -->--%>
<script src="/static/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<%--<!-- FastClick -->--%>
<script src="/static/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/js/demo.js"></script>
</body>
</html>