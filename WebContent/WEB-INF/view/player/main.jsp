<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/head.jsp"/>
<div></div><div> <h2>선수 정보 보기</h2> </div><div></div>
<div class="content">
${page}
<c:choose>

	<c:when test="${page eq 'main'}">
		<jsp:include page="2_positions_q.jsp"/>
	</c:when>
	<c:when test="${page eq '2_positions_a'}">
		<jsp:include page="2_positions_a.jsp"/>
	</c:when> 
</c:choose>
</div>
<jsp:include page="../common/foot.jsp"/>
