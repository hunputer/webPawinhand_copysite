<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>

<style type="text/css">
#payInfoContainer {
	width: 1000px;
	height: auto;
	margin: 50px auto 100px;
}

.payHeader {
	width: 1000px;
	height: 70px;
	border-bottom: 1px solid #DCDCDC;
	font-size: 30px;
}

#payInfoDiv {
	width: 1000px;
	height: 210px;
}

#imgDiv {
	width: 1000px;
	height: 150px;
	text-align: center;
	margin-top: 20px;
}

#imgDiv>img {
	width: 150px;
	height: 130px;
}

#payInfoDiv>#d1 {
	width: 1000px;
	height: 50px;
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

#payInfoTable {
	width: 1000px;
	height: 1000px;
	margin-top: 20px;
	font-size: 18px;
	font-weight: bold;
}

.td1 {
	width: 150px;
	background-color: #FFEFD5;
	color: black;
	text-align: center;
	font-size: 14px;
	font-weight: bold;
}
.td2{
	color: #696969;
	font-size: 13px;
	
}
#payInfoBtn {
	width: 250px;
	height: 50px;
	margin-left : 330px;
	margin-top : 20px;
	background-color: orange;
	text-align: center;
	color: white;
	border: 1px solid orange;
	
}
.table-bordered{
	border-left-color : white;
	border-right-color: white;
}
#total{
	font-size: 19px;
	color: #D2691E;
	font-weight: bold;
}
#isPaySpan{
	font-weight: bold;
}
</style>
</head>

<body>

<c:import url="../template/header.jsp"></c:import>

<div id="payInfoContainer">
	<div class="payHeader">
		주문완료
	</div>
	
	<div id="payInfoDiv">
		<div id="imgDiv">
			<img src="${pageContext.request.contextPath}/resources/img/common/payInfo.PNG">
		</div>
		<div id="d1">
		주문이 정상적으로 접수되었습니다.
		</div>
	</div>
	
	<div id="payInfoTable">
	주문 요약 정보<br>
	
		<table class="table table-bordered">
			
			<tr>
				<td class="td1">결제수단</td>
				<td class="td2">
					${pay.payMethod}<br>
					<c:if test="${pay.payMethod eq '무통장 입금'}">
						입금자명 : <c:out value="${deposit.depositName}" /><br>
						<c:choose>
							<c:when test="${deposit.depositAccount eq 'kb'}">
								입금 계좌 : 국민은행 260894599649 (주)포인핸드<br>
							</c:when>
							<c:otherwise>
								입금 계좌 : 신한은행 140012049753 (주)포인핸드<br>
							</c:otherwise>
						</c:choose>
					</c:if>
					결제금액 : ${pay.totalPrice}<br>
					결제상태 : <span id="isPaySpan">
					<c:choose>
						<c:when test="${pay.isPay eq 1}">
							결제완료
						</c:when>
						<c:otherwise>
							결제 대기중
						</c:otherwise>
					</c:choose>
					</span>
				</td>
			</tr>
			<tr>
				<td class="td1">주문번호</td>
				<td class="td2">${list.order_num}</td>
			</tr>
			<tr>
				<td class="td1">주문일자</td>
				<td class="td2">${list.regDate}</td>
			</tr>
			<tr>
				<td class="td1">주문상품</td>
				<td class="td2">
					<c:forEach items="${ar}" var="detail">
						상품명 : <span>${detail.name}</span><br>
						(색상 : <span>${detail.productDTO.color}</span>,
						사이즈 : <span>${detail.productDTO.weight}</span>,
						수량 : <span>${detail.amount}</span>개)<br>
						<input type="hidden" value="${detail.ptotal}" class="ptotal">
					</c:forEach>
					
				</td>
			</tr>
			<tr>
				<td class="td1">주문자명</td>
				<td class="td2">${list.toName}</td>
			</tr>
			<tr>
				<td class="td1">배송정보</td>
				<td class="td2">
					받으실 곳 : <span>${list.toAddress}<span><br>
					배송메시지 : <span>${list.addComment}<span><br>
				</td>
			</tr>
			<tr>
				<td class="td1">상품금액</td>
				<td id="tdPtotal" class="td2"></td>
			</tr>
			<tr>
				<td class="td1">배송비</td>
				<td id="dFee" class="td2"></td>
			</tr>
			<tr>
				<td class="td1">할인 및 적립</td>
				<td class="td2">
					할인 : (-) <span id="usePoint"></span>원 <br>
					적립 : (+) <span id="addPoint"></span>p 예정<br>
				</td>
			</tr>
			<tr>
				<td class="td1">총 결제금액</td>
				<td class="td2">
				<span id="total">${list.total}</span> 원
				</td>
			</tr>
		</table>
		
		<button id="payInfoBtn">확인</button>
	</div>
</div>

<script type="text/javascript">
	
	//상품합계금액 계산
	var sum=0;
	$(".ptotal").each(function() {
		sum += $(this).val()*1;
	});
	$("#tdPtotal").html(sum+"원");
	
	var total=$("#total").html()*1;
	
	//배송비 , 할인적립 설정
	$("#dFee").html(function() {
		if(sum> 50000){
			$("#dFee").html("0원");
			if(sum != total){
				$("#usePoint").html(sum - total);
			}else{
				$("#usePoint").html("0");
			}
		}else{
			$("#dFee").html("3000원");
			if(sum != total-3000){
				$("#usePoint").html(sum - (total-3000));
				console.log(sum);
				console.log(total);
				console.log(sum - (total-3000));
			}else{
				$("#usePoint").html("0");
			}
		}
		
		$("#addPoint").html(sum*0.02);
	});
	
	$("#payInfoBtn").click(function() {
		location.href="..//product/goodsList";
	});
</script>
</body>
</html>