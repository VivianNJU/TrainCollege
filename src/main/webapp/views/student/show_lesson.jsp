<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/2/7
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Train COLLEGE | Show Lesson</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/static/bootstrap/dist/css/bootstrap.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="/static/bootstrap-daterangepicker/daterangepicker.css">
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
                课程计划
                <small>包含不同的班级</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/student/homepage"><i class="fa fa-home"></i> 主页</a></li>
                <li><a href="/student/all_lessons"> 所有课程计划</a></li>
                <li class="active">${lesson.name}</li>
            </ol>
        </section>

        <div class="pad margin no-print">
            <div class="callout callout-info" style="margin-bottom: 0!important;">
                <h4><i class="fa fa-info"></i> 提示：</h4>
                点击下方“打印”按钮，即可打印本页课程计划。
            </div>
        </div>

        <!-- Main content -->
        <section class="invoice">
            <!-- 课程标题 -->
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        <i class="fa fa-calendar"></i> ${lesson.name}
                        <small class="pull-right" id="lesson-state"></small>
                    </h2>
                </div>
                <!-- /.col -->
            </div>
            <!-- 基础信息 -->
            <div class="row invoice-info">

                <div class="col-sm-3 invoice-col">
                    <b>课程名称：</b> ${lesson.name}<br>
                    <br>
                    <b>课程类型：</b> ${lesson.type}<br>
                    <b>课程周期：</b> <fmt:formatDate value="${lesson.startDay}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${lesson.endDay}" pattern="yyyy-MM-dd"/><br>
                    <b>每周课时：</b> ${lesson.timePerWeek} 课时/周<br>
                    <b>周次数量：</b> ${lesson.weekNum} 周
                </div>
                <!-- /.col -->

                <div class="col-sm-3 invoice-col">
                    <b>所属机构：</b> ${college.name}<br>
                    <br>
                    <b>联系电话：</b> ${college.phone}<br>
                    <b>地理位置：</b> ${college.location}<br>
                    <b>师资力量：</b> ${college.teacher}
                </div>
                <!-- /.col -->

                <div class="col-sm-6 invoice-col">
                    <b>课程介绍</b><br>
                    <br>
                    <address>${lesson.intro}</address>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- Table row -->
            <div class="row">
                <div class="col-xs-12 table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>班级名称</th>
                            <th>每班人数</th>
                            <th>班级个数</th>
                            <th>授课教师</th>
                            <th>价格</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${classList}" var="item" >
                            <tr>
                                <td><c:out value="${item.name}"/></td>
                                <td><c:out value="${item.size}"/></td>
                                <td><c:out value="${item.num}"/></td>
                                <td><c:out value="${item.teacher}"/></td>
                                <td>￥<c:out value="${item.price}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- 不被打印的按钮们 -->
            <div class="row no-print">
                <div class="col-xs-12">
                    <a href="/print_lesson?lid=${lesson.id}" target="_blank" class="btn btn-default"><i
                            class="fa fa-print"></i> 打印</a>
                    <a href="/download_lesson?lid=${lesson.id}" target="_blank" class="btn btn-primary" style="margin-left: 5px"><i
                            class="fa fa-download"></i> 下载 PDF</a>

                    <button class="btn btn-success pull-right" onclick="$('#rule-modal').modal('show')"><i class="fa fa-check-square-o"></i> 我要报名</button>
                </div>
            </div>

            <div class="modal fade" id="rule-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">自动配班规则</h4>
                        </div>
                        <div class="modal-body">
                            <div class="box-body">
                                <ul>
                                    <li>不选择班级，付款时按照最低价格支付</li>
                                    <li>如果高价班报名人数不足以单独成班</li>
                                    <ul>
                                        <li>未选择班级的学员按照会员等级排序</li>
                                        <li>等级高的会员优先补入高价班</li>
                                        <li>以此类推，直至除最低价班，其余皆可成班</li>
                                        <li>剩余学员参照下面规则</li>
                                    </ul>
                                    </li>
                                    <li>如果高价班报名人数足以单独成班</li>
                                    <ul>
                                        <li>剩余学员按照报名先后分入最低价班</li>
                                        <li>若班级全满则自动退款</li>
                                    </ul>
                                </ul>
                            </div>
                        </div>
                        <!-- /.modal-content -->

                        <div class="modal-footer">
                            <a href="/student/enroll_lesson_without?lid=${lesson.id}" class="btn btn-success pull-left">自动配班</a>
                            <a href="/student/enroll_lesson_with_class?lid=${lesson.id}" class="btn btn-primary">手动选班</a>
                        </div>
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal lesson -->
            </div>

        </section>
        <!-- /.content -->
        <div class="clearfix"></div>
    </div>

    <jsp:include page="../public/footer.jsp" flush="true"/>
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
<script type="text/javascript">
    $(document).ready(function () {
        var state = ${lesson.state};
        switch (state) {
            case 1:
                $('#lesson-state').text("报名中");
                break;
            case 2:
                $('#lesson-state').text("报名截止");
                $('#enroll-button').attr("disabled","true");
                break;
            case 3:
                $('#lesson-state').text("已结束");
                $('#enroll-button').attr("disabled","true");
                break;
        }
    });
</script>
</body>
</html>
