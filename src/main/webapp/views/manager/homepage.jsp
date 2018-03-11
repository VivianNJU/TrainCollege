<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/1/27
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <jsp:include page="../public/manager_header.jsp" flush="true" />

    <jsp:include page="../public/manager_nav.jsp" flush="true" >
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

            <!-- Main row -->
            <div class="row">
                <section class="col-lg-12">

                    <div class="box box-success">

                        <div class="box-header">
                            <h3 class="box-title">所有机构</h3>

                            <a class="pull-right" href="/college_manager/all_colleges"> 更多 >>> </a>
                        </div>

                        <div class="box-body">
                            <table id="college-table" class="table table-bordered table-hover">

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </section>
                <!-- /. col -->

                <section class="col-lg-12">

                    <div class="box box-success">

                        <div class="box-header">
                            <h3 class="box-title">所有学员</h3>

                            <a class="pull-right" href="/college_manager/all_students"> 更多 >>> </a>
                        </div>

                        <div class="box-body">
                            <table id="student-table" class="table table-bordered table-hover">

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </section>
                <!-- /. col -->



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
        $('#college-table').DataTable({
            "ajax": {
                "url": "/college_manager/all_colleges",
                "type": "POST"
            },
            "columns"     : [
                { "title": "机构编号",
                    "data":"id"},
                { "title": "机构名称",
                    "data":"name"},
                { "title": "地理位置",
                    "data":"location"},
                { "title": "联系电话",
                    "data":"phone"},
                { "title": "状态",
                    "data":"state"}
            ],
            //每行回调函数
            "fnRowCallback": function( nRow, aData ) {
                //为id前面补0
                var id = aData.id;
                $('td:eq(0)', nRow).html(( "0000000" + id ).substr( -7 ));
                //每行中的状态列  该状态进行判断 并设置相关的列值
                var state = aData.state;
                switch (state){
                    case 0:
                        $('td:eq(4)', nRow).html("未认证");
                        break;
                    case 1:
                        $('td:eq(4)', nRow).html("已认证");
                        break;
                    case 2:
                        $('td:eq(4)', nRow).html("已驳回");
                        break;
                    case 3:
                        $('td:eq(4)', nRow).html("已注销");
                        break;
                }

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
        });

        $('#student-table').DataTable({
            "ajax": {
                "url": "/college_manager/all_students",
                "type": "POST"
            },
            "columns"     : [
                { "title": "ID",
                    "data":"id"},
                { "title": "名称",
                    "data":"username"},
                { "title": "电子邮箱",
                    "data":"email"},
                { "title": "联系电话",
                    "data":"phone"},
                { "title": "状态",
                    "data":"state"}
            ],
            //每行回调函数
            "fnRowCallback": function( nRow, aData ) {
                //每行中的状态列  该状态进行判断 并设置相关的列值
                var state = aData.state;
                switch (state){
                    case 0:
                        $('td:eq(4)', nRow).html("未验证");
                        break;
                    case 1:
                        $('td:eq(4)', nRow).html("已验证");
                        break;
                    case 2:
                        $('td:eq(4)', nRow).html("已注销");
                        break;
                }

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
