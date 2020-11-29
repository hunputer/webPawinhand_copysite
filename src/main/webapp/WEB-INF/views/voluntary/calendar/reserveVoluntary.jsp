<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/bootStrap.jsp"></c:import>
<style type="text/css">
	#resContainer{
		width: 600px;
		height: 600px;;
		margin : 10px auto 0px;
	}
	
	.resDiv1{
		width: 600px;
		text-align :center;
		font-size: 22px;
		font-weight: bold;
		margin-bottom: 15px;
		
	}
	.form-group{
		font-size: 16px;
		font-weight: bold;
	}
	
	.btnDiv{
		width: 600px;
		text-align: right;
	}
	
	#btn{
		width: 80px;
		background-color: #FFE4B5;
		border: 2px solid #FFE4B5;
		font-size: 15px;
		border-radius: 5px;
		padding: 5px;
		font-weight: bold;
	}
	.form-control{
		width: 500px;
	}
</style>
</head>
<body>
<div id="resContainer">
	<div class="resDiv1">
		봉사 신청
	</div>
	<form action="./reserveVoluntary" method="post">

		<input type="hidden" name="num" value="${dto.num}">
		<div class="form-group">
			신청 날짜  <input type="text" class="form-control" name="resDate" value="${dto.resDate}" readonly="readonly">
		</div>
	
		<div class="form-group">
			id <input type="text" class="form-control" name="id" value="${member.id}" readonly="readonly">
		</div>
	
		<div class="form-group">
			봉사 가능 시간<br>
			<input id="tt" type="time" class="timeDiv" name="startTime">    부터     <input type="time" class="timeDiv" name="endTime"> 까지
		</div>
		<div class="btnDiv">
			<button type="submit" id="btn">신청하기</button>
		</div>
	</form>
</div>

</body>
</html>