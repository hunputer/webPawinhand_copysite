<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<style type="text/css">

.volWrContainer{
	margin : 50px auto 50px;
	width :1000px;
	height: 1000px;
}

.form-group{
	font-size: 18px;
}
.btnDiv{
	margin-top : 20px;
	width: 1000px;
	height: auto;
	text-align: right;
	
}

.btnDiv > #btn{
	width: 100px;
	background-color: #FFE4B5;
	border: 2px solid #FFE4B5;
	font-size: 15px;
	border-radius: 5px;
	padding: 5px;
	font-weight: bold;
}

.form-group > textarea{
	width: 1000px;
	height : 200px;
}
#fileAdd{
	width: 90px;
	background-color: #FFE4B5;
	border: 2px solid #FFE4B5;
	font-size: 13px;
	border-radius: 5px;
	padding: 5px;
	margin-bottom: 10px;
	font-weight: bold;
}

.del{
	width: 30px;
	height : 10px;
	background-color: #FFE4B5;
	border: 1px solid gray;
	font-size: 9px;
	border-radius: 5px;
	padding: 5px;
	margin-bottom: 10px;
	margin-left: 5px;
	color: gray;
}
 #files{
 
	border: 1px solid #FFE4B5;
	font-size: 13px;
}
#fileDiv{
	width: 400px;
	height: 70px;
}

#f2{
      display:none;
   }

.form-control{
	width: 920px;
}
.volWriteHeader{
		width: 1000px;
		height: 70px;
		border-bottom: 1px solid #DCDCDC;
		font-size: 30px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="volWrContainer">
	<div class="volWriteHeader">
			이동 봉사 글쓰기
		</div>
	<form method="post" action="./voluntaryWrite" enctype="multipart/form-data">
		<div class="form-group">
			제목  <input type="text" class="form-control" name="title">
		</div>
		<div class="form-group">
			작성자  <input type="text" class="form-control" name="writer">
		</div>
		<div class="form-group">
			 <textarea  name="contents" id="contents" placeholder="내용을 입력하세요."></textarea>
		</div>

		<input type="button" value="첨부파일 추가" id="fileAdd">
		
		<div id="f">
			<input id="files" type="file" name="files">
		</div>
		
		<div id="fileDiv">		</div>
		
		
		<div class="btnDiv">
			<input id="btn" type="submit" value="게시하기">
		</div>
		
	</form>
	
	<div id="f2">
			<div id="ff">
				<input id="files" type="file" name="files">
				<span class="del">삭제</span>
			</div>
		</div>
	
</div>

	<script type="text/javascript">
		var count=1;
		
		$("#fileDiv").on("click", ".del", function() {
			$(this).parent().remove();
			count--;
		});
	
		$("#fileAdd").click(function() {
			var f = $("#f2").html().trim();
			
			if(count<3){
				$("#fileDiv").append(f);
				count++;
			}else {
				alert("첨부파일은 최대 3개")			
			}
		});
</script>
</body>
</html>