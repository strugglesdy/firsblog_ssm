<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title><c:out value="${article.title}" /></title>
    <link type="image/vnd.microsoft.icon" href="${APP_PATH }/img/favicon.png" rel="shortcut icon">
    <link rel="stylesheet" href="${APP_PATH }/static/css/styleHome.css"/>
    <script type="text/javascript" src="${APP_PATH }/static/js/top.min.js"></script>
    <script type="text/javascript" src="${APP_PATH }/static/js/top.js"></script>
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery.1.4.2.min.js"></script>
</head>
<body>
<div class="bodycontent">
    <div id="midd">
        <header class="header"><!--页头 -->
            <div class="logonav">
                <div class="logo">
                    <div class="logogravatar">
                        <a href="${APP_PATH }" title="SunLife">
                            <div class="blogname">firs<span class="names">BLOG</span></div>
                        </a>
                    </div>
                </div>
                <nav id="top-nav" class="winfo">
                    <ul>
                        <li><a href="${APP_PATH }">首页</a></li>
                        <li><a href="${APP_PATH }/selectAllDiary">日记</a></li>
                        <li><a href="${APP_PATH }/about.jsp">关于</a></li>
                        <li><a href="${APP_PATH }/login.jsp">登录</a></li>
                        <li><a href="${APP_PATH }/register.jsp">注册</a></li>
                        <li><a href="${APP_PATH }/article/list">返回</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="clear"></div>
        <section class="blockGroup">
            <h2 class="s_title"><c:out value="${article.title}" /></h2>
            <div class="views">发表于<fmt:formatDate value="${article.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp|&nbsp 分类：${article.type} &nbsp| &nbsp作者：${user.nickname}</div>
            <article class="single">
                <input type="hidden"  id="blogarticle"  value="${article.content}">
                <script type="text/javascript">
                    $(function() {
                        var x =document.getElementById('blogarticle').value;
                        $("#text").html(x);
                    });
                </script>
                <div id="text"></div>
            </article>
        </section>
    </div>
    <div class="clear"></div>
    <footer>
        <div class="footer">
            &copy;2017 FirsBlog. All Rights Reserved.
        </div>
    </footer>
</div>
<div id="share">
    <a id="totop" title="返回顶部">返回顶部</a>
    <a href="https://weibo.com/u/2291175430?refer_flag=1001030101_&is_hot=1" target="_blank" class="sina">关注新浪微博</a>
    <a href="http://www.baidu.com"  target="_blank" class="tencent">这是假的</a>
</div>
</body>
</html>