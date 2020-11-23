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
	    background-color: #737373;
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
	
	#qna-Re-addbtn{
		border: 1.5px solid #737373;
		color: #737373;
		font-size: 0.88em;
		font-weight: 500;
		float: right;
	}
</style>
</head>
<body>
	<div style="margin: 0px;width: 100%">
		<h1 class="header">상품 Q&A 답글 작성하기</h1>
	</div>
	<form action="./productQnaReplyInsert" method="post">
	<input type="hidden" name="qna_num" value="${dto.qna_num}">
	<input type="hidden" name="id" value="admin">
	<div style="padding: 30px 30px">
		<div style="padding: 18px 18px;margin-bottom: 70px;border: 1px solid #cfcfcf">
			<textarea name="contents" class="insertText" placeholder="답글을 입력하세요." maxlength="1000"></textarea>
		</div>
		<button id="qna-Re-addbtn" class="btn btn-default">등록</button>
	</div>
	</form>
</body>
</html>