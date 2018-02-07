<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/2/7
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Train COLLEGE | Home Page</title>
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

    <jsp:include page="../public/student_nav.jsp" flush="true" >
        <jsp:param name="browse" value="active"/>
    </jsp:include>

    <div class="content-wrapper">

        <!-- 大标题 -->
        <section class="content-header">
            <h1>
                所有课程计划
                <small>查看详情，进一步了解</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/student/homepage"><i class="fa fa-home"></i> 主页</a></li>
                <li><a href="/student/show_lesson?lid=${lesson.id}"> ${lesson.name}</a></li>
                <li class="active">报名页面</li>
            </ol>
        </section>

        <div class="pad margin no-print">
            <div class="callout callout-info" style="margin-bottom: 0!important;">
                <h4><i class="fa fa-info"></i> 提示：</h4>
                已选择手动选班，一个订单最多报名3人
            </div>
        </div>

        <!-- Main content -->
        <section class="content">

            <%--基础成员--%>
            <div class="col-md-4">

                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-angle-right"></i> 填写学员信息</h3>
                    </div>
                    <div class="box-body">
                        <input id="student-num" type="hidden" value="1" name="studentNum">

                        <div class="form-group">
                            <label>会员邮箱：</label>

                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-send"></i>
                                </div>
                                <input disabled value="${student.email}" name="email1" type="email" class="form-control pull-right">
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->

                        <div class="form-group">
                            <label>班级类型（单选）：</label>
                            <select name="classId1" class="form-control select2" style="width: 100%;" required>
                                <c:forEach items="${classList}" var="item" >
                                    <option id="${item.id}">${item.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button class="btn btn-default" type="submit">保存</button>
                        <button class="btn btn-info pull-right" type="button">新增学员</button>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (1) -->

            <%--基础成员--%>
            <div class="col-md-4">

                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-angle-right"></i> 填写学员信息</h3>
                    </div>
                    <div class="box-body">

                        <div class="form-group">
                            <label>会员邮箱：</label>

                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-send"></i>
                                </div>
                                <input name="email" type="email" class="form-control pull-right" required>
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->

                        <div class="form-group">
                            <label>班级类型（单选）：</label>
                            <select name="classId" class="form-control select2" style="width: 100%;" required>
                                <c:forEach items="${classList}" var="item" >
                                    <option id="${item.id}">${item.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button class="btn btn-danger pull-right" type="button" onclick="delete_student(this.parentNode.parentNode.parentNode)">删除</button>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (1) -->



        </section>

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
<script>
    function delete_student(node) {
        node.parentNode.removeChild(node);
    }
</script>
</body>
</html>
