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

.volUpContainer{
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

.btnDiv > #update{
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
	margin-top : 5px;
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
	margin-left: 3px;
	color: gray;
	cursor: pointer;
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
  #outFile{
  	width: 790px;
	height: 75px;
  }

  #outFile > .d1{
  	margin-bottom : 7px;
  	font-size: 15px;
  }
  #outFile > .d2{
  	width: 750px;
	height: 50px;
	margin-top : 3px;
  	font-size: 12px;
  }
#ddd{
  	margin-left : 10px;
  	width: 170px;
  	height :28px;
  	display: inline-block;
  }
  
  #dddDiv1{
  	width: 120px;
  	height: 27px;
  	display: inline-block;
  }

.d2Span{
	width: 33px;
	height : 27px;
	background-color: #FFE4B5;
	border: 1px solid gray;
	font-size: 5px;
	border-radius: 5px;
	padding: 5px;
	color: gray;
	cursor: pointer;
	display: inline-block;
	position : right;
}
#hiddenName{
	display: none;
}
.volUpHeader{
		width: 1000px;
		height: 70px;
		border-bottom: 1px solid #DCDCDC;
		font-size: 30px;
		margin-bottom: 50px;
	}
.form-control{
	width: 920px;
}
</style>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="volUpContainer">
	<div class="volUpHeader">
			이동 봉사 글 수정하기
		</div>

	<form action="./voluntaryUpdate" method="post"  enctype="multipart/form-data">
		
		<input type="hidden" class="form-control" name="num" value="${dto.num}">
		<input type="hidden" class="form-control" name="hit" value="${dto.hit}">
		<input type="hidden" class="form-control" name="regDate" value="${dto.regDate}">
		
		<div class="form-group">
			제목  <input type="text" class="form-control" name="title" value="${dto.title}">
		</div>
		<div class="form-group">
			작성자  <input type="text"  readonly="readonly" class="form-control" name="writer" value="${dto.writer}">
		</div>
		<div class="form-group">
			 <textarea  name="contents" id="contents">${dto.contents}</textarea>
		</div>

		<!-- 파일 있으면 파일이름 가져와서 뿌리기 -->
		<div id = "outFile">
			<div class="d1">업로드한 파일 리스트</div>
			<div class = "d2">
				<c:if test="${files[0].oriName ne null}">
				
					<c:forEach items="${files}" var="file">
						
					<div id="ddd">	
						<div id="dddDiv1">${file.oriName}</div>
						<div class="d2Span" title="${file.fileNum}">삭제<div id="hiddenName">${file.fileName}</div>
						</div>
					</div>
					
					</c:forEach>
				</c:if>
			</div>
		</div>

		
				<input type="button" value="첨부파일 추가" id="fileAdd">

				<div id="fileDiv"></div>

				<div class="btnDiv">
					<input type="submit" value="수정하기" id="update">
				</div>
		</form>
	
	<div id="f2">
			<div id="ff">
				<input id="files" type="file" name="files2">
				<span class="del">삭제</span>
			</div>
	</div>
</div>
	
	<script type="text/javascript">

	var length = $(".d2Span").length;
	
	$("#fileDiv").on("click", ".del", function() {
		$(this).parent().remove();
		length--;
	});

	$("#fileAdd").click(function() {
		var f = $("#f2").html().trim();

		if(length<3){
			$("#fileDiv").append(f);
			length++;
		}else {
			alert("첨부파일은 최대 3개")			
		}
	});
	
	$(document).on("click",".d2Span",function() {
		var a = $(this);
		var num = $(this).attr('title');
		console.log(num);
		var name = $(this).children('div').html();
		console.log(name);
		
		$.ajax(
				{
					method:"GET",
					url:"./volUpdateFileDel",
					data:{fileNum:num, fileName:name},
					success:function(data){
						alert(data);
						a.parent().remove();
						length--;
						
					}
				}		
			);
		
	});
	
</script>
</body>
</html>