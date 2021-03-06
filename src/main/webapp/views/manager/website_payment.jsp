<%--
  Created by IntelliJ IDEA.
  User: jqwu
  Date: 2018/2/27
  Time: 下午6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Train COLLEGE | Website Payment</title>
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
        <jsp:param name="money" value="active menu-open"/>
        <jsp:param name="website_payment" value="active"/>
    </jsp:include>

    <div class="content-wrapper">

        <!-- 大标题 -->
        <section class="content-header">
            <h1>
                网站收支
            </h1>
            <ol class="breadcrumb">
                <li><a href="/college_manager/homepage"><i class="fa fa-home"></i> 主页</a></li>
                <li class="active">网站收支</li>
            </ol>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">${year}年收支柱状图</h3>
                            <div class="form-group pull-right">
                                <label>年份</label>
                                <select class="form-control" id="years" onchange="change_year()">
                                </select>
                            </div>
                        </div>
                        <div class="box-body">
                            <canvas id="payment-bar" style="height:250px"></canvas>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
    </div>

    <jsp:include page="../public/footer.jsp" flush="true" />
</div>

<!-- jQuery 3 -->
<script src="/static/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- ChartJS -->
<script src="/static/chart.js/Chart.js"></script>
<%--<!-- SlimScroll -->--%>
<script src="/static/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<%--<!-- FastClick -->--%>
<script src="/static/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/js/demo.js"></script>
<script>
    var MONTHS = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];

    $(function () {
        $.post("/college_manager/payment_data",
            {
                year: ${year}
            },
            function (data) {
                var indata = data.slice(0,12);
                var outdata = data.slice(12,24);

                var barChartData = {
                    labels: MONTHS,
                    datasets: [{
                        label: '收入',
                        backgroundColor: "rgba(54, 162, 235, 0.8)",
                        borderColor: "rgba(54, 162, 235, 1)",
                        borderWidth: 1,
                        data: indata
                    }, {
                        label: '支出（退款）',
                        backgroundColor: "rgba(255, 99, 132, 0.8)",
                        borderColor: "rgba(255, 99, 132, 1)",
                        borderWidth: 1,
                        data: outdata
                    }]

                };

                var ctx = document.getElementById('payment-bar').getContext('2d');
                window.myBar = new Chart(ctx, {
                    type: 'bar',
                    data: barChartData,
                    options: {
                        responsive: true,
                        legend: {
                            position: 'bottom'
                        }
                    }
                });
            });


        for(var i = 2017;i<=new Date().getFullYear();i++){
            if(parseInt(${year})==i){
                $('#years').append('<option selected>'+i+'</option>');
            }else{
                $('#years').append('<option>'+i+'</option>');
            }
        }

    });

    function change_year() {
        var checkValue=$("#years").val();
        window.location.href="/college_manager/website_payment?year="+checkValue;
    }

</script>

</body>
</html>

