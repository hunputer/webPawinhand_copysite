<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!Doctype html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>	

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

	<div class="container" style="min-width: 1100px">
		<div class="row">
			<c:forEach items="${lists}" var="dto">
				<div class="col-12 col-md-3 sl goods">
					<a href="./goodsSelect?product_num=${dto.product_num}">	
						<img style="width: 250px; height: 250px" alt="pet image" src="${pageContext.request.contextPath}/resources/img/upload/product/${dto.fileName}" width="250px" height="250px">
						<div class="goods-info">
							<dt class="goods-name">${dto.name}</dt>
							<dt>${dto.price}원</dt>
							<dd>
							 포인핸드 매거진 창간 기념 뱃지포리 / 두디튜브 두디 뱃지바다에서 펼쳐지는 시원한 바캉스, 이번여름은 귀여운 포리&두디와 함께해요
							</dd>
						</div>
					</a>
				</div>
			</c:forEach>
			</div>
			<c:if test="${member.id == 'admin'}">
				<div style="padding-bottom: 50px;text-align: right">
					<button id="writeBtn" class="btn btn-dark">글쓰기</button>
				</div>
			</c:if>
		</div>
		
<script type="text/javascript">
	$("#writeBtn").click(function(){
		location.href = "./goodsWrite";
	})	


</script>


</body>
</html>