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
	#id{
		border: 0px;
		color: #a6a6a6;
	}
</style>


</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<form id="frm" action="./memberUpdate" method="post">
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
			<h1>회원정보 변경</h1>
			<hr>
			<h2 >기본정보</h2>
			<div class="member-item">
			<input type="hidden" value="${member.member_type}" name="member_type" id="member_type">
			<input type="hidden" value="${member.points}" name="points" id="points">
				<table>
					<tr><th>아이디</th><td><input type="text" name="id" id="id" value="${member.id}" readonly="readonly"></td></tr>
					<tr><th>비밀번호</th><td><input type="password" name="pw" id="pw"/></td></tr>
					<tr><th>비밀번호 확인</th><td><input type="password" name="pw2" id="pw2"/><span id="pwResult2"></span></td></tr>
					<tr><th>이름</th><td><input type="text" name="name" id="name" value="${member.name}"/></td></tr>
					<tr><th>이메일</th><td><input type="text" name="email" id="email" value="${member.email}"/></td></tr>
					<tr><th>휴대폰번호</th><td>
						<div class="form-items">
            			 <select name="phone1" id="phone1" style="height: 30px;">
                 			<option value="010">010</option>
                 			<option value="011">011</option>
                 			<option value="016">016</option>
                 			<option value="017">017</option>
                 			<option value="018">018</option>
                 			<option value="019">019</option>
             			 </select>-
             				 <input type="text" class="form-control empty" id="phone2" name="phone2" required="required" style="height: 30px;width: 200px;">-
             				 <input type="text" class="form-control empty" id="phone3" name="phone3" required="required" style="height: 30px;width: 200px;">
              				 <input type="hidden" name="phone" id="phone">
           				</div>
					</td></tr>
					<tr>
						<th>주소</th>
						<td>
        					<div class="form-group" style="padding-top: 20px;">
          					 <div class="address-items">
            					<input type="text" id="sample6_postcode" placeholder="우편번호" name="zipCode" value="${member.zipCode}">
            					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            					<input type="text" id="sample6_address" placeholder="주소" name="address" class="text" value="${member.address}"><br>
            					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress" class="text" value="${member.detailAddress}"><br>
            					<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress" class="text" value="${member.extraAddress}">
         					 </div>
       					 </div>
						</td>
					</tr>
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
 		location.href="./memberPage";

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