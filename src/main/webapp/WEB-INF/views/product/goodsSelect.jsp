<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!Doctype html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<style type="text/css">
	.picture{
		display: inline-block;
	}
	
	.thumbnail{
		display:inline-block;
		height: 50px;
		cursor: pointer;
	}
	
	.thumbnailImg{
		width: 50px;
		height: 50px;
		float: left;
		margin-top: 5px;
	}
	
	.menu{
		margin-top: 300px;
		
	}
	
	.on{
		width: 350px;
		height: 50px;
		margin-top: 0;
	    padding-top: 0;
	    color: #333;
	    font-weight: 400;
	    border: 1px solid #eee;
	    border-bottom: 1px solid #eee;
	    border-top: 1px solid #333;
	    float: left;
	    text-align: center;
	    line-height: 50px;
	}
	
	.menuul{
		width: 1200px;
		height: 50px;
		margin-bottom: 50px;
	}
	
	#menu_list{
		margin-top: 50px;
		height : 600px;
	}
	
	.c1{
		cursor: pointer;
	}
	
	.menuSelected{
		background-color: black;
		color: white;
	}
	
	.qnatr{
		text-align: center;
	}
	
	.qnacon{
		font-size: 12px;
		color: black;
	}
	
	.amount {
		padding-top: 15px;
	}
	
	.amount > span{
		font-size: 1.1em;
   		letter-spacing: 0.02em;
    	color: #B4B4B4;
    	font-weight: 300;
	}
</style>

<title>Project</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>	
<div class="container">
	<div class="row">
		<div class="col-12 goods-nav">
			<nav class="navbar navbar-expand-sm">
			  <!-- Links -->
			  <ul class="navbar-nav">
			    <li class="goods-nav-item">
			      <a class="nav-link" href="./goodsList?category_num=1">패션</a>
			    </li>
			    <li class="goods-nav-item">
			      <a class="nav-link" href="./goodsList?category_num=2">악세사리</a>
			    </li>
			    <li class="goods-nav-item">
			      <a class="nav-link" href="./goodsList?category_num=3">반려용품</a>
			    </li>
			    <li class="goods-nav-item">
			      <a class="nav-link" href="./goodsList?category_num=4">매거진</a>
			    </li>
			  </ul>
			</nav>
		</div>
	</div>
</div>


<div class="container">
	<div class="row">	
		<div class="col-12 col-md-6 sl goods-detail1">
			<div class="picture">
				<img id="mainImg" alt="pet image" src="${pageContext.request.contextPath}/resources/img/upload/product/${files[0].fileName}" width="500px" height="500px">
				<ul style="padding-left: 5px">
					<c:forEach items="${files}" var="file">
						<li class="thumbnail">
							<img style="width:50px; height:50px" class="thumbnailImg" alt="pet image" src="${pageContext.request.contextPath}/resources/img/upload/product/${file.fileName}" width="50px" height="50px">
						</li>
					</c:forEach>
				</ul>
						
			</div>
		</div>
		<div class="col-12 col-md-6 sl goods-detail2">
			<table class="goods-t">
				<tr><th colspan="2" class="goods-sname" style="width:480px">${dto.name}</th></tr>
				<tr class="goods-items"><th>정가</th><td>${dto.price}원</td></tr>
				<tr class="goods-items"><th>판매가</th><td>${dto.price}원</td></tr>
				<tr class="goods-items"><th>구매제한</th><td>옵션당 최소1개</td></tr>
				<tr class="goods-items"><th>배송비</th><td>3,000원</td></tr>
				<tr class="goods-items"><th>상품코드</th><td>${dto.product_num}</td></tr>
				<tr class="goods-items"><th>카테고리</th><td>악세사리</td></tr>
				<tr class="goods-items"><th>상품재고</th><td>${dto.stock}개</td></tr>
				<tr class="goods-items"><th>색상</th><td>${dto.color}</td></tr>
			</table>
		
		<form name="goodsSelect-frm" method="post">
			<input type="hidden" name="product_num" value="${dto.product_num}">
			<input type="hidden" name="price" value="${dto.price}" id="price">
			
			<div class="amount" style="height: 70px;border-top-style: solid;border-top-width: 1px;border-bottom-color: gray;">
			<input type="hidden" name="id" value="${member.id}">
				<span>수량</span>
				<select style="width: 300px;margin-left: 60px" name="amount" id="amount">
					<option value="">선택</option>
					<option value="1">1개</option>
					<option value="2">2개</option>
					<option value="3">3개</option>
					<option value="4">4개</option>
					<option value="5">5개</option>
					<option value="6">6개</option>
					<option value="7">7개</option>
					<option value="8">8개</option>
					<option value="9">9개</option>
					<option value="10">10개</option>
				</select>
			</div>
			<div class="goods-detail3">
				<button class="cart-btn" formaction="../cart/cartInsert">장바구니</button>
				<button class="pay-btn"  formaction="../storePay/storePayMain">구매하기</button>
			</div>
			<input type="hidden" name="totalPrice" id="totalPrice" value="0">
		</form>
		
		<c:if test="${member.id == 'admin'}">
			<div>
				<a href="./goodsUpdate?product_num=${dto.product_num}">글수정</a>
				<a href="./goodsDelete?product_num=${dto.product_num}">글삭제</a>
			</div>
		</c:if>
		</div>
		
	</div>
	<div class="menu">
		<ul class="menuul" style="padding-left: 0px">
			<li id="detailMenu" class="on">Detail</li>
			<li id="ReviewMenu" class="on">Review</li>
			<li id="QNAMenu" class="on">Q&A</li>
		</ul>
		<div id="menu_list">
			
		</div>
	</div>
</div>

<script type="text/javascript">
	var curPage = 1;
	detailList();

	$(".thumbnailImg").click(function(){
		var src = $(this).attr("src");
		$("#mainImg").attr("src",src);
	});
	
	$("#ReviewMenu").click(function(){
		curPage = 1;
		reviewList();
	});
	
	$("#menu_list").on("click","#reviewbnt",function(){
		$("#reviewform").submit();
		reviewList();
	})
	
	function reviewList(){
		$("#ReviewMenu").addClass("menuSelected");
		$("#detailMenu").removeClass("menuSelected");
		$("#QNAMenu").removeClass("menuSelected");
		$.get("../review/reviewList?product_num=${dto.product_num}&curPage="+curPage, function(data) {
			$("#menu_list").html(data);
		});
	}
	
	$("#detailMenu").click(function(){
		detailList();
	});
	
	$("#menu_list").on("click", "#detailInsertBnt", function(){
		var option = "width = 576, height = 500, top = 100, left = 200, location = no";
		window.open("../productDetail/productDetailInsert?product_num=${dto.product_num}","insert",option);
	});
	
	$("#menu_list").on("click", "#detailDeleteBnt", function(){
		location.href = "../productDetail/productDetailDelete?product_num=${dto.product_num}";
	});
	
	function detailList(){
		$("#ReviewMenu").removeClass("menuSelected");
		$("#detailMenu").addClass("menuSelected");
		$("#QNAMenu").removeClass("menuSelected");
		$.get("../productDetail/productDetailList?product_num=${dto.product_num}", function(data) {
			$("#menu_list").html(data);
		});
	}
	
	$("#QNAMenu").click(function(){
		curPage = 1;
		qnaList();
	});
	
	$("#menu_list").on("click", ".c1", function(){
    	curPage = $(this).attr("title");
    	var table = $("#tableName").val();
    	alert(table);
    	if(table == 'review'){
    		reviewList();
    	}else{
    		qnaList();
    	}
	});
	
	function qnaList(){
		$("#ReviewMenu").removeClass("menuSelected");
		$("#detailMenu").removeClass("menuSelected");
		$("#QNAMenu").addClass("menuSelected");
		$.get("../productQna/productQnaList?product_num=${dto.product_num}&curPage="+curPage, function(data) {
			$("#menu_list").html(data);
		});
	}
	
	$("#menu_list").on("click",".qnatitle",function(){
		var num = $(this).attr("title");
		var con = document.getElementById("qnacontent"+num);
		var con2 = document.getElementById("qnareplycontent"+num);
		if(con.style.display == 'none'){
			con.style.display = 'table-row';
			con2.style.display = 'table-row';
		}else{
			con.style.display = 'none';
			con2.style.display = 'none';
		}
	});
	
	$("#menu_list").on("click", "#qnaInsertbtn", function(){
		var option = "width = 576, height = 500, top = 100, left = 200, location = no";
		window.open("../productQna/productQnaInsert?product_num=${dto.product_num}","insert",option);
	})
	
	//totalPrice
	$("#amount").change(function(){ 
	var price= ${dto.price}; 
	var amount=document.getElementById("amount").value;  
	var result= parseInt(price)*parseInt(amount); 
	document.getElementById("totalPrice").value=result;
	
	});

</script>
</body>
</html>