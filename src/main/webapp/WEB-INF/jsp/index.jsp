<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="common/header.jsp"%>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="common/navbar.jsp"%>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="font-family:arial;color:red;font-size:50px;padding: 250px;">施工中。。。。。</div>
    </div>

</div>
<div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
</div>
<%@include file="common/footer.jsp"%>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

</script>
</body>
</html>
