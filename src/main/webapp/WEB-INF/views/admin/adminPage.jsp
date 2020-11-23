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

.admin-tbl table {
	text-align: center;
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
	
#cname td {
	font-weight: 530;
}

#adpage-sel{
	height: 26px;
	border-radius: 0;
	border-color:#595959
}

#adpage-search-div{
	 margin: 0 10px 10px 0;
	 font-size: 0.9em;
	 float: right;
	 display: flex;
}

#adpage-search{
	margin: 0 2px;
	height: 26px;
	border-radius: 0;
	border-color: #595959;
}

#searchbtn{
	padding: 0px;
}

.admin-tbl a {
	text-decoration: none;
	letter-spacing: -0.03em;
	color: #404040;
}

.admin-tbl a:hover{
	color: #FDC033;
}

	
	
</style>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" id="mbPage-container">
	<div class="row mem_title">
		<div class="col-12 col-md-3">
<c:import url="./adminPageRow.jsp"></c:import>
		</div>
		
	<div class="col-12 col-md-9 admin-tbl">
		<h1>재고 현황</h1>
		<hr>
	<form action="./adminPage">
		<div id="adpage-search-div">
			<select id="adpage-sel" name="kind">
				<option>--전체--</option>
				<option value="category">카테고리</option>
				<option value="name">상품명</option>
				<option value="color">색상</option>
			</select>
			<input id="adpage-search" type="text" class="form-control" name="search">
    		<div class="input-group-btn">
    			<button type="submit" class="btn btn-default" id="searchbtn"><img alt="" src="../resources/img/common/search111.png" width="20px" height="20px"></button>
    		</div>
		</div>
		</form>
		
		<table class="table table-bordered">
			<tr id="cname">
				<td>Num</td>
				<td>카테고리</td>
				<td>상품명</td>
				<td>상품가격</td>
				<td>재고</td>
				<td>사이즈</td>
				<td>색상</td>
				<td>등록일</td>
			</tr>
			
		<c:forEach items="${list}" var="dto" varStatus="vs">
  		 <tr>
  			<td>${dto.product_num}</td>
  			
  			<c:choose>
  			
  			 <c:when test="${dto.category_num eq 1}">
  				<td>패션</td>
  			 </c:when>
  			
  			 <c:when test="${dto.category_num eq 2}">
  				<td>악세사리</td>
  			 </c:when>
  			
  			 <c:when test="${dto.category_num eq 3}">
  				<td>반려용품</td>
  			 </c:when>
  			
  			 <c:otherwise>
  				<td>매거진</td>
  			 </c:otherwise>
  			
  			</c:choose>
  			<td><a href="./admin_stockUpdate?product_num=${dto.product_num}">${dto.name}</a></td>
  			<td>${dto.price}</td>
  			<td style="color: #ffa31a;font-weight: 600;">${dto.stock}</td>
			<td>${dto.weight}</td>
			<td>${dto.color}</td>
			<td>${dto.regDate}</td>
  		 </tr>
  		</c:forEach>
		</table>
		
			<c:if test="${pager.beforeCheck}">
  				<a href="./adminPage?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${search}">[이전]</a>
  			</c:if>
  
  			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  				<a href="./adminPage?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
  			</c:forEach>
  	
  			<c:if test="${pager.nextCheck}">
  				<a href="./adminPage?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
  			</c:if>
  			
	</div>
		
			
	</div>
</div>


<!-- **********Script*********************************************************************************** -->

<script type="text/javascript">



</script>
</body>
</html>