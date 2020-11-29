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



.admin-tbl h1 {
	font-size: 1.3em;
	font-weight: 700;
	margin-bottom: 10px;
	}
	
#ad-product-sel{
	margin-top: 50px;
	font-size: 0.9em;
	font-weight: 400;
}

#mbPage-container p{
	margin-left: 10px;
}

.ad-product-sel_p1{
	color: #737373;
	margin-bottom: -8px;
}

#ad-product-sel_p2{
	font-size: 1.3em;
}

#ad-product-sel_p3{
	font-size: 1em;
	margin-top: -10px;
}

#mbPage-container span{
	font-size: 0.8em;
	margin-left: 5px;
}

#ad-product-sel_d{
	width: 80%;
	border-top : 1px solid #d9d9d9;
	border-bottom : 1px solid #d9d9d9;
	padding: 10px 10px 150px 10px;
}

.ad-product-sel_btn{
	border: 2px solid #FDC033;
	color: #FDC033;
	font-size: 0.8em;
	font-weight: 500;
	float: right;
	margin: 10px 3px 0 0;
}
#ad-qnaSel-reply{
	font-size: 0.9em;
	font-weight: 400;
	margin-left: 5px;
	color: #737373;
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
		<h1>QnA</h1>
		<hr>
	<div>	
		<div id="ad-product-sel">
			<p class="ad-product-sel_p1">${dto.name} - ${dto.color}</p>
			<hr width="40%">
			<p id="ad-product-sel_p2">${dto.title}</p>
			<p id="ad-product-sel_p3">${dto.id} <span>${dto.regDate}</span></p>
			<div id="ad-product-sel_d">
				${dto.contents}
			</div>
		</div>
		
		<div style="height: 50px;">
		<a href="./admin_qnaList"><button class="btn btn-default ad-product-sel_btn" style="margin-right: 20%;">목록</button></a>
		
		<c:choose>
			<c:when test="${dto.qna_num_1 eq dto.qna_num}">
				<button class="btn btn-default ad-product-sel_btn" style="color: #737373;border-color: #737373">답변완료</button>	
			</c:when>
			
			<c:otherwise>
				<a onclick="window.open('../productQna/productQnaReplyInsert?qna_num=${dto.qna_num}','insert','width = 576, height = 373.2, top = 100, left = 200, location = no');">
				<button class="btn btn-default ad-product-sel_btn">답글</button></a>
			</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${dto.qna_num_1 eq dto.qna_num}">
			<p class="ad-product-sel_p1">답변 <span style="color: #737373">${dto.regDate_1}</span></p> 
			<hr width="60%">
			
			<div id="ad-qnaSel-reply">
				${dto.contents_1}
			</div>
		</c:if>
	</div>
	</div>
	</div>
</div>


<script type="text/javascript">


</script>


</body>
</html>