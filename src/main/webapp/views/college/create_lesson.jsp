<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/2/4
  Time: 16:46
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
    <!-- daterange picker -->
    <link rel="stylesheet" href="/static/bootstrap-daterangepicker/daterangepicker.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/static/select2/dist/css/select2.min.css">
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
        <jsp:param name="lesson_more" value="active menu-open"/>
        <jsp:param name="new_lesson" value="active"/>
    </jsp:include>

    <div class="content-wrapper">

        <!-- 大标题 -->
        <section class="content-header">
            <h1>
                新建课程计划
                <small>添加不同的班级</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/college/homepage"><i class="fa fa-home"></i> 主页</a></li>
                <li class="active">新建课程计划</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">

                <%--课程计划部分--%>
                <div class="col-md-6">

                    <div class="box box-info">
                        <div class="box-header">
                            <h3 class="box-title"><i class="fa fa-angle-right"></i> 填写课程计划信息</h3>
                        </div>
                        <div class="box-body">

                            <!-- lesson name -->
                            <div class="form-group">
                                <label>课程计划名称：</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-send"></i>
                                    </div>
                                    <input name="name" type="text" class="form-control pull-right" placeholder="计划名称" required>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <div class="form-group">
                                <label>课程类型（可多选）：</label>
                                <select class="form-control select2" multiple="multiple" data-placeholder="选择类型"
                                        style="width: 100%;">
                                    <option>语文</option>
                                    <option>数学</option>
                                    <option>外语</option>
                                    <option>物理</option>
                                    <option>化学</option>
                                    <option>生物</option>
                                    <option>地理</option>
                                    <option>政治</option>
                                    <option>历史</option>
                                    <option>艺术</option>
                                    <option>计算机</option>
                                    <option>考研</option>
                                    <option>其它</option>
                                </select>
                            </div>

                            <!-- Date range -->
                            <div class="form-group">
                                <label>课程周期：</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control pull-right" id="date-range" required>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- （课时/周*周次） -->
                            <div class="form-group">
                                <label>课时次数：</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-files-o"></i>
                                    </div>
                                    <input type="text" class="form-control" data-inputmask='"mask": "9[9]课时/周 × 9[9]周次"' data-mask>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- introduction -->
                            <div class="form-group">
                                <label>课程介绍</label>
                                <textarea name="intro" class="form-control" rows="5" placeholder="写点什么吧"></textarea>
                            </div>

                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </div>
                <!-- /.col (left) -->

                <%--班级详情--%>
                <div class="col-md-6" id="classes-more">
                    <input name="class_num" type="hidden" id="class_num" value="1">
                    <div class="box box-primary" id="class0">
                        <div class="box-header">
                            <h3 class="box-title"><i class="fa fa-angle-double-right"></i> 填写班级信息</h3>
                        </div>
                        <div class="box-body">

                            <!-- 班级名称 -->
                            <div class="form-group">
                                <label>班级名称：</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-tag"></i>
                                    </div>
                                    <input name="classname1" type="text" class="form-control pull-right" placeholder="班级名称" required>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- 教师名称 -->
                            <div class="form-group">
                                <label>教师名称：</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input name="teacher1" type="text" class="form-control pull-right" placeholder="教师姓名" required>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- 班级价格 -->
                            <div class="form-group">
                                <label>收费标准：</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-rmb"></i>
                                    </div>
                                    <input name="price1" type="number" class="form-control pull-right" placeholder="2000" required>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- （人/班*班级个数） -->
                            <div class="form-group">
                                <label>班级规格：</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-files-o"></i>
                                    </div>
                                    <input name="size1" type="text" class="form-control" data-inputmask='"mask": "9[99]人/班 × 9[9]个班"' data-mask>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <button class="btn btn-danger">删除</button>
                            <button class="btn btn-info pull-right">新增</button>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col (right) -->
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
<!-- date-range-picker -->
<script src="/static/moment/min/moment.min.js"></script>
<script src="/static/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- Select2 -->
<script src="/static/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="/js/input-mask/jquery.inputmask.js"></script>
<script src="/js/input-mask/jquery.inputmask.extensions.js"></script>
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
        //Initialize Select2 Elements
        $('.select2').select2();
        //Money Euro
        $('[data-mask]').inputmask();
        //Date range picker
        $('#date-range').daterangepicker({
            locale : {
                applyLabel : '确定',
                cancelLabel : '取消',
                fromLabel : '起始时间',
                toLabel : '结束时间',
                daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
                monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月' ],
                firstDay : 1
            }
        });
    })

    function addClass() {

    }
</script>
</body>
</html>
