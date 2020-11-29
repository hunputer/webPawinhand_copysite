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
#pdiv{
	height: 100px;
	margin-top: 70px;
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
.rebtn{
	background-color: orange;
	border: orange;
	border-radius: 5px;
	color: white;
}
.mbPage-info-div{
	margin-top : 40px;
	height : 120px;
}
.numTd > a{
	color: black;
	text-decoration: underline;
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
						<div id="pdiv">
							<p>${member.name}님의<br>
							회원등급은 일반회원등급 입니다.</p>
						</div>
					</div>
				
					<div class="mbPage-info">
						<div class="mbPage-info-div">
							<img alt="" src="${pageContext.request.contextPath}/resources/img/common/points.png" width="40px" height="40px">
							<p style="font-weight: bold;margin: 8px 0;">적립금</p>
							<span style="color: #FDC033;font-size: 1.1em;font-weight: bold;">${member.points} </span><span>원</span>
						</div>
					</div>
				
					<div class="mbPage-info">
						<div class="mbPage-info-div">
						</div>
					</div>
				
					<div class="mbPage-info">
						<div class="mbPage-info-div">
						</div>
					</div>
				</div>
				
					<div class="member-item2" style="margin-top: 70px;">
						<h2>최근 주문 정보</h2>
						
						<table class="table">
							<tr style="text-align: center;">
								<td width="25%" style="color: #404040;font-weight: 500;font-size: 0.8em;">날짜/주문번호</td>
								<td width="30%" style="color: #404040;font-weight: 500;font-size: 0.8em;">상품명/옵션</td>
								<td width="15%" style="color: #404040;font-weight: 500;font-size: 0.8em;">수량/상품금액</td>
								<td width="15%" style="color: #404040;font-weight: 500;font-size: 0.8em;">주문상태</td>
								<td width="15%" style="color: #404040;font-weight: 500;font-size: 0.8em;">확인/리뷰</td>
							</tr>
							
							<c:if test="${list ne null}">
								<c:forEach items="${list}" var="list" varStatus="vs">
								<tr style="text-align: center;">
									<td class="numTd">
										<a href="./member/viewOrderList?order_num=${list.order_num}" onclick="window.open(this.href,'vv','width=500,height=500,scrollbars=no'); return false;">
										${list.order_num}</a></td>
									<td>
										<a href="../product/goodsSelect?product_num=${list.product_num}">${list.name}</a></td>
									<td>${list.amount}개 - ${list.ptotal}</td>
									<td class ="isPayTd" title="${list.payInfoDTO.isPay}"></td>
									<td>
										<button class="rebtn" title="${list.payInfoDTO.isPay}">리뷰 쓰기</button>
									</td>
								<tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
		
			</div>
			
	</div>
</div>


<script type="text/javascript">
	
	$(".numTd").each(function() {
		 var rows = $(".numTd:contains('" + $(this).text() + "')");
	        if (rows.length > 1) {
	            rows.eq(0).attr("rowspan", rows.length+1);
	            rows.not(":eq(0)").remove();
	        }
	        
	});
	
	
	$(".isPayTd").each(function() {
		var isPay = $(this).attr("title");
		if(isPay==1){
			$(this).html("결제완료");
		}else{
			$(this).html("결제 대기중");
		}
	});
	
	$(".rebtn").click(function() {
	
		if($(this).attr('title') == 1){
			window.open('../product/review/myPageReview','review','left=250px, width=500px,height=500px, resizable=no');
		}else{
			alert("결제 후 리뷰를 작성하실 수 있습니다.");
		}
	});
</script>

</body>
</html>