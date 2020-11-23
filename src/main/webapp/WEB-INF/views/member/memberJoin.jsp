<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<div class="row mem_title" style="margin-bottom: 130px">
		<div class="col-12 join">
			<h1>포인핸드<br><strong>회원가입</strong>을 환영합니다</h1>
		</div>
		
			<div class="col-12 col-md-6">
				<div class="join-item">
					<h2>유기동물 입양하고<br>후원해주세요 .</h2>
					<img alt="join-image1" src="${pageContext.request.contextPath}/resources/img/common/join_1.jpg">
					<a href="${pageContext.request.contextPath}/member/memberJoinForm">
						<button class="join-button b1">개인회원가입</button>
					</a>
				</div>
			</div>
			
			<div class="col-12 col-md-6">
				<div class="join-item">
					<h2>보호소 동물을 등록하고 <br>관리해주세요.</h2>
					<img alt="join-image1" src="${pageContext.request.contextPath}/resources/img/common/join_2.jpg">
					<a href="${pageContext.request.contextPath}/member/memberJoinForm">
						<button class="join-button b2">보호소 회원가입</button>
					</a>
				</div>
			</div>
	</div>
</div>

</body>
</html>