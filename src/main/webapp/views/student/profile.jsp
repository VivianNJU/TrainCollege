<%--
  Created by IntelliJ IDEA.
  User: jqwu
  Date: 2018/2/25
  Time: 下午4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Train COLLEGE | Profile</title>
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
        <jsp:param name="personal" value="active menu-open"/>
        <jsp:param name="profile" value="active"/>
    </jsp:include>

    <div class="content-wrapper">

        <!-- 大标题 -->
        <section class="content-header">
            <h1>
                用户信息
                <small>查看/修改信息，取消会员资格</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/student/homepage"><i class="fa fa-home"></i> 主页</a></li>
                <li class="active">用户信息</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-4">

                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle" src="/image/user.jpg">

                            <h3 class="profile-username text-center">${student.username}</h3>

                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>等级</b> <a class="pull-right">${level}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>等级折扣</b> <a class="pull-right">${discount}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>经验值</b> <a class="pull-right">${student.expr}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>状态</b> <a class="pull-right">已验证</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!--.col-->

                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">其他信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <strong><i class="fa fa-envelope margin-r-5"></i> 电子邮箱</strong>

                            <p class="text-muted">
                                ${student.email}
                            </p>

                            <hr>

                            <strong><i class="fa fa-phone-square margin-r-5"></i> 联系方式</strong>

                            <p class="text-muted">${student.phone}</p>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <button class="btn btn-danger" onclick="delete_student()" ><i class="fa fa-close"></i> 取消会员资格</button>
                            <button class="btn btn-success pull-right" data-toggle="modal" data-target="#change-modal">
                                <i class="fa fa-edit"></i> 修改信息</button>
                            <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#pwd-modal" style="margin-right: 10px">
                                <i class="fa fa-edit"></i> 修改密码</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <!--.row-->

            <div class="modal fade" id="change-modal">
                <div class="modal-dialog">
                    <form method="post" action="/student/profile_save">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>联系电话：</label>
                                    <input value="${student.phone}" name="phone" type="tel" class="form-control">
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn pull-left" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary">保存修改</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </form>
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->

            <div class="modal fade" id="pwd-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">修改密码</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>旧密码：</label>
                                <input id="old-pwd" type="password" class="form-control">
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <div class="form-group">
                                <label>新密码：</label>
                                <input id="new-pwd1" type="password" class="form-control">
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <div class="form-group">
                                <label>重复新密码：</label>
                                <input id="new-pwd2" type="password" class="form-control">
                                <!-- /.input group -->
                                <span id="error" class="help-block" style="color: red"></span>
                            </div>
                            <!-- /.form group -->
                        </div>
                        <div class="modal-footer">
                            <button class="btn pull-left" data-dismiss="modal">取消</button>
                            <button onclick="modify_pwd()" class="btn btn-primary">保存修改</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
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
<script>
    function delete_student() {
        if(confirm("取消会员资格后不可恢复，也无法登陆，确定要取消会员资格吗？")){
            $.post("/student/delete",
                {
                },
                function () {
                    window.location.href="/index";
                });
        }
    }

    function modify_pwd() {
        if($('#new-pwd1').val()==$('#new-pwd2').val()){
            $.post("/student/pwd_save",
                {
                    old:$('#old-pwd').val(),
                    password:$('#new-pwd1').val()
                },
                function (data) {
                    if(data==true)
                        window.location.href="/student/profile";
                    else
                        $('#error').html("* 旧密码不正确");
                });
        }else{
            $('#error').html("* 新密码不一致");
        }
    }
</script>
</body>
</html>
