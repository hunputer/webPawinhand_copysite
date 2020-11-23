<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>	
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Project</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>	
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-3">
			<c:import url="../member/memberPageRow.jsp"></c:import>		
			</div>
	
			<div class="col-12 col-md-9 cartlist">
				<h1>장바구니</h1>
				<div class="cart">
					<c:choose>
						<c:when test="${empty lists}">
							<h2>장바구니에 담겨있는 상품이 없습니다.</h2>
						</c:when>
					<c:otherwise>
					<form id="cart-form">
					<table class="cart-table">
						<tr>
				  			<th><input type='checkbox' name='allCheck' id="allCheck"/></th>
				  			<th>이미지</th>
				  			<th>이름</th>
				  			<th>수량</th>
				  			<th>상품 옵션</th>
				  			<th>상품 금액</th>
				  			<th>합계 금액</th>
				  			<th>배송비</th>
				  			<th>선택</th>
				  		</tr>
				  		
						<c:forEach items="${lists}" var="dto">
				  		<tr>
				  			<td><input type='checkbox' onClick="itemSum()" class="chkbox" value="${dto.totalPrice}"/></td>
				  			<td><img alt="cart image" src="${pageContext.request.contextPath}/resources/img/upload/product/${dto.fileName}" width="150px"></td>
				  			<td>${dto.name}</td>
				  			<td class="cart-item">
					  			<div class="combo-box">
						  			<button type="button" id="minus-button" aria-label="Add"></button>
					                <input type="text" value="${dto.amount}" name="amount" id="amount" />
					                <button type="button" id="plus-button" aria-label="Remove"></button>
					            </div>
				  			</td>
				  			<td class="option">${dto.color} / ${dto.weight}</td>
				  			<td class="cart-item1 cart-price">
                           		<fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}"/> 원
				  			</td>
				  			<td class="cart-item1 cart-totalprice">
				  				<input type="text" value="${dto.totalPrice}" name="totalPrice" id="totalPrice" readonly/> 원
				  			</td>
				  			<td class="cart-item1"><fmt:formatNumber type="number" maxFractionDigits="3" value="3000"/> 원</td>
				  			<td class="cart-item1">
				  			<button class="cart-delete" formaction="./cartDelete?cartNum=${dto.cartNum}" formmethod="get">삭제</button>
				  			<button class="cart-update" formaction="../cart/cartUpdate?cartNum=${dto.cartNum}" formmethod="post">수정</button>
				  			</td>
				  		</tr>
				  		<input type="hidden" name="id" value="${dto.id}"/>
				  		<input type="hidden" name="cartNum" value="${dto.cartNum}"/>
				  		<input type="hidden" name="produc_num" value="${dto.product_num}"/>
				  		<input type="hidden" value="${dto.price}" name="price" id="price" />
				  		<input type="hidden" value="${dto.totalPrice}" name="totalPrice" id="totalPrice" />
				  		</c:forEach>
				  		
				  	</table>
				  	<button formaction="../storePay/storePayMain" formmethod="post">주문하기</button>
				  	</form>
				  	
				  	
					</c:otherwise>
					</c:choose>
				</div>
				<a href="${pageContext.request.contextPath}/product/goodsList" class="goods-link">&lt;쇼핑 계속하기</a>

				
				<div class="c2">
					<div class="price_sum">
						<dl>
							<dt id="num">0개의 상품금액</dt>
							<dd id="total_sum"></dd>
						</dl>
						<i class="fas fa-plus"></i>
						<dl>
							<dt>배송비</dt>
							<dd>3,000 원</dd>
						</dl>
						<i class="fas fa-equals"></i>
						<dl>
							<dt>합계</dt>
							<dd id="sum">원</dd>
						</dl>
						</div>
						<h3 class="point"></h3>
				</div>
				
				
			</div>
		</div>
	</div>
<script>
//전체체크
   $("#allCheck").click(function(){
 	  var chk = $("#allCheck").prop("checked");
  	  if(chk) {
       	$(".chkbox").prop("checked", true);
        itemSum();
   	  } else {
        $(".chkbox").prop("checked", false);
       itemSum();
   }
});	

//체크해제 
   $(".chkbox").click(function(){
       $("#allCheck").prop("checked", false);
     });
     
//가격계산     
   function itemSum(){
       var str = "";
       var sum = 0;
       var num = 0;
       var count = $(".chkbox").length;
       for(var i=0; i < count; i++ ){
           if( $(".chkbox")[i].checked == true ){
            sum += parseInt($(".chkbox")[i].value);
            num++;
           }
       }
       $("#num").html(num+"개의 상품금액");
       $("#total_sum").html(sum+" 원");
       $("#sum").html(sum+3000+ " 원");
       $(".point").html("적립예상 포인트 : " + (sum-3000)*0.01 + "원");
    }     
 
 //btn
 var amount=document.getElementById("amount").value; 
 var totalPrice=document.getElementById("totalPrice").value;
 var price=document.getElementById("price").value;
 
 $("#minus-button").click(function(){
	 if(amount>1){
		 amount--;
		 $("#amount").val(amount);
		 totalPrice = amount * price;
		 $("#totalPrice").val(totalPrice);
	 }else {
		 alert("1개 이상부터 구매하실 수 있습니다.");
	 }
 });
 
 $("#plus-button").click(function(){
	amount++;
	 $("#amount").val(amount); 
	 totalPrice = amount * price;
	 $("#totalPrice").val(totalPrice);
 });
 
	$(".cart-update").click(function() {
	 	if (confirm("수정하시겠습니까?") == true){    //확인
	     	form.submit();
	
	 	}else{   //취소
	     	return false;
	     	location.reload(true);
	 	}
	});
	
	$(".cart-delete").click(function() {
	 	if (confirm("삭제하시겠습니까?") == true){    //확인
	     	form.submit();
	
	 	}else{   //취소
	 		location.reload();
	     	return false;
	 	}
	});
   
   
 
 </script>	
	
</body>
</html>