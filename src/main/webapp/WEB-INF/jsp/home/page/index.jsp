<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../header.jsp" %>

</head>
<body>
<div class="bodycontent">
    <div id="midd">
        <%@include file="../navbar.jsp" %>
        <div class="main"><!--文章列表-->
            <article>
                <section>
                    <header class="crumbs">New Post 最新文章</header>
                    <c:forEach items="${articles}" var="a">
                        <header >&nbsp</header>
                        <ul>
                            <li class="main-item-left"></li>
                            <li class="main-item-1"><a href="/home/article/${a.articleId}"><c:out
                                    value="${a.title}"/></a></li>
                            <li class="main-item-2">发布时间：<fmt:formatDate value="${a.updateTime}"
                                                                         pattern="yyyy年MM月dd日 HH:mm"/>
                                <span class="pid">&nbsp &nbsp &nbsp作者：${a.nickname}</span></li>
                            <li class="main-item-3"><c:out value="${a.content}"/></li>
                            <li class="main-item-4"><a href="/home/article/${a.articleId}"><i>阅读全文</i></a></li>
                            <div class="clear"></div>
                            <li class="main-item-left"></li>
                        </ul>
                    </c:forEach>
                </section>
            </article>
            <aside>
                <section>
                    <header class="aside-title">关于本站</header>
                    <ul>
                        <li class="aside-tag"><a href="" target="_blank">Firs博客</a></li>
                        <li class="text">新起点。<br>珍惜时间，保持努力的惯性。</li>
                        <li>&nbsp</li>
                        <li>&nbsp</li>
                    </ul>
                </section>
                <section>
                    <header class="aside-title">友情链接</header>
                    <ul>
                        <li class="aside-tag"><a href="" target="_blank">微博</a></li>
                        <li class="aside-tag"><a href="" target="_blank">知乎</a></li>
                        <li class="aside-tag"><a href="" target="_blank">简书</a></li>
                        <li class="aside-tag"><a href="" target="_blank">Github</a></li>
                        <li>&nbsp</li>
                        <li>&nbsp</li>
                        <li>&nbsp</li>
                        <li>&nbsp</li>
                    </ul>
                </section>
                <div class="clear"></div>
                <section>
                    <header class="aside-title">分类</header>
                    <c:forEach items="${categories}" var="c">
                        <ul>
                            <li class="aside-tag"><a href="/home/category/${c.categoryId}">${c.type}</a></li>
                        </ul>
                    </c:forEach>
                    <ul>
                        <li>&nbsp</li>
                        <li>&nbsp</li>
                        <li>&nbsp</li>
                        <li>&nbsp</li>
                    </ul>
                </section>
                <div class="clear"></div>
                <section id="author">
                    <header class="aside-title">Author</header>
                    <div class="about-me">
                        <div class="profile">
                            <div class="info">
                                <h1>SunLife<span class="born">Born in：1949-10-1</span></h1>
                                <p>Sboy Design</p>
                                <p>&copy; 2017 拾荒者</p>
                            </div>
                        </div>
                    </div>
                </section>
            </aside>
        </div>
    </div>
    <div class="clear"></div>
    <nav class="navigator">
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="${APP_PATH }/selectAllBlog?pn=${pageInfo.pageNum-1}">Previous page</a>
        </c:if>
        <c:if test="${pageInfo.hasNextPage}">
            <a href="${APP_PATH }/selectAllBlog?pn=${pageInfo.pageNum+1}">Next page</a>
        </c:if>
    </nav>
    <div class="clear"></div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>