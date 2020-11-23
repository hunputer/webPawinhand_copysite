<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>

<c:import url="../template/address.jsp"></c:import>

<style type="text/css">

	#payContainer{
		width: 1000px;
		height: auto;
		margin: 50px auto 100px;
	}
	.payHeader{
		width: 1000px;
		height: 70px;
		border-bottom: 1px solid #DCDCDC;
		font-size: 30px;
	}
	.payDetailDiv{
		margin-top : 50px;
		width: 1000px;
		height: 220px;
		font-size: 20px;
	}
	
	#payDetailTable{
		width: 1000px;
		height: auto;
	}
	.payTotalDiv{
		margin-top : 50px;
		width: 1000px;
		height: 130px;
		border: 2px solid #DCDCDC;
		
	}
	.priceDiv{
		width : 140px;
		height: 80px;
		text-align :center;
		float: right;
		font-size: 16px;
		margin-top : 15px;
	}
	.driveDiv{
		width : 140px;
		height: 80px;
		text-align :center;
		float: right;
		font-size: 16px;
		margin-top : 15px;
	}
	.totalDiv{
		width : 140px;
		height: 80px;
		text-align :center;
		float: right;
		font-size: 16px;
		margin-top : 15px;
	}
	.paydd{
		width : 20px;
		height: 100px;
		float: right;
		
	}
	.pointsdiv{
		width: 965px;
		height: 30px;
		float: left;
		text-align: right;
		font-size: 15px;
	}
	.payOrderDiv{
		margin-top : 50px;
		width: 1000px;
		height: auto;
		font-size: 20px;
	}
	.Pd1{
		display : inline-block;
		width : 140px;
		text-align: center;
		color: orange;
		font-weight: bold;
		font-size: 20px;
	}
	.cc{
		width: 20px;
		height: 20px;
		border-radius: 50%;
		background-color: #D3D3D3;
		text-align: center;
		line-height: 20px;
		color: #F8F8FF;
		font-weight: bold;
		margin-top: 30px;
	}
	.pp{
		font-size: 11px;
	}
	.infoTable{
		margin-top : 20px;
		width: 1000px;
		height: auto;
	}
	
	.infoTd{
		width: 200px;
	}
	.payDrive{
		margin-top: 50px;
		width: 1000px;
		height: auto;
		font-size: 20px;
	}
	.driveTable{
		margin-top : 20px;
		width: 1000px;
		height: auto;
	}
	
	.driveTd{
		width: 200px;
	}
	
	.payInfo{
		margin-top: 50px;
		width: 1000px;
		height: auto;
		font-size: 20px;
	}
	.payDiv{
		margin-top: 50px;
		width: 1000px;
		height: auto;
		font-size: 20px;
	}
	
	#accountDiv{
		display: none;
	}
	
	#finalPriceDiv{
		margin-top : 40px;
		margin-bottom : 10px;
		width: 1000px;
		height: 100px;
		border: 2px solid #DCDCDC;
	}
	#finalDiv2{
		width: 300px;
		height: 100px;
		float: right;
		line-height: 100px;
		text-align: right;
		margin-right: 10px;
		font-size: 17px;
	}
	#realTP{
		font-size: 25px;
		color: orange;
		font-weight: bold;
	}
	.ffcc{
		color: orange;
	}
	#chDiv{
		width: 1000px;
		height : auto;
		text-align: center;
	}
	.payBtn{
		width: 250px;
		height: 50px;
		margin-left : 325px;
		margin-top : 20px;
		background-color: orange;
		text-align: center;
		color: white;
		border: 1px solid orange;
	}
	
	.tdtd{
		width: 200px;
	}
	#odDiv1 , #odDiv2{
	display: none;
	}
	#viewPoints{
		font-weight: bold;
		font-size: 16px;
	}
	.ptd5, .infoTd, .driveTd, .tdtd{
		background-color: #FFEBCD;
		font-size: 16px;
		text-align: center;
		font-weight: bold;
		color: black;
	}
	.setOrderDetail, .ss, .pp, .tt, .ptd6{
		text-align: center;
		color: black;
		font-size: 14px;
	}
	.infoTd2, .driveTd2 ,.tdtd2, .sale, .tdPaySel{
	font-size: 16px;
	color: #2F4F4F;
	}
	
	#goCart{
		text-decoration: underline;
		color: black;
		font-size: 16px;
	}
	#zipBtn{
		background-color: #FFF8DC;
		font-size: 15px;
		border: 1px solid;
		border-radius: 5px;
	}
	#chDiv{
		font-size: 17px;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div id="payContainer">
	<div class="payHeader">
		주문서 작성/결제
	</div>
	
	<div class="payDetailDiv">
		주문상세내역<br>
		
		<table id="payDetailTable" class="table table-bordered" >
			<tr>
				<td class="ptd5">상품/옵션 정보</td>
				<td class="ptd5">수량</td>
				<td class="ptd5">상품금액</td>
				<td class="ptd5">할인/적립</td>
				<td class="ptd5">합계금액</td>
				
			</tr>
			
			<c:forEach items="${list}" var="list">
				<tr>
					<td class="setOrderDetail" title="${list.product_num}">
						${list.name}, ${list.color}, ${list.weight}
					</td>
					<td class="ss">${list.amount}</td>
					<td class="ptd6">${list.price}</td>
					<td class="pp" title="${list.points}"></td>
					<td class="tt" title="${list.price}"></td>
				</tr>
			</c:forEach>
			
		</table>
		
		<a href="#" id="goCart"> < 장바구니 가기</a>
	</div>
	
	
		<div class="payTotalDiv">
			<div class="priceDiv">
				<span>합계 </span>
				<div id = "ttprice" class="Pd1"></div>
			</div>
				<div class="paydd">
					<div class="cc">=</div>
				</div>
			<div class="driveDiv">
				<span>배송비 </span>
				<div class="Pd1" id="deliveryfee">
				</div>
			</div>
				<div class="paydd">
					<div class="cc">+</div>
				</div>
			<div class="totalDiv">
				<span>총 </span>
				<span id="nn"></span>
				<span>개의 상품금액</span>
				<div class="Pd1" id="tp">
				</div>
			</div>
			
			<div class="pointsdiv">
				적립예정 마일리지 : 
				<span id="viewPoints"></span>
			</div>
		</div>
	
	
	<div class="payOrderDiv">
		주문자 정보<br>
	
		<table class="infoTable, table table-bordered">
			<tr>
				<td class="infoTd">* 주문하시는 분</td>
				<td class="infoTd2"><input id="dname1" type="text" value="${member.name}"></td>
			</tr>
			<tr>
				<td class="infoTd">주소</td>
				<td class="infoTd2">
					<input type="text" id="dzipCode1" name="zipCode" value="${member.zipCode}" placeholder="우편번호"><br>
					<input id="dsite1" type="text" value="${member.address}" placeholder="주소">
				</td>
			</tr>
			<tr>
				<td class="infoTd">전화번호</td>
				<td class="infoTd2"><input id="dtel1" type="text"></td>
			</tr>
			<tr>
				<td class="infoTd">* 휴대폰 번호</td>
				<td class="infoTd2"><input id="dphone1" type="text" value="${member.phone}"></td>
			</tr>
			<tr>
				<td class="infoTd">* 이메일</td>
				<td class="infoTd2"><input id="demail1" type="text" value="${member.email}"></td>
			</tr>
		</table>
		
	</div>
	
	<form class="payDrive" action="./setOrderList" method="post" onsubmit="return sub();">
		배송정보<br>
		<input type="hidden" id="memberId" value="${member.id}" name="orderId">
		<input type="hidden" id="memberId" value="${member.id}" name="id">
		<table class="driveTable, table table-bordered">
			<tr>
				<td class="driveTd">배송지 확인</td>
				<td class="infoTd2">
					<input type="radio" value="1" name="deliverySite" class="ss" checked="checked"> 직접입력
					<input type="radio" value="2"  name="deliverySite"  class="ss"> 주문자 정보와 동일
				</td>
			</tr>
			<tr>
				<td class="driveTd">* 받으실 분</td>
				<td class="driveTd2"><input id="dname" type="text" name="toName"></td>
			</tr>
			<tr>
				<td class="driveTd">* 받으실 곳</td>
				<td class="driveTd2"> <!-- toAddess로 합쳐야됨 -->
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="toZipcode">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="zipBtn"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소"><br>
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					<input type="hidden" id="fullAddr" name="toAddress">
				</td>
			</tr>
			<tr>
				<td class="driveTd">전화번호</td>
				<td class="driveTd2">
					<input id="dtel" type="text" name="toTel">
				</td>
			</tr>
			<tr>
				<td class="driveTd">* 휴대폰 번호</td>
				<td class="driveTd2">
					<input id="dphone" type="text" name="toPhone">
				</td>
			</tr>
			<tr>
				<td class="driveTd">남기실 말씀</td>
				<td class="driveTd2">
					<input id="dcomment" type="text" name="addComment">
				</td>
			</tr>
			
		</table>
		
		
		
		<div class ="payInfo">
		결제정보<br>
		
			<table class="driveTable, table table-bordered">
				<tr>
					<td class="tdtd">상품 합계 금액</td>
					<td id="tp2" class="tdtd2"></td>
				</tr>
				<tr>
					<td class="tdtd">배송비</td>
					<td class="tdtd2" id="deliveryfee2"></td>
				</tr>
				<tr>
					<td class="tdtd">할인 및 적립</td>
					<td class="sale">
						할인 : (-) <span id="sale"></span>원 <br>
						적립 : (+) <span id="point"></span>p 예정<br>
					</td>
				</tr>
				<tr>
					<td class="tdtd">마일리지 사용</td>
					<td class="tdtd2">
						<input type="text" id="usePoint" name="usePoint" value="0"> p 
						<input type="checkbox" id="allPoint" onclick="calPoint()">전액 사용하기
							<span id="isPoint">
							(보유 마일리지: 
								<span id="isPoint2">${member.points}</span>p)
							</span>
					</td> 
				</tr>
				<tr>
					<td class="tdtd" id="finalPrice">최종 결제 금액</td>
					<td class="tdtd2" id="ftPrice"></td>
				</tr>
			</table>
		</div>
	
	
		<div class="payDiv">
			결제수단 선택/결제<br>
			
			
			<table class="driveTable, table table-bordered">
				<tr>
					<td rowspan="2" class = "tdtd">결제</td>
					<td class="tdPaySel">
						<input type="radio" name="paySel" value="1" class="paySel">무통장 입금
						<input type="radio" name="paySel" value="2" class="paySel">신용카드/카카오페이/네이버페이
						<input type="radio" name="paySel" value="3" class="paySel">휴대폰결제 <br>
						
						<div id="realAccountDiv">
							
						</div>
						<input type="hidden" id="payMethod" name="payMethod">
					</td>
				</tr>
			</table>
			
		</div>
		
		<div id="finalPriceDiv">
			<div id="finalDiv2">
				<span>최종 결제 금액   </span>
				<span name="total" id="realTP"></span>원
			</div>
		</div>	
		
		<div id="chDiv">
		<input type="checkbox" id="finalCheck">
			<span class="ffcc">(필수)</span> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.<br>
	</div>
	<!-- post로 보낼 값들 -->
	<input type="hidden" class="finalPrice" name="totalPrice">
	<input type="hidden" class="finalPrice" name="total">
	<input type="hidden" name="isPay" value="0">
	<input type="hidden" id="addPoint" name="addPoint" value="0">
	<input type="hidden" name="depositAccount" id="depositAccount" value="sh">
	<div id="odDiv1">
	</div>
	<div id="odDiv2">
	</div>
	
	<input type="submit" class="payBtn" value="결제하기">
	</form>
	
</div>

<div id="accountDiv">
		<hr>
		(무통장 입금의 경우, 입금확인 후부터 배송단계가 시작됩니다.)<br>
		입금자명     <input type="text" id="payName" name="depositName"><br>
		입금은행     <select id="bank">
					<option value="sh">신한은행 140012049753 (주)포인핸드</option>
					<option value="kb">국민은행 260894599649 (주)포인핸드</option>
				</select>
	</div>
<script type="text/javascript">

	var totalAmount = 0;
	var totalPrice = 0;
	var points = 1;
	var amountArray = [];
	var ds = null;
	var deliveryfee = null;
	var finalPrice=null;
	
	
	$(".ss").each(function(index, item) {

		amountArray[index] = $(this).html() * 1;
		totalAmount += $(this).html() * 1;
	});

	$("#nn").html(totalAmount);

	var q =0;
	$(".tt").each(function(index) {
		q=$(this).attr("title")*amountArray[index];
		$(this).html(q);
		$("#ptotal").val(q);
		totalPrice += q * 1;
		
		if(totalPrice > 50000){
			deliveryfee=0;
		}else{
			deliveryfee=3000;
		}	
	});

	$("#tp").html(totalPrice+"원");
	$("#deliveryfee").html(deliveryfee+"원");
	$("#ttprice").html(totalPrice+deliveryfee*1+"원");
	
	$("#tp2").html(totalPrice+"원");
	$("#deliveryfee2").html(deliveryfee+"원");
	
	var sale = 0;
	$("#sale").html(sale);
	var ep = null;
	var viewPoints = 0;

//********************* 마일리지 계산 
	var tag2=null;
	$(".pp").each(
			function(index, item) {
				if (amountArray[index] == 1) {
					points = $(this).attr('title') * 1 * amountArray[index];
					$(this).html(points + "p");
					
					tag2 += '<input type="hidden" name="detailAmount" value="'+amountArray[index]+'">';
					
					
				} else {
					ep = $(this).attr('title') * 1;
					points = ep * amountArray[index];
					$(this).html(ep + "p * " + amountArray[index] + " = " + points+ "p");
					tag2 += '<input type="hidden" name="detailAmount" value="'+amountArray[index]+'">';

				}
				$("#odDiv1").html(tag2);
				viewPoints += points;
			});

	
	$("#viewPoints").html(viewPoints+"p");
	$("#addPoint").val(viewPoints);
	$("#point").html(viewPoints);

	//*********사용 마일리지 넣기
	var usePoint = 0;
	var isPoint = $("#isPoint2").html()*1;
	
	//********** 최종 결제 금액
	$("#ftPrice").html(totalPrice+deliveryfee-usePoint+"원");
	//********** 진짜 마지막 최종금액임
	$("#realTP").html(totalPrice+deliveryfee-usePoint);
	finalPrice =totalPrice+deliveryfee-usePoint;
	$(".finalPrice").val(finalPrice);
	
	
	var pnum =[];
	var tag = null;
	//orderDetail 셋팅
	$(".setOrderDetail").each(function(index) {
		pnum[index]=$(this).attr('title');
		tag += '<input type="hidden" name="detailNum" value="'+pnum[index]+'">';
		$("#odDiv2").html(tag);
	});
	
	
	function calPoint() {
		
	 	if($("#allPoint").prop("checked")){
	 		usePoint = isPoint;	
	 		$("#usePoint").val(isPoint);
	 	}else{
	 		usePoint = 0;
	 		$("#usePoint").val(usePoint);
	 		
	 	}
	 	//********** 최종 결제 금액
		$("#ftPrice").html(totalPrice+deliveryfee-usePoint);
		//********** 진짜 마지막 최종금액임
		$("#realTP").html(totalPrice+deliveryfee-usePoint);
		finalPrice =totalPrice+deliveryfee-usePoint;
		$(".finalPrice").val(finalPrice);
	}
	
	$("#usePoint").blur(function() {
		var aa=$("#usePoint").val()*1;
		
		if(aa > isPoint){
 			alert("보유 마일리지를 확인해주세요");
 			usePoint = 0;
 			$("#usePoint").val(usePoint);
 		}else{
 			usePoint = aa;
 		}
		
		//********** 최종 결제 금액
		$("#ftPrice").html(totalPrice+deliveryfee-usePoint);
		//********** 진짜 마지막 최종금액임
	    $("#realTP").html(totalPrice+deliveryfee-usePoint);
	    finalPrice =totalPrice+deliveryfee-usePoint;
	    $(".finalPrice").val(finalPrice);
	});
	
	
	$(document).on("click", ".ss",function() {
		ds = $(this).val();

		if (ds == 1) {
			$("#dname").val(""); 
			$("#dtel").val("");
			$("#dphone").val("");
			$("#dcomment").val("");
			$("#sample6_postcode").val("");
			$("#sample6_address").val("");
			$("#sample6_detailAddress").val("");
			$("#sample6_extraAddress").val("");
		} else {
			$("#dname").val(document.getElementById('dname1').value);
			$("#sample6_address").val(document.getElementById('dsite1').value);
			$("#dtel").val(document.getElementById('dtel1').value);
			$("#dphone").val(document.getElementById('dphone1').value);
			$("#sample6_postcode").val(document.getElementById('dzipCode1').value);
		}
	});
	
	
	var n = null;
	var nn = $("#accountDiv").html().trim();
	var ch = false; //신용카드 결제인지 판별 - true이면 마지막 결제버튼 누른 후 신용카드 결제 창 뜨도록
 	var payMethod = null;

	$(document).on("click", ".paySel", function() {
		n = $(this).val();
		
		if(n==1){
			$("#realAccountDiv").html(nn);
			ch = false;
			payMethod = "무통장 입금";
		}else if(n==2){
			$("#realAccountDiv").html("");
			ch=true;
			payMethod = "신용카드/카카오페이/네이버페이";
		}else{
			$("#realAccountDiv").html("");
			ch = false;
			payMethod = "휴대폰결제";
		}
		
		$("#payMethod").val(payMethod);
	});
	
	//무통장 입금시 post보낼 val값 설정
	$(document).on("change","#bank" ,function(){
		
		$("#depositAccount").val($(this).val());
	});
	
	//submit시 발생
	function sub() {
		var addr = $("#sample6_address").val();
		var deAddr = $("#sample6_detailAddress").val();
		var exAddr = $("#sample6_extraAddress").val();
		
		var fullAddr = addr+exAddr+deAddr;
		$("#fullAddr").val(fullAddr);
		console.log(fullAddr);
		
		if($("#finalCheck").prop("checked")){
			
			if(ch){
				alert("신용카드 결제 페이지로 이동합니다.");
				window.open("./storePayment", "width=500px,height=600px");

			}else{
				return true;
			}
				
		}else{
			alert("필수사항에 체크해주시기 바랍니다.");
			return false;
		}
	}
	

</script>
</body>
</html>