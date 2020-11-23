<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.header{
		display: block;
	    padding: 15px 30px;
	    margin : 0px 0px;
	    background-color: #353b4c;
	    font-size: 18px;
	    letter-spacing: -1px;
	    color: #ffffff;
	    font-weight: normal;
	}
	
	.insertText{
		width: 100%;
	    height: 110px;
	    border: 0;
	    font-size: 13px;
	    line-height: 20px;
	    color: #222222;
	    resize: none;
	}
	
	.insertTitle{
		width: 100%;
	    height: 25px;
	    border: 0;
	    font-size: 13px;
	    line-height: 20px;
	    color: #222222;
	    resize: none;
	}
</style>
</head>
<body>
	<div style="margin: 0px;width: 100%">
		<h1 class="header">상품 Q&A 작성하기</h1>
	</div>
	<form action="./productQnaInsert" method="post">
	<input type="hidden" name="product_num" value="${dto.product_num}">
	<input type="hidden" name="id" value="${member.id}">
	<div style="padding: 30px 30px">
		<div style="padding: 5px 18px; border: 1px solid #cfcfcf; margin-bottom: 20px">
			<textarea  name="title" class="insertTitle" placeholder="제목을 입력하세요" maxlength="100"></textarea>
		</div>
		
		<div style="padding: 18px 18px;margin-bottom: 70px;border: 1px solid #cfcfcf">
			<textarea name="contents" class="insertText" placeholder="문의하실 내용을 입력하세요" maxlength="1000"></textarea>
		</div>
		<button class="btn btn-dark">등록</button>	
	</div>
	</form>
</body>
</html>