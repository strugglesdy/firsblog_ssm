<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<c:if test="${msgType eq 'SUCCESS'}">
    <c:set var="msgType" value="success"/>
</c:if>
<c:if test="${msgType eq 'WARNING'}">
    <c:set var="msgType" value="warning"/>
</c:if>
<c:if test="${msgType eq 'ERROR'}">
    <c:set var="msgType" value="danger"/>
</c:if>
<c:if test="${msg !=null}">
    <div class="alert alert-${msgType} alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"></button>
            ${msg}
    </div>
</c:if>

