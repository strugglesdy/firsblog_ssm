<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<header class="header"><!--页头 -->
    <div class="logonav">
        <div class="logo">
            <div class="logogravatar">
                <a href="/home/index" title="FirsBlog">
                    <div class="blogname">firs<span class="names">blog</span></div>
                </a>
            </div>
        </div>
        <nav id="top-nav" class="winfo">
            <ul>
                <li><a href="${APP_PATH }/home/index">首页</a></li>
                <li><a href="${APP_PATH }/selectAllDiary">分类</a></li>
                <li><a href="${APP_PATH }/index">后台</a></li>
                <li><a href="${APP_PATH }/login">登录</a></li>
                <li><a href="${APP_PATH }/home/about">关于</a></li>
            </ul>
        </nav>
    </div>
</header>
<div class="clear"></div>