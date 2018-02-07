<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/2/6
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Train COLLEGE | 课程详情页</title>
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
<body>
<div class="wrapper">
    <!-- Main content -->
    <section class="invoice">
        <!-- 课程标题 -->
        <div class="row">
            <div class="col-xs-12">
                <h2 class="page-header">
                    <i class="fa fa-calendar"></i> ${lesson.name}
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

    </section>
</div>

<!-- jQuery 3 -->
<script src="/static/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
<%--<!-- SlimScroll -->--%>
<script src="/static/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<%--<!-- FastClick -->--%>
<script src="/static/fastclick/lib/fastclick.js"></script>
<!-- pdf download -->
<script type="text/javascript" src="/js/html2canvas.js"></script>
<script type="text/javascript" src="/js/jsPdf.debug.js"></script>
<!-- AdminLTE App -->
<script src="/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/js/demo.js"></script>
<script>
    $(document).ready(function () {
        if(${command=='print'}){
            window.print();
        }else {
            download_pdf();
        }
    });

    function download_pdf() {
        var node = document.getElementsByClassName('invoice').item(0);
        html2canvas(node, {
            onrendered:function(canvas) {
                var contentWidth = canvas.width;
                var contentHeight = canvas.height;
                //一页pdf显示html页面生成的canvas高度;
                var pageHeight = contentWidth / 595.28 * 841.89;
                //未生成pdf的html页面高度
                var leftHeight = contentHeight;
                //pdf页面偏移
                var position = 0;
                //a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
                var imgWidth = 555.28;
                var imgHeight = 555.28/contentWidth * contentHeight;
                var pageData = canvas.toDataURL('image/jpeg', 1.0);
                var pdf = new jsPDF('', 'pt', 'a4');
                //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
                //当内容未超过pdf一页显示的范围，无需分页
                if (leftHeight < pageHeight) {
                    pdf.addImage(pageData, 'JPEG', 20, 0, imgWidth, imgHeight );
                } else {
                    while(leftHeight > 0) {
                        pdf.addImage(pageData, 'JPEG', 20, position, imgWidth, imgHeight)
                        leftHeight -= pageHeight;
                        position -= 841.89;
                        //避免添加空白页
                        if(leftHeight > 0) {
                            pdf.addPage();
                        }
                    }
                }
                pdf.save('${lesson.name}.pdf');
            }
        })
    }


</script>

</body>
</html>
