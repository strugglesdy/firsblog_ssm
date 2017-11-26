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
            <legend>${user.userId!=null?'编辑':'添加'}用户</legend>
        </fieldset>
        <form id="form" class="layui-form" action="">
            <input type="hidden" name="userId" value="${user.userId}"/>
            <input type="hidden" name="userAvatar" value="${user.userAvatar}" id="userAvatar"/>
            <div class="layui-form-item">
                <label class="layui-form-label">头像</label>
                <div class="layui-input-inline">
                    <div class="layui-upload">
                        <div class="layui-upload-list" style="">
                            <img class="layui-upload-img" id="imgUrl" src="${user.userAvatar}"
                                 width="100"
                                 height="100">
                            <p id="uploadText"></p>
                        </div>
                        <button type="button" class="layui-btn" id="uploadImg">上传图片</button>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名 <span style="color: #FF5722; ">*</span></label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="required"
                           autocomplete="off" placeholder="请输入用户名" class="layui-input"
                           value="${user.userId != null ? user.username : null}"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码 <span style="color: #FF5722; ">*</span></label>
                <div class="layui-input-block">
                    <input type="password" name="password" lay-verify="pass"
                           autocomplete="off" placeholder="请输入密码" class="layui-input"
                           value="${user.userId != null ? user.password : null}}"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">昵称<span style="color: #FF5722; ">*</span></label>
                <div class="layui-input-inline">
                    <input type="text" name="nickname" placeholder="请输入昵称"
                           autocomplete="off" class="layui-input" value="${user.nickname}">
                </div>
                <label class="layui-form-label">用户邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" placeholder="请输入邮箱"
                           autocomplete="off" class="layui-input" value="${user.email}">
                </div>
                <div class="layui-form-mid layui-word-aux">选填</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-block">
                   <input type="radio" name="isEnabled" value="1" title="启用"
                           <c:if test="${user.isEnabled==1}">checked</c:if>>
                    <input type="radio" name="isEnabled" value="0" title="禁用"
                           <c:if test="${user.isEnabled==0}">checked</c:if>>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <%--<button type="submit" class="layui-btn">立即提交</button>--%>
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
    layui.use(['form', 'layedit', 'laydate', 'element', 'upload'], function () {
        var layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , element = layui.element;

        // 单独定义,用作后续刷新
        form = layui.form;
        upload = layui.upload;

        // 上传头像
        var uploadImg = upload.render({
            elem: '#uploadImg'
            , url: '/upload/uploadImage'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                layer.load(2);
                obj.preview(function (index, file, result) {
                    $('#imgUrl').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                layer.closeAll();
                //如果上传失败
                if (res.code > 0) {
                    layer.msg('上传失败');
                    return false;
                }

                layer.msg(res.msg);
                //上传成功
                if (res.status > 0) {
                    $("#userAvatar").val(res.result[0]);
                }
            }
            , error: function () {
                //演示失败状态，并实现重传
                var text = $('#uploadText');
                text.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini img-reload">重试</a>');
                text.find('.img-reload').on('click', function () {
                    uploadImg.upload();
                });
            }
        });

        // 注意：layedit.set 一定要放在 build 前面，否则配置全局接口将无效。
        layedit.set({
            uploadImage: {
                url: '/upload/uploadImageForEdit' //接口url
                , type: 'post' //默认post
            }
        });

        //创建一个编辑器
        var editIndex = layedit.build('content', {
                height: 350,
            }
        );

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){5,12}$/, '密码必须5到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        // 监听提交
        form.on('submit(form)', function (data) {
            /* layer.alert(JSON.stringify(data.field), {
              title: '最终的提交信息'
            })  */
            // 校验封面
            if(!$("#userAvatar").val()){
                layer.msg('未上传头像', {icon: 5,anim: 6});
                return false;
            }
            layer.load(2);
            $.ajax({
                cache: true,
                type: "POST",
                url: "/user/editSubmit",
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
