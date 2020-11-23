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

	.ad-stock-up{
		margin-top: 50px;	
	}
	
	.admin-tbl h1 {
		font-size: 1.3em;
		font-weight: 700;
		margin-bottom: 10px;
	}
	
	.admin-tbl td {
		color: #404040;
		font-weight: 400;
		font-size: 0.8em;
	}
	
	.adminsel-ro{
		border: 0px;
	}
	
	#okbtn{
		border: 1.5px solid #FDC033;
		color: #FDC033;
		font-size: 0.88em;
		font-weight: 500;
	}
	
	#nobtn{
		 border: 1px solid #d9d9d9;
		 margin-left: 3px;
		 font-size: 0.9em;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" id="mbPage-container">
 <form id="frm" action="./admin_stockUpdate" method="post">
	<div class="row mem_title">
		<div class="col-12 col-md-3">
<c:import url="./adminPageRow.jsp"></c:import>
		</div>
		
		<div class="col-12 col-md-9 admin-tbl">
		<h1>재고 수정</h1>
		<hr>
			<div class="member-item ad-stock-up">
				<table>
					<tr><th>카테고리</th>  			
				
				<c:choose>
  			
  				 <c:when test="${updto.category_num eq 1}">
  					<td>패션</td>
  				 </c:when>
  			
  				 <c:when test="${updto.category_num eq 2}">
  					<td>악세사리</td>
  				 </c:when>
  			
  				 <c:when test="${updto.category_num eq 3}">
  					<td>반려용품</td>
  				 </c:when>
  			
  				 <c:otherwise>
  					<td>매거진</td>
  				 </c:otherwise>
  			
  				</c:choose>
					</tr>
					<tr><th>상품</th><td><input type="text" name="name" id="name" value="${updto.name}"/></td></tr>
					<tr><th>색상</th><td><input type="text" name="color" id="color" value="${updto.color}" class="adminsel-ro" readonly="readonly"/></td></tr>
					<tr><th>사이즈</th><td><input type="text" name="weight" id="weight" value="${updto.weight}" class="adminsel-ro" readonly="readonly"/></td></tr>
					<tr><th>가격</th><td><input type="text" name="price" id="price" value="${updto.price}"/>원</td></tr>
					<tr><th>재고</th><td><input type="text" name="stock" id="stock" value="${updto.stock}"/>개</td></tr>
				</table>
				<input type="hidden" name="product_num" id="product_num" value="${updto.product_num}" class="adminsel-ro" readonly="readonly"/>
				<input type="hidden" name="category_num" id="category_num" value="${updto.category_num}" class="adminsel-ro" readonly="readonly"/>
				<input type="hidden" name="descriptions" id="descriptions" value="${updto.descriptions}" class="adminsel-ro" readonly="readonly"/>
				<input type="hidden" name="regDate" id="regDate" value="${updto.regDate}" class="adminsel-ro" readonly="readonly"/>
			</div>
			
			    <div class="member-form" style="float: right;">
			      <button type="submit" class="btn btn-default" id="okbtn">확인</button>
			      <input type="button" class="btn btn-default" id="nobtn" value="취소">
			    </div>
		</div>
		
	</div>
 </form>
</div>


<!-- **********Script*********************************************************************************** -->

<script type="text/javascript">

$("#nobtn").click(function() {
	if (confirm("이 페이지에서 나가시겠습니까?") == true){    //확인
		location.href="./adminPage";

	}else{   //취소
		return false;
	}
});

</script>
</body>
</html>