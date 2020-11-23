<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<div class="row mem_title">
		<div class="col-12 col-md-3">
<c:choose>
	<c:when test="${member.id eq 'admin'}">
		<c:import url="../admin/adminPageRow.jsp"></c:import>
	</c:when>
	
	<c:otherwise>
		<c:import url="./memberPageRow.jsp"></c:import>	
	</c:otherwise>
</c:choose>				
		</div>
		<div class="col-12 col-md-9 member-info">
			<h1>회원탈퇴</h1>
			<hr>
			<h3>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해 주세요.</h3>
			    <div class="member-form login-input1">
			      <label for="id" class="pw-check-label">ID </label>
			      <input type="text" value="${member.id}" readonly="readonly" class="form-control pw-check" id="id" name="id"
			      	style="color: #FDC033;background-color: white;font-weight: bold;">
			    </div>
			    <div class="member-form login-input1">
			      <label for="pw" class="pw-check-label">Password </label>
			      <input type="password" class="form-control pw-check" id="pw" placeholder="Enter password" name="pw">
			    </div>
			    <div class="member-form">
			      <button type="submit" class="btn btn-warning" id="okbtn" style="font-weight: 700;color: white;">
			      	확인</button>
			      <button type="submit" class="btn btn-default" id="nobtn" style="border: 1px solid #d9d9d9;margin-left: 3px;">
			      	취소</button>
			    </div>
		
		</div>
	</div>
</div>


<!-- **********Script*********************************************************************************** -->

<script type="text/javascript">

	

	$("#okbtn").click(function() {
		
		var pw = $("#pw").val();
		var member_pw = "${member.pw}";

		if(pw == member_pw){
			location.href="./memberDeleteInfo?id=${member.id}";
		}else{
			alert("비밀번호가 일치하지 않습니다.")
		}		
		
	});

</script>


</body>
</html>