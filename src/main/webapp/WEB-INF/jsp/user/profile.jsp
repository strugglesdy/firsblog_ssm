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
            <legend>个人信息</legend>
        </fieldset>
        <form id="form" class="layui-form" action="/user/editSubmit" method="post">
            <%--<input type="hidden" name="userId" value="${user.userId}"/>--%>
                <div class="layui-form-item">
                    <a class="layui-btn layui-btn-primary"  href="/user/edit/${user.userId}">编辑</a>
                    <label class="layui-form-label">头像</label>
                    <div class="layui-input-inline">
                        <div class="layui-upload">
                            <div class="layui-upload-list" style="">
                                <img class="layui-upload-img" src="${user.userAvatar}" width="100"
                                     height="100">
                            </div>
                        </div>
                    </div>
                </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名 </label>
                <div class="layui-input-inline">
                    <input type="text" value="${user.username}"  id="username" required
                           autocomplete="off" class="layui-input" disabled>
                </div>
                <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码 </label>
                <div class="layui-input-inline">
                    <input type="password" value="${user.password}" id="password" required
                           autocomplete="off" class="layui-input" min="3" max="20" disabled>
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">昵称 </label>
                <div class="layui-input-inline">
                    <input type="text"  value="${user.nickname}" required
                           placeholder="" autocomplete="off" min="2" max="10"
                           class="layui-input" disabled>
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Email </label>
                <div class="layui-input-inline">
                    <input type="email"  value="${user.email}" id="email" required
                           class="layui-input" disabled>
                </div>
                <div class="layui-form-mid layui-word-aux" id="userEmailTips"></div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">注册时间 </label>
                <div class="layui-input-inline">
                    <input type="text"  value="<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
" placeholder="" autocomplete="off"
                           class="layui-input" disabled>
                </div>
            </div>
            <%--<div class="layui-form-item">--%>
                <%--<label class="layui-form-label">最后登录时间 </label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input type="text"  value='<fmt:formatDate value="${userCustom.userLastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
<%--' placeholder="" autocomplete="off"--%>
                           <%--class="layui-input" disabled>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">最后登录IP </label>
                <div class="layui-input-inline">
                    <input type="text"  value="${user.ip}" placeholder="" autocomplete="off"
                           class="layui-input" disabled>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态 </label>
                <div class="layui-input-inline">
                    <input type="text"  value=${user.isEnabled!=0?'启用':'禁用'} placeholder="" autocomplete="off"
                           class="layui-input" disabled>
                </div>
            </div>
        </form>




    <%--    <form id="form" class="layui-form" action="/user/editSubmit" method="post">
            <input type="hidden" name="userId" value="${user.userId}"/>
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
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                    <input type="text" name="nickname" placeholder="请输入昵称"
                           autocomplete="off" class="layui-input" value="${user.nickname}">
                </div>
                <div class="layui-form-mid layui-word-aux">选填</div>
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
                    &lt;%&ndash;                    <input type="checkbox" name="isEnabled" value="${users.isEnabled != null ? users.isEnabled : 0}"
                                                   attr="checked=${(users.isEnabled != null and users.isEnabled == 1) ? ('true'):('false')}"
                                                   lay-skin="switch" lay-filter="switchEnabled" lay-text="ON|OFF"/>&ndash;%&gt;
                    <input type="radio" name="isEnabled" value="1" title="启用"
                           <c:if test="${user.isEnabled==1}">checked</c:if>>
                    <input type="radio" name="isEnabled" value="0" title="禁用"
                           <c:if test="${user.isEnabled==0}">checked</c:if>>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary" onclick="getCateIds()">重置</button>
                </div>
            </div>
        </form>
--%>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<%@include file="../common/footer.jsp" %>
<script>
    //JavaScript代码区域

    layui.use(['form', 'layedit', 'laydate', 'element'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , element = layui.element;


        //上传图片,必须放在 创建一个编辑器前面
        layedit.set({
            uploadImage: {
                url: '/uploadFile' //接口url
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
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });


        layui.use('code', function () { //加载code模块
            layui.code();
        });

//end
    });


</script>
</body>
</html>
