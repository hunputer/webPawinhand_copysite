<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<c:import url="../template/address.jsp"></c:import>
<title>Insert title here</title>

<style type="text/css">
	.adminsel-ro{
		border: 0px;
		color: #404040;
	}
	#adminsel-points{
		color: #404040;
	}
</style>


</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<form id="frm" action="./admin_memberUpdate" method="post">
	<div class="row mem_title">
		<div class="col-12 col-md-3">
<c:import url="./adminPageRow.jsp"></c:import>		
		</div>
		<div class="col-12 col-md-9 member-info">
			<h1>회원관리 - [${dto.id}]</h1>
			<hr>
			<h2>기본정보</h2>
			<div class="member-item">
				<table>
					<tr><th>아이디</th><td><input type="text" name="id" id="id" value="${dto.id}" class="adminsel-ro" readonly="readonly"></td></tr>
					<tr><th>이름</th><td><input type="text" name="name" id="name" value="${dto.name}" class="adminsel-ro" readonly="readonly"/></td></tr>
					<tr><th>이메일</th><td><input type="text" name="email" id="email" value="${dto.email}" class="adminsel-ro" readonly="readonly"/></td></tr>
					<tr><th>휴대폰번호</th><td><input type="text" name="phone" id="phone" value="${dto.phone}" class="adminsel-ro" readonly="readonly"/></td></tr>
					<tr><th>주소</th>
					
					<td><input type="text" name="address" id="address" value="${dto.address}" class="adminsel-ro" readonly="readonly"/><br>
						<input type="text" name="detailAddress" id="detailAddress" value="${dto.detailAddress}" class="adminsel-ro" readonly="readonly"/><br>
						<input type="text" name="extraAddress" id="extraAddress" value="${dto.extraAddress}" class="adminsel-ro" readonly="readonly"/>
					</td></tr>
					<tr><th>적립금</th><td id="adminsel-points"><input type="text" name="points" id="points" value="${dto.points}"/>p</td></tr>
				</table>
			</div>
			
			    <div class="member-form">
			      <button type="submit" class="btn btn-warning" id="okbtn" style="font-weight: 700;color: white;">확인</button>
			      <input type="button" class="btn btn-default" id="nobtn" value="취소" style="border: 1px solid #d9d9d9;margin-left: 3px;">
			    </div>
		
		</div>
	</div>
	</form>
</div>


<!-- **********Script*********************************************************************************** -->


<script type="text/javascript">


/********* pw check *********/
 
 	var pwCheck=false;
 
	$("#pw2").blur(function(){
		var pw = $("#pw").val();
		var pw2 = $(this).val();
		pwCheck =false;
		var str= "패스워드가 일치하지 않습니다.";
	
		if(pw2==''){
			str= "패스워드를 입력하세요.";
			$("#pwResult2").removeClass("idCheck0").addClass("idCheck1");
		}else if(pw == pw2){
			str= "패스워드가 일치합니다.";
			$("#pwResult2").removeClass("idCheck1").addClass("idCheck0");
			pwCheck= true;
		}else {
			$("#pwResult2").removeClass("idCheck0").addClass("idCheck1");
		}
		$("#pwResult2").html(str); 
	});


//--------------------------------------------------------------------------------------

	

	$("#nobtn").click(function() {
		if (confirm("이 페이지에서 나가시겠습니까?") == true){    //확인
 		location.href="./admin_memberList";

		}else{   //취소
 		return false;
		}
	});
	
	
	
	
	$(function() {
			$("#phone3").on("keyup", function() {
			var p = $("#phone1 option:selected").text();
    	var str = $("input[name^='phone']:visible").map(function() {
       	return $(this).val();
    	}).get().join("-");
   		$("#phone").val(p+"-"+str);
		});
});

</script>



</body>
</html>