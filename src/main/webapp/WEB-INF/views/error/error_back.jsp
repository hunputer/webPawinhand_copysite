<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>

<style type="text/css">

	.container p{
		color: #FDC033;
		padding-top: 15px;
		font-size: 2.3em;
		font-weight: 700;
	}
	#error-logo-div{
		display: flex;
		align-items: center;
		padding: 0;
		margin: 100px 0 20px 0;
		text-align: center;
		justify-content: center;
	}
	#error-contents{
		width: 63%;
		margin: auto;
		text-align: center;
	}
	
</style>

</head>
<body style="background-color: #ffffeb">

	<div class="container">
	 <div id="error-contents">
		<div id="error-logo-div">
			<img alt="logo" src="${pageContext.request.contextPath}/resources/img/common/logo.png" width="100px" height="100px">
			<p>PAWINHAND</p>
		</div>
			<h2>웹 사이트에서 페이지를 표시할 수 없습니다.</h2>
	 </div>
	</div>

</body>
</html>