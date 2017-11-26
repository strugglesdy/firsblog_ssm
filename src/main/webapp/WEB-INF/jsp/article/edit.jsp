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
            <legend>${article.articleId !=null ? '编辑':'新建'}文章</legend>
        </fieldset>
        <form id="form" class="layui-form" action="">
            <input type="hidden" name="articleId" value="${article.articleId}"/>
            <input type="hidden" name="content" id="content" value='${article.content}'/>
            <div class="form-group" hidden>
                <label for="articleId" class="sr-only">文章编号</label>
                <input type="text" id="articleId" name="articleId" value="${article.articleId}"/>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">标题 <span style="color: #FF5722; ">*</span></label>
                <div class="layui-input-block">
                    <input type="text" name="title" id="title"
                           placeholder="请输入标题" class="layui-input" value="${article.title}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">文章分类 <span style="color: #FF5722; ">*</span></label>
                <div class="layui-input-block">
                    <select name="categoryId" id="categoryId" lay-filter="categoryId">
                        <option value="" selected>${article.articleId != null ? article.type:('分类')}</option>
                        <c:forEach items="${categories}" var="c">
                            <option value="${c.categoryId}" ${article.categoryId == c.categoryId ? "selected='selected'":""} >${c.type}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">文章内容 </label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea layui-hide" lay-verify=""
                              id="content_editor">${article.content}</textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="form">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary" onclick="getCateIds()">重置</button>
                </div>
            </div>
        </form>


    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<%@include file="../common/footer.jsp" %>

<script>
    //JavaScript代码区域
    var form;
    var upload;

    layui.use(['form', 'layedit', 'element', 'laydate'], function () {
        var layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate,
            element = layui.element;

        form = layui.form;
        upload = layui.upload;

        //上传图片,必须放在 创建一个编辑器前面
        layedit.set({
            uploadImage: {
                url: '/upload/uploadImageForEdit' //接口url
                , type: 'post' //默认post
            }
        });

        //创建一个编辑器
        var editIndex = layedit.build('content_editor', {
                tool: [
                    'strong' //加粗
                    , 'italic' //斜体
                    , 'underline' //下划线
                    , 'del' //删除线

                    , '|' //分割线

                    , 'left' //左对齐
                    , 'center' //居中对齐
                    , 'right' //右对齐
                    , 'link' //超链接
                    , 'unlink' //清除链接
                    , 'face' //表情
                    , 'image' //插入图片
                    , 'code'
                ]
            }
        );
        layui.use('code', function () { //加载code模块
            layui.code();
        });

        // 监听提交
        form.on('submit(form)', function (data) {
            /* layer.alert(JSON.stringify(data.field), {
              title: '最终的提交信息'
            })  */
            var contents = layedit.getContent(editIndex);
            $("#content").val(contents);

            layer.load(2);
            $.ajax({
                cache: true,
                type: "POST",
                url: "/article/editSubmit",
                dataType: "json",
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


//end
    });

</script>
</body>
</html>
