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
	*{
	box-sizing: border-box;
	}

	.btn{
		color: white;
		font-weight: 700;
	}
	#frm{
		margin: auto;
		width: 75%;
	 	margin-bottom: 100px;
	 	margin-top: 80px;
	}
	.menu{
		text-align: center;
		font-weight: 700;
		margin-bottom: 50px;
		margin-top: 50px;
	}
	.form-control{
		width: 55%;
		display: inline;
	}
	.form-group{
		text-align: center;	
		margin-bottom: 35px;
	}
	.animal{
		margin: 35px auto;
		display: flex;
		align-items: center;
  		justify-content: center;
	}
	.info{
		width: 10%;
		font-size: 1.05em;
		font-weight: 600;
		margin-right: 6px;
	}
	.period{
		width: 26.49%;
	}
	
	#special{
		resize: none;
		height: 70px;
	}
	#fileAdd{
		display: inline;
		border: 2px solid #FDC033;
		color: #FDC033;
	}
	.file_input_textbox{
		display: inline;
		width: 65%;
		border: 1px solid #d9d9d9;
		margin-left: 170px;
		margin-bottom: 5px;
	}
	#f {
		display:none;
	}
	.sel{
		width: 12%;
	}

	.del {
        color: red;
        font-weight: bold;
    }

	
</style>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>	

	<div class="container">
 		<form id="frm" action="./shelterUpdate" method="post" enctype="multipart/form-data">
 		
 		<h4 class="menu" style="background-color: #ffffdb">기본 정보</h4>
  
    <div class="form-group">
	  <label for="보호센터" class="info">보호센터 </label>
      <input type="text" class="form-control" id="center" name="center" value="${updto.center}" readonly="readonly">
    </div>
    
    <div class="form-group">
	  <label for="보호센터 연락처" class="info">연 락 처 </label>
      <input type="text" class="form-control" id="center_tel" name="center_tel" value="${updto.center_tel}"
      placeholder="- 포함해서 입력해주세요."/>
    </div>
    
    <div class="form-group">
	  <label for="발견장소" class="info">발견장소 </label>
      <input type="text" class="form-control" id="place_of_find" name="place_of_find" value="${updto.place_of_find}">
    </div>
    
    
    <div class="form-group">
	  <label for="공고기간1" class="info">공고기간 </label>
      <input type="date" style="background-color: white;" readonly="readonly" class="form-control period" id="period_1" name="period_1"> ~ 
      <input type="date" class="form-control period" id="period_2" name="period_2" value="${updto.period_2}" onclick="validDate()">
    </div>
       
    
    
    <!-- ********************************************************************************************* -->
    
    
    <h4 class="menu" style="background-color: #ffffdb">동물 정보</h4>
    
    <div class="form-group animal_sel">
	  <label for="동물" class="info" style="margin-bottom: 13px;">동물 </label>
		<select name="animal" class="sel" id="animal">
			<option value="">--선택--</option>
    		<option value="개">개</option>
    		<option value="고양이">고양이</option>
    		<option value="기타">기타</option>
		</select>
		
		<div class="animal_kind_sel">
	  
		</div>
    </div>
    
    
    <div class="form-group animal">
	  <label for="성별" class="info">성별 </label>
		<select name="sex" class="sel" id="sex">
    		<option value="암컷">암컷</option>
    		<option value="수컷">수컷</option>
    		<option value="미확인">미확인</option>
		</select>
		
	  <label for="중성화" class="info">중성화 </label>
		<select name="neuter" class="sel" id="neuter">
		 	<option value="중성화O">중성화O</option>
    		<option value="중성화X">중성화X</option>
    		<option value="---" selected="selected">---</option>
		</select>
    </div>
    
    
    <div class="form-group animal">
	  <label for="출생년도" class="info">출생년도 </label>
		<select name="birth" class="sel" id="birth">
    		<option value="2010">2010</option>
    		<option value="2011">2011</option>
    		<option value="2012">2012</option>
    		<option value="2013">2013</option>
    		<option value="2014">2014</option>
    		<option value="2015">2015</option>
    		<option value="2016">2016</option>
    		<option value="2017">2017</option>
    		<option value="2018">2018</option>
    		<option value="2019">2019</option>
    		<option value="2020">2020</option>
    		<option value="---" selected="selected">---</option>
		</select>
		
	  <label for="몸무게" class="info">몸무게(kg) </label>
		<select name="kg" class="sel" id="kg">
			<option value="50.0">50.0</option>
			<option value="49.0">49.0</option>
			<option value="48.0">48.0</option>
			<option value="47.0">47.0</option>
			<option value="46.0">46.0</option>
			<option value="45.0">45.0</option>
			<option value="44.0">44.0</option>
			<option value="43.0">43.0</option>
			<option value="42.0">42.0</option>
			<option value="41.0">41.0</option>
			<option value="40.0">40.0</option>
			<option value="39.0">39.0</option>
			<option value="38.0">38.0</option>
			<option value="37.0">37.0</option>
			<option value="36.0">36.0</option>
			<option value="35.0">35.0</option>
			<option value="34.0">34.0</option>
			<option value="33.0">33.0</option>
			<option value="32.0">32.0</option>
			<option value="31.0">31.0</option>
			<option value="30.0">30.0</option>
			<option value="29.0">29.0</option>
			<option value="28.0">28.0</option>
			<option value="27.0">27.0</option>
			<option value="26.0">26.0</option>
			<option value="25.0">25.0</option>
			<option value="24.0">24.0</option>
			<option value="23.0">23.0</option>
			<option value="22.0">22.0</option>
			<option value="21.0">21.0</option>
			<option value="20.0">20.0</option>
			<option value="19.0">19.0</option>
			<option value="18.0">18.0</option>
			<option value="17.0">17.0</option>
			<option value="16.0">16.0</option>
			<option value="15.0">15.0</option>
			<option value="14.0">14.0</option>
			<option value="13.0">13.0</option>
			<option value="12.0">12.0</option>
			<option value="11.0">11.0</option>
			<option value="10.0">10.0</option>
			<option value="9.0">9.0</option>
			<option value="8.0">8.0</option>
			<option value="7.0">7.0</option>
			<option value="6.0">6.0</option>
			<option value="5.0">5.0</option>
			<option value="4.0">4.0</option>
			<option value="3.0">3.0</option>
			<option value="2.0">2.0</option>
			<option value="1.0">1.0</option>
			<option value="1.0">1.0 이하</option>
    		<option value="---" selected="selected">---</option>
		</select>
    </div>
    
    <div class="form-group animal">
	  <label for="털색" class="info">털색</label>
      <input type="text" class="form-control" id="color" name="color" value="${updto.color}">
    </div>
    
    <div class="form-group animal">
	  <label for="특이사항" class="info">특이사항</label>
      <textarea class="form-control" id="special" name="special">${updto.special}</textarea>
    </div>
    
    <hr>
    
     <label for="파일추가" class="info" style="margin : 0 -15px 0 30px;">파일추가</label>
     	<input type="button" class="btn btn-default" id="fileAdd" value="Add" style="margin-bottom: 15px;">
	  
		<div id ="fileList">
			<div class="input-group">
				<input id="files" type="file" class="file_input_textbox" name="files">
			</div>		
		</div>
		
		
	<hr>
 	
 	<div class="form-group">
    	<button type="submit" class="btn btn-warning" id="wrbtn">확인</button>
    	<a href="./shelterList"><input type="button" class="btn btn-warning" id="cancel" value="취소"></a>
    </div>
  </form>

	<div id ="f">
		<div class="input-group">
       		<input id="files" type="file" class="file_input_textbox" name="files">
       		<span class="input-group-addon del">X</span>
    	</div>
	</div>
	
	</div>

 <!-- **********Script*********************************************************************************** -->
 
 

<script type="text/javascript">
	
	init();
	
	function init(){
		$("#animal").val("${updto.animal}").prop("selected", true);
		$("#animal_kind").val("${updto.animal_kind}").prop("selected", true);
		$("#kg").val("${updto.kg}").prop("selected", true);
		$("#birth").val("${updto.birth}").prop("selected", true);
		$("#neuter").val("${updto.neuter}").prop("selected", true);
		$("#sex").val("${updto.sex}").prop("selected", true);
	}
	
//--------------------------------------------------------------------------------------------------



	document.getElementById('period_1').value = new Date().toISOString().substring(0, 10);
	
	
	
	function getInputDateFormat(date) {
	     return date.toISOString().split('T')[0];
	}

	function validDate() {
	     var today = new Date();
	     var maxDate = new Date();
	     maxDate.setDate(maxDate.getDate() + 14);

	     document.getElementsByName("period_2")[0].setAttribute('min', getInputDateFormat(today));
	     document.getElementsByName("period_2")[0].setAttribute('max', getInputDateFormat(maxDate));
	}
	
	
//--------------------------------------------------------------------------------------------------
	
	
	 $(document).ready(function(){
	      var animal = $("#animal option:selected").val();
	      var hml = "";
	      
	      if(animal == "개"){
	    	 hml += "<label for='품종' class='info'>품종 </label> <select class='s_animal_kind sel' id='animal_kind' name='animal_kind'>";
		     hml += "<option value='전체'>전체</option>";
		     hml += "<option value='기타'>기타</option>";
	         hml += "<option value='골든리트리버'>골든리트리버</option>";
	         hml += "<option value='그레이하운드'>그레이하운드</option>";
	         hml += "<option value='그레이트덴'>그레이트덴</option>";
	         hml += "<option value='그레이트피레니즈'>그레이트피레니즈</option>";
	         hml += "<option value='꼬똥드뚤레아'>꼬똥드뚤레아</option>";
	         hml += "<option value='네오폴리탄마스티프'>네오폴리탄마스티프</option>";
	         hml += "<option value='노리치테리어'>노리치테리어</option>";
	         hml += "<option value='뉴펀들랜드'>뉴펀들랜드</option>";
	         hml += "<option value='닥스훈트'>닥스훈트</option>";
	         hml += "<option value='달마시안'>달마시안</option>";
	         hml += "<option value='댄디딘몬트테리어'>댄디딘몬트테리어</option>";
	         hml += "<option value='도고까니리오'>도고까니리오</option>";
	         hml += "<option value='도고아르젠티노'>도고아르젠티노</option>";
	         hml += "<option value='도베르만'>도베르만</option>";
	         hml += "<option value='도사'>도사</option>";
	         hml += "<option value='동경견'>동경견</option>";
	         hml += "<option value='라브라도리트리버'>라브라도리트리버</option>";
	         hml += "<option value='라사압소'>라사압소</option>";
	         hml += "<option value='라이카'>라이카</option>";
	         hml += "<option value='래빗닥스훈드'>래빗닥스훈드</option>";
	         hml += "<option value='랫테리어'>랫테리어</option>";
	         hml += "<option value='레이크랜드테리어'>레이크랜드테리어</option>";
	         hml += "<option value='로디지안리즈백'>로디지안리즈백</option>";
	         hml += "<option value='로트바일러'>로트바일러</option>";
	         hml += "<option value='롯트와일러'>롯트와일러</option>";
	         hml += "<option value='마리노이즈'>마리노이즈</option>";
	         hml += "<option value='마스티프'>마스티프</option>";
	         hml += "<option value='말라뮤트'>말라뮤트</option>";
	         hml += "<option value='말티즈'>말티즈</option>";
	         hml += "<option value='믹스견'>믹스견</option>";
	         hml += "<option value='푸들'>푸들</option>";
	         hml += "</select>"
	      }else if(animal == "고양이"){
		     hml += "<label for='품종' class='info'>품종 </label> <select class='s_animal_kind sel' id='animal_kind' name='animal_kind'>";
			 hml += "<option value='전체'>전체</option>";
	         hml += "<option value='기타'>기타</option>";
	         hml += "<option value='노르웨이숲'>노르웨이숲</option>";
	         hml += "<option value='데본렉스'>데본렉스</option>";
	         hml += "<option value='러시안블루'>러시안블루</option>";
	         hml += "<option value='레그돌-라가머핀'>레그돌-라가머핀</option>";
	         hml += "<option value='맹크스'>맹크스</option>";
	         hml += "<option value='먼치킨'>먼치킨</option>";
	         hml += "</select>"
	      }else if(animal == "기타"){
	    	  hml += "<label for='품종' class='info'>품종 </label> <input type='text' class='form-control' id='animal_kind' name='animal_kind'>";
	      }
	
        $(".animal_kind_sel").html(hml);
        
     });
	
//--------------------------------------------------------------------------------------------------
	
	var count =0;
	
	$("#fileAdd").click(function(){
		if(count<2){
			var f = $("#f").html().trim();
			$("#fileList").append(f);
			count++;
		}else{
			alert("첨부파일은 3개까지 가능합니다.");
		}
	});
	
	$("#fileList").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	});
	
	
//--------------------버튼 이벤트----------------------------------------------------------------------
	
	$("#wrbtn").click(function() {
		var place_of_find = $("#place_of_find").val();
		var period_1 = $("#period_1").val();
		var period_2 = $("#period_2").val();
		var animal = $("#animal").val();
		var animal_kind = $("#animal_kind").val();
		var files = $("#files").val();
		
		
		if(place_of_find==''){
			alert("발견장소를 입력하세요.")
			return false;
		}else if(period_2==''){
			alert("공고기간을 입력하세요.")
			return false;
		}else if(animal_kind == '' || animal_kind=="전체"){
			alert("품종을 입력하세요.")
			return false;
		}else if(animal==''){
			alert("동물 선택은 필수입니다.")
			return false;			
		}else if(files==''){
			alert("사진은 필수입니다.")
			return false;
		}
			
	});
		
	$("#cancel").click(function() {
	 	if (confirm("이 페이지에서 나가시겠습니까?") == true){    //확인
	     	location.href="./shelterList";

	 	}else{   //취소
	     	return false;
	 	}
	});
	
</script>

	

</body>
</html>