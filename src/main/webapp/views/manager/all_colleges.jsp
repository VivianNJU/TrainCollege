<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/1/27
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <jsp:param name="colleges" value="active menu-open"/>
        <jsp:param name="all_college" value="active"/>
    </jsp:include>

    <div class="content-wrapper">
        <!-- 大标题 -->
        <section class="content-header">
            <h1>
                机构信息
                <small>所有机构</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/college_manager/homepage"><i class="fa fa-home"></i> Home</a></li>
                <li class="active">所有机构</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="box-body">
                            <table id="college_table" class="table table-bordered table-hover">

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
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
<!-- DataTables -->
<script src="/static/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<%--<!-- FastClick -->--%>
<script src="/static/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/js/demo.js"></script>
<script>
    var dataSet = [
        ['0000001','新西方','西方','1234567890','已审核'],
        ['0000002','新南方','南方','1234567890','未审核']
        ];
    $(function () {
        $('#college_table').DataTable({
            'data'        : dataSet,
            // "ajax": {
            //     "url": "/college_manager/all_colleges",
            //     "type": "POST"
            // },
            "columns"     : [
                { "title": "机构编号" },
                { "title": "机构名称" },
                { "title": "地理位置"},
                { "title": "联系电话" },
                { "title": "状态" },
                { "title": "操作" }
            ],
            "aoColumnDefs":[//设置列的属性，此处设置最后一列
                {
                    "targets": -1,
                    "class": "but_xq",
                    "data": null,
                    "bSortable": false,
                    "defaultContent": "<a id=‘more’ onclick='more(this)' href='#'>查看详情</a>"
                }
            ],

            'paging'      : true,
            'lengthChange': false,
            'searching'   : true,
            'ordering'    : true,
            'autoWidth'   : false,
            'pageLength'  : 20,
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
    })

    /**
     * 查看详情
     */
    function more(node) {
        var data = $('#college_table').DataTable().row(node.parentNode.parentNode).data();
        alert("查看详情："+data[0] +","+ data[1]+","+ data[2] );
    }
</script>
</body>
</html>
