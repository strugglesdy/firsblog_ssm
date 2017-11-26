<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="../common/header.jsp" %>
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <%@include file="../common/navbar.jsp" %>

    <div class="layui-body">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>文章列表</legend>
        </fieldset>
        <form class="layui-form" action="/article/query">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="title" placeholder="请输入文章名称" required lay-verify="required"
                           autocomplete="off" class="layui-input"/>
                </div>
                <button type="submit" class="layui-btn layui-btn-primary layui-btn-small">搜索</button>
                <button type="button" class="layui-btn layui-btn-normal layui-btn-small"
                        onclick="skip('/article/add','')">新增
                </button>
                <button type="button" class="layui-btn layui-btn-small" onclick="reload()">刷新</button>
            </div>
        </form>
        <table class="layui-table">
            <colgroup>
                <col width="50">
                <col width="150">
                <col width="100">
                <col width="75">
                <col width="100">
                <col width="100">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>文章名称</th>
                <th>作者</th>
                <th>所属类别</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${articles}" var="a" varStatus="status">
                <tr>
                    <td class="layui-bg-gray">${ status.index + 1}</td>
                    <td>
                        <a href="" target="_blank">${a.title}</a>
                    </td>
                    <td>${a.nickname}</td>
                    <td>
                        <a href="/category/list">${a.type}</a>
                    </td>
                    <td><fmt:formatDate value="${a.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <button class="layui-btn layui-btn-small" onclick="skip('/article/edit/${a.articleId}','')">编辑</button>
                        <button class="layui-btn layui-btn-danger layui-btn-small" onclick="deleteById('/article/delete/${a.articleId}','',this)">删除</button>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<%@include file="../common/footer.jsp" %>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });


</script>
</body>
</html>
