<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/1/26
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <jsp:include page="../public/college_header.jsp" flush="true" />

    <jsp:include page="../public/college_nav.jsp" flush="true" >
        <jsp:param name="homepage" value="active"/>
    </jsp:include>

    <div class="content-wrapper">

        <!-- 大标题 -->
        <section class="content-header">
            <h1>
                主页
            </h1>
        </section>

        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>${datas[0]} 个</h3>

                            <p>课程计划</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-clipboard"></i>
                        </div>
                        <a href="/college/all_lessons" class="small-box-footer">查看详情 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>${datas[1]} 份</h3>

                            <p>订单</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-ios-bookmarks-outline"></i>
                        </div>
                        <a href="#" class="small-box-footer">查看详情 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3>${datas[2]} 人次</h3>

                            <p>学生数量</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="/college/begin_lessons" class="small-box-footer">查看详情 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3>${datas[3]} 次</h3>

                            <p>交易记录</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="/college/payment" class="small-box-footer">查看详情 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
            </div>


            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <section class="col-lg-7">

                    <div class="box box-success">

                        <div class="box-header">
                            <h3 class="box-title">所有课程</h3>
                        </div>

                        <div class="box-body">
                            <table id="lesson-table" class="table table-bordered table-hover">

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </section>
                <!-- /.Left col -->


                <section class="col-lg-5">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">交易记录</h3>
                        </div>
                        <div class="box-body">
                            <!-- The time line -->
                            <ul class="timeline">
                                <c:forEach items="${paymentList}" var="item" >
                                    <c:set var="current" value='${item.paytime.year}-${item.paytime.month}-${item.paytime.day}'/>
                                    <c:if test="${last!=current}">
                                        <!-- timeline time label -->
                                        <li class="time-label">
                            <span class="bg-green">
                                <fmt:formatDate value="${item.paytime}" pattern="yyyy-MM-dd"/>
                            </span>
                                        </li>
                                        <!-- /.timeline-label -->
                                    </c:if>

                                    <!-- timeline item -->
                                    <li>
                                        <c:choose>
                                            <c:when test="${item.type==0}">
                                                <i class="fa fa-arrow-circle-left bg-purple"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fa fa-arrow-circle-right bg-light-blue"></i>
                                            </c:otherwise>
                                        </c:choose>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${item.paytime}" pattern="HH:mm"/></span>

                                            <h3 class="timeline-header"><b>${item.email}</b> 与你进行交易</h3>

                                            <div class="timeline-body">
                                                <c:choose>
                                                    <c:when test="${item.type==0}">
                                                        <b>${item.email}</b> 向你转账${item.payment}元。
                                                    </c:when>
                                                    <c:otherwise>
                                                        你向 <b>${item.email}</b> 退款${item.payment}元。
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </li>
                                    <c:set var="last" value='${item.paytime.year}-${item.paytime.month}-${item.paytime.day}'/>
                                    <!-- END timeline item -->
                                </c:forEach>

                                <li>
                                    <i class="fa fa-clock-o bg-gray"></i>
                                </li>
                            </ul>

                        </div>
                    </div>

                </section>
                <!-- right col -->
            </div>
            <!-- /.row (main row) -->
        </section>
    </div>

    <jsp:include page="../public/footer.jsp" flush="true" />
</div>

<!-- jQuery 3 -->
<script src="/static/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/static/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<%--<!-- SlimScroll -->--%>
<script src="/static/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<%--<!-- FastClick -->--%>
<script src="/static/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/js/demo.js"></script>
<script>
    $(function () {
        $('#lesson-table').DataTable({
            "ajax": {
                "url": "/college/get_lessons_by_state",
                "type": "POST",
                "data": {
                    "state": -1
                }
            },
            "columns"     : [
                { "title": "课程名称",
                    "data":"name"},
                { "title": "类型",
                    "data":"type"},
                { "title": "开始日期",
                    "data":"startDay"},
                { "title": "结束日期",
                    "data":"endDay"},
                { "title": "每周课时",
                    "data":"timePerWeek"},
                { "title": "状态",
                    "data":"state"}
            ],
            //每行回调函数
            "fnRowCallback": function( nRow, aData ) {
                //每行中的状态列  该状态进行判断 并设置相关的列值
                var state = aData.state;
                switch (state){
                    case 0:
                        $('td:eq(5)', nRow).html("未发布");
                        break;
                    case 1:
                        $('td:eq(5)', nRow).html("已发布，报名中");
                        break;
                    case 2:
                        $('td:eq(5)', nRow).html("报名截止，已开课");
                        break;
                    case 3:
                        $('td:eq(5)', nRow).html("已结束");
                        break;
                }
                var start = new Date(aData.startDay);
                $('td:eq(2)', nRow).html(start.toLocaleDateString());
                var end = new Date(aData.endDay);
                $('td:eq(3)', nRow).html(end.toLocaleDateString());

                var id = aData.id;
                $('td:eq(0)', nRow).html('<a href="/college/show_lesson?lid='+id+'">'+aData.name+'</a>');

            },

            'paging'      : true,
            'lengthChange': false,
            'searching'   : true,
            'ordering'    : true,
            'autoWidth'   : false,
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            }
        })
    });
</script>
</body>
</html>
