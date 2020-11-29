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

.admin-ml-tr td {
	height: 60px;
	text-align: center;
	vertical-align: middle;
}

.admin-ml-tr div {
	text-align: center;
	vertical-align: middle;
}

#ad-ql-contents{
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 180px;
	height: 45px;
	margin: 0 auto;
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
		<h1>상품 문의</h1>
		<hr>
		<form action="./admin_qnaList">
		<div id="adpage-search-div">
			<select id="adpage-sel" name="kind">
				<option>--전체--</option>
				<option value="id">ID</option>
				<option value="name">상품명</option>
			</select>
			<input id="adpage-search" type="text" class="form-control" name="search">
    		<div class="input-group-btn">
    			<button type="submit" class="btn btn-default" id="searchbtn"><img alt="" src="../resources/img/common/search111.png" width="20px" height="20px"></button>
    		</div>
		</div>
		</form>
		
		
		<table class="table table-bordered">
			<tr id="cname">
				<td>no</td>
				<td>상품명</td>
				<td>작성자</td>
				<td>내용</td>
				<td>작성일</td>
				<td>답변</td>
			</tr>
			
			<c:forEach items="${list}" var="dto" varStatus="vs">
			<tr class="admin-ml-tr">
				<td>${dto.qna_num}</td>
				<td><a href="./admin_qnaSelect?qna_num=${dto.qna_num}">${dto.productDTO.name} [${dto.productDTO.color}]</a></td>
				<td>${dto.id}</td>
				<td><div id="ad-ql-contents">[제목] ${dto.title}<br> [내용] ${dto.contents}</div></td>
				<td>${dto.regDate}</td>
				
				<td>
				<c:choose>
					<c:when test="${dto.qna_num eq dto.productQnaReplyDTO.qna_num}">
						<div style="color: #0066ff">완료</div>
					</c:when>
					
					<c:otherwise>
						<div style="color: #ff3300">미완료</div>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
		</table>
		
		  	<c:if test="${pager.beforeCheck}">
  				<a href="./admin_qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${search}">[이전]</a>
  			</c:if>
  
  			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  				<a href="./admin_qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
  			</c:forEach>
  	
  			<c:if test="${pager.nextCheck}">
  				<a href="./admin_qnaList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
  			</c:if>
		
		
		
	</div>
		
	</div>
</div>


<script type="text/javascript">


</script>


</body>
</html>