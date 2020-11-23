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
	.btn{
		color: white;
		font-weight: 700;
		margin-top: 50px;
	}
</style>

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
			<h2>기본정보</h2>
			<div class="member-item">
				<table>
					<tr><th>아이디</th><td>${member.id}</td></tr>
					<tr><th>이름</th><td>${member.name}</td></tr>
					<tr><th>이메일</th><td>${member.email}</td></tr>
					<tr><th>휴대폰번호</th><td>${member.phone}</td></tr>
					<tr>
						<th>주소</th>
						<td>${member.address}</td>
					</tr>
				</table>

			</div>
				<div class="form-group">
    				<input type="button" class="btn btn-warning" id="delbtn" value="확인">
    				<input type="button" class="btn btn-warning" id="cancel" value="취소">
    			</div>
		</div>

	</div>

	
</div>

	



<!-- **********Script*********************************************************************************** -->


<script type="text/javascript">


	$("#delbtn").click(function() {
		if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
 		location.href="./memberDelete?id=${member.id}";

		}else{   //취소
 		return false;
		}
	});



	$("#cancel").click(function() {
 		if (confirm("이 페이지에서 나가시겠습니까?") == true){    //확인
     		location.href="./memberPage";

 		}else{   //취소
     		return false;
 		}
	});


</script>




</body>
</html>