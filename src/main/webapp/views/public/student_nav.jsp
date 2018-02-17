<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/1/25
  Time: 10:09
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
                <p>${student.username}</p>
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
                <a href="/student/homepage">
                    <i class="fa fa-home"></i> <span> 主页</span>
                    <span class="pull-right-container">
            </span>
                </a>
            </li>

<%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>

            <li class="${param.browse}">
                <a href="/student/all_lessons">
                    <i class="fa fa-home"></i> <span> 课程浏览</span>
                    <span class="pull-right-container">
            </span>
                </a>
            </li>

<%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>

            <li class="treeview ${param.my_orders}">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>我的订单</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="${param.all_orders}"><a href="#"><i class="fa fa-circle-o"></i> 所有订单</a></li>
                    <li class="${param.not_pay}"><a href="#"><i class="fa fa-circle-o"></i> 未支付订单</a></li>
                    <li class="${param.has_pay}"><a href="#"><i class="fa fa-circle-o"></i> 已支付订单</a></li>
                    <li class="${param.cancel_order}"><a href="#"><i class="fa fa-circle-o"></i> 退订订单</a></li>
                </ul>
            </li>

<%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>

            <li class="treeview ${my_course}">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>我的课程</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="${all}"><a href="#"><i class="fa fa-circle-o"></i> 所有课程</a></li>
                    <li class="${not_pay}"><a href="#"><i class="fa fa-circle-o"></i> 课程考勤</a></li>
                    <li class="${not_pay}"><a href="#"><i class="fa fa-circle-o"></i> 我要退课</a></li>
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
