<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="padding-right:150px;text-align: right;">
	<c:forEach items="${lists}" var="dto">
	<img id="mainImg" alt="pet image" src="${pageContext.request.contextPath}/resources/img/upload/product/detail/${dto.fileName}">
	<hr style="background-color: white">
	</c:forEach>
	<c:if test="${member.id == 'admin'}">
		<button id="detailInsertBnt" class="btn btn-dark">세부사항 입력</button>
		<button id="detailDeleteBnt" class="btn btn-dark">세부사항 삭제</button>
	</c:if>
</div>