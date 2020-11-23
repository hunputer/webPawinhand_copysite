<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>Insert title here</title>

<style type="text/css">
#mbPage-d1{
	border: 3px solid #e6e6e6;
	display : flex;
	text-align: center;
}
.mbPage-info-1{
	width: 31%;
	height: 200px;
	background-color: #f2f2f2;
}
.mbPage-info{
	width: 23%;
	height: 200px;
	text-align: center;
}
.member-item2 td{
	color: #1a1a1a;
	font-weight: bold;
	font-size: 0.8em;
}


</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" id="mbPage-container">
	<div class="row mem_title">
		<div class="col-12 col-md-3">
<c:choose>
	<c:when test="${member.id eq 'admin'}">
		<c:import url="../admin/adminPageRow.jsp"></c:import>
	</c:when>
	
	<c:otherwise>
		<c:import url="./memberPageRow.jsp"></c:import>	
	</c:otherwise>
</c:choose>
		</div>
			
			<div class="col-12 col-md-9 member-info">
				<div class="member-item" id="mbPage-d1">
					<div class="mbPage-info-1">
						<p>${member.name}님의 <br>
						회원등급은 일반회원등급 입니다.</p>
					</div>
				
					<div class="mbPage-info">
							<img alt="" src="${pageContext.request.contextPath}/resources/img/common/points.png" width="40px" height="40px">
							<p style="font-weight: bold;margin: 8px 0;">적립금</p>
							<span style="color: #FDC033;font-size: 1.1em;font-weight: bold;">${member.points} </span><span>원</span>
					</div>
				
					<div class="mbPage-info">
						<h1>3</h1>
					</div>
				
					<div class="mbPage-info">
						<h1>4</h1>
					</div>
				</div>
				
					<div class="member-item2" style="margin-top: 70px;">
						<h2>최근 주문 정보</h2>
						
						<table class="table">
							<tr style="text-align: center;">
								<td width="25%" style="color: #404040;font-weight: 500;font-size: 0.8em;">날짜/주문번호</td>
								<td width="30%" style="color: #404040;font-weight: 500;font-size: 0.8em;">상품명/옵션</td>
								<td width="15%" style="color: #404040;font-weight: 500;font-size: 0.8em;">상품금액/수량</td>
								<td width="15%" style="color: #404040;font-weight: 500;font-size: 0.8em;">주문상태</td>
								<td width="15%" style="color: #404040;font-weight: 500;font-size: 0.8em;">확인/리뷰</td>
							</tr>
							
							
						</table>
					</div>
		
			</div>
			
	</div>
</div>



</body>
</html>