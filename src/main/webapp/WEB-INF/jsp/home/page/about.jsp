<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
					<h2 class="s_title">Noting to say</h2>
					<div class="views">
						<time>发布于:2017-12-02</time>
					</div>
					<div style="text-align:center"><img src="${APP_PATH }/static/img/timg.jpg"></div>
				</section>
			</div>
			<div class="clear"></div>
		</div>
		<%@include file="../footer.jsp" %>

	</body>
</html>