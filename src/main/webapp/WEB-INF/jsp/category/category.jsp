<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <legend>分类列表</legend>
        </fieldset>
        <form class="layui-form" action="/category/query">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="type" placeholder="请输入类型名称" required lay-verify="required"
                           autocomplete="off" class="layui-input"/>
                </div>
                <button type="submit" class="layui-btn layui-btn-primary layui-btn-small">搜索</button>
                <button type="button" class="layui-btn layui-btn-small" onclick="reload()">刷新</button>
            </div>
        </form>
        <form id="form" class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" id="type" name="type" placeholder="请输入类型名称" class="layui-input"/>
                </div>
                <button class="layui-btn layui-btn-normal layui-btn-small" lay-submit="" lay-filter="form">添加</button>
            </div>
        </form>
        <table class="layui-table">
            <colgroup>
                <col width="50">
                <col width="200">
                <col width="100">
                <col width="100">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>名称</th>
                <th>文章数</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${categories}" var="c" varStatus="status">
                <tr>
                    <td class="layui-bg-gray">${ status.index + 1}</td>
                    <td>
                        <a href="" target="_blank">${c.type}</a>
                    </td>
                    <td>${c.articleCount}篇</td>
                    <td>
                            <%--<a href="/category/delete/${c.categoryId}"--%>
                            <%--class="layui-btn layui-btn-small layui-btn-danger" onclick="confirmDelete()">删除</a>--%>
                        <button class="layui-btn layui-btn-danger layui-btn-small"
                                onclick="deleteById('/category/delete/${c.categoryId}','',this)">删除
                        </button>
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
    var form;
    //JavaScript代码区域
    layui.use(['form', 'element'], function () {
        var element = layui.element;
        form = layui.form;

        // 监听提交
        form.on('submit(form)', function (data) {
            /* layer.alert(JSON.stringify(data.field), {
              title: '最终的提交信息'
            })  */
            layer.load(2);
            $.ajax({
                cache: true,
                type: "POST",
                url: "/category/add",
                dataType: "json",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: $('#form').serialize(),// 你的formid
                async: false,
                error: function (request) {
                    alert("Connection error");
                },
                success: function (data) {
                    layer.closeAll();
                    layer.msg(data.msg);
                }
            });
            return false;
        });
    });

</script>
</body>
</html>
