<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Sboy
  Date: 2017/7/25
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html >

<head>
    <title>登录界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/static/assets/adminlte-2.3.7/css/AdminLTE.min.css"/>
    <link rel="stylesheet" href="/static/assets/adminlte-2.3.7/css/skins/_all-skins.min.css"/>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body class="hold-transition skin-blue login-page" target="_top">
<div class="login-box">
    <div class="login-logo">
        <b>后台登录</b>
    </div>
    <div class="login-box-body">
        <form action="/loginVerify" method="POST" >
            <div class="form-group has-feedback">
                <input type="text" name="username" class="form-control" required lay-verify="required"/>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" class="form-control" required lay-verify="required"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
            </div>
        </form>
    </div>
    <%@include file="common/_alert.jsp" %>
</div>
<script type="text/javascript" src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
