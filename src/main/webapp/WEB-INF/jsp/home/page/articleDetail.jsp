<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</div>

<%@include file="../footer.jsp" %>

</body>
</html>