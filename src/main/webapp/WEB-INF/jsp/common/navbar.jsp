<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="layui-header">
    <div class="layui-logo">FisBlog 后台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="">前台</a></li>
        <li class="layui-nav-item"><a href="">用户</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">其它系统</a>
            <dl class="layui-nav-child">
                <dd><a href="">邮件管理</a></dd>
                <dd><a href="">消息管理</a></dd>
                <dd><a href="">授权管理</a></dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav layui-layout-right layui-bg-green">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://img.mp.itc.cn/upload/20170811/5e4e6f7d2ee44a6f9ae6c26832ab96b0_th.jpg" class="layui-nav-img">
                小猪杉杉杉杉
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="/logout">退出</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a  href="javascript:;">分类管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/category/list">分类列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">文章管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/article/add">添加文章</a></dd>
                    <dd><a href="/article/list">文章列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/user/list">用户列表</a></dd>
                    <dd><a href="/user/profile">基本资料</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>