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
		<h1 class="header">상품 세부사항 입력</h1>
	</div>
	<form action="./productDetailInsert" method="post" enctype="multipart/form-data">
	<input type="hidden" name="product_num" value="${dto.product_num}">
	<input type="hidden" name="id" value="admin">
	<div style="padding: 30px 30px">
		<input type="button" value="FileAdd" id="fileAdd" class="btn btn-info">

		<div id="files">

		</div>
		<div id="f">
	  	  	<div class="input-group">
	        <input id="files" type="file" class="form-control" name="files">
	        <span class="input-group-addon del">DEL</span>
      	</div>
  </div>
  
		<button class="btn btn-dark">등록</button>	
	</div>
	</form>
</body>

<script type="text/javascript">
	var count = 0;
	$("#files").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	});
	
	$("#fileAdd").click(function() {
		
		if(count<5){
			var f = $("#f").html().trim();
			
			$("#files").append(f);
			count++;
		}else {
			alert("첨부파일은 최대 5개")			
		}
	});
</script>

</html>