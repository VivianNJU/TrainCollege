<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/2/7
  Time: 22:23
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
                已选择自动配班，该订单最多报名9人，在开课前两周，自动配班
                <i class="fa fa-question-circle" onclick="$('#rule-modal').modal('show')"></i>，配班失败则退回全部金额。
            </div>
        </div>

        <!-- Main content -->
        <section class="content">

            <%--基础成员--%>
            <div class="col-md-6">

                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-angle-right"></i> 填写用户信息</h3>
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
                            <select name="type" class="form-control select2" multiple="multiple" data-placeholder="选择类型"
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
                                <input name="date_range" type="text" class="form-control pull-right" id="date-range" required>
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->

                        <!-- 课时 -->
                        <div class="form-group">
                            <label>课时数量（每周）：</label>

                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-files-o"></i>
                                </div>
                                <input name="times" type="number" class="form-control" placeholder="2">
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->

                        <!-- 周次 -->
                        <div class="form-group">
                            <label>周次数量：</label>

                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-files-o"></i>
                                </div>
                                <input name="weeks" type="number" class="form-control" placeholder="12">
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

                    <div class="box-footer">
                        <button class="btn btn-info pull-right" type="submit">保存信息</button>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->

            </div>
            <!-- /.col (left) -->


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
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal lesson -->
                </div>
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
</body>
</html>
