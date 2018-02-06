<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/1/26
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/image/user.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${college.name}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="${param.homepage}">
                <a href="/college/homepage">
                    <i class="fa fa-home"></i> <span>主 页</span>
                    <span class="pull-right-container">
            </span>
                </a>
            </li>

            <%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>

            <li class="treeview ${param.browse}">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>课程浏览</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="${param.all_lessons}"><a href="/college/all_lessons"><i class="fa fa-circle-o"></i> 所有课程</a></li>
                    <li class="${param.release_lessons}"><a href="/college/release_lessons"><i class="fa fa-circle-o"></i> 已发布课程</a></li>
                    <li class="${param.unrelease_lessons}"><a href="/college/unrelease_lessons"><i class="fa fa-circle-o"></i> 未发布课程</a></li>
                </ul>
            </li>

            <%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>

            <li class="treeview ${param.lesson_more}">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>课程详情</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="${param.new_lesson}"><a href="/college/create_lesson"><i class="fa fa-circle-o"></i> 新增课程</a></li>
                    <li class="${attendence}"><a href="#"><i class="fa fa-circle-o"></i> 考勤录入</a></li>
                    <li class="${grade}"><a href="#"><i class="fa fa-circle-o"></i> 成绩录入</a></li>
                </ul>
            </li>

            <%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>

            <li class="treeview ${course_more}">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>线下登记</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="${course_introduction}"><a href="#"><i class="fa fa-circle-o"></i> 报名课程</a></li>
                    <li class="${attendence}"><a href="#"><i class="fa fa-circle-o"></i> 退订课程</a></li>
                </ul>
            </li>

            <%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>
            <li class="${help}">
                <a href="#">
                    <i class="fa fa-home"></i> <span> 网站说明</span>
                    <span class="pull-right-container">
            </span>
                </a>
            </li>

            <%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
