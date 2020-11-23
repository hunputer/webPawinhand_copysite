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
		width: 50%;
		display: inline;
	}
	.form-group{
		text-align: center;	
		margin-bottom: 35px;
		padding-right: 60px;
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
		text-align: right;
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
 	<form id="frm" action="./goodsUpdate" method="post" enctype="multipart/form-data">
 		
 	<h4 class="menu" style="background-color: #ffffdb">상품 정보</h4>
 	
 	<input type="hidden" name="product_num" value="${dto.product_num}">
 	
 	<div class="form-group">
	  <label for="카테고리" class="info">카테고리 </label>
	  <select class="form-control" id="category_num" name="category_num">
	  	<option value="1">패션</option>
	  	<option value="2">악세사리</option>
	  	<option value="3">반려용품</option>
	  	<option value="4">매거진</option>
	  </select>
    </div>	
  
    <div class="form-group">
	  <label for="상품이름" class="info">상품이름 </label>
      <input type="text" class="form-control" value="${dto.name}" id="name" name="name" placeholder="상품이름을 입력하세요">
    </div>
    
    <div class="form-group">
	  <label for="상품가격" class="info">상품가격 </label>
      <input type="text" class="form-control" value="${dto.price}" id="price" name="price"  
      placeholder="숫자만 입력하세요"/>
    </div>
    
    <div class="form-group">
	  <label for="재고" class="info">재고 </label>
      <input type="text" class="form-control" value="${dto.stock}" id="stock" name="stock" placeholder="재고를 입력하세요">
    </div>
    
    <div class="form-group">
	  <label for="규격" class="info">규격 </label>
      <input type="text" class="form-control" id="weight" name="weight" value="${dto.weight}"
      placeholder="규격을 입력하세요  ex)50cmX50cm">
    </div>
    
    <div class="form-group">
	  <label for="색깔" class="info">색깔 </label>
      <input type="text" class="form-control" id="color" name="color" value="${dto.color}"
      placeholder="색깔을 입력하세요">
    </div>
    
    <div class="form-group">
	  <label for="부가설명" class="info">부가설명 </label>
      <input type="text" class="form-control" id="descriptions" name="descriptions" value="${dto.descriptions}"
      placeholder="부가설명을 입력하세요">
    </div>
    
    <hr>
    
    
    <!-- ********************************************************************************************* -->
    
     <label for="파일추가" class="info" style="margin : 0 -15px 0 30px;text-align: center">파일추가</label>
     	<input type="button" class="btn btn-default" id="fileAdd" value="Add" style="margin-bottom: 15px;">
	  
		<div id ="fileList">
			<div class="input-group">
				<input id="files" type="file" class="file_input_textbox" name="files">
			</div>		
		</div>
		
		
	<hr>
 	
 	<div style="text-align: center">
    	<button style="margin-right: 100px" type="submit" class="btn btn-warning" id="wrbtn">확인</button>
    	<input type="button" class="btn btn-warning" id="cancel" value="취소">
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
//--------------------------------------------------------------------------------------------------
	
	var count =0;
	init();
	
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
		var catagory_num = $("#catagory_num option:selected").val();
		var name = $("#name").val();
		var price = $("#price").val();
		var stock = $("#stock").val();
		var weight = $("#weight").val();
		var color = $("#color").val();
		var descriptions = $("#descriptions").val();
		var files = $("#files").val();
		
		
		if(catagory_num==''){
			alert("카테고리를 선택하세요.")
			return false;
		}else if(name==''){
			alert("이름을 입력하세요.")
			return false;
		}else if(price==''){
			alert("상품가격을 입력하세요.")
			return false;
		}else if(stock==''){
			alert("재고를 입력하세요.")
			return false;			
		}else if(color==''){
			alert("색깔을 입력하세요.")
			return false;
		}else if(descriptions == ''){
			alert("부가설명을 입력하세요.")
			return false;
		}
		else if(files==''){
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
	
	function init(){
		$("#category_num").val("${dto.category_num}");
	}
	
</script>

	

</body>
</html>