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

	.carousel-inner{
		margin : 0 auto;
		width: 300px;
		height: 300px;
	}
	
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
#volSelcontainer{
	border : 2px solid #FFE4B5;
	margin: 50px auto 50px;
	width: 800px;
	height:auto;
	border-radius: 5px;
}

#volSelDiv1{
	padding : 10px;
	width: 800px;
	height:auto;
}
#volSelDiv1 > #sDiv1{
	margin: 0px auto;
	width: 800px;
	height:auto;
	font-size: 30px;
	color: black;
}
#volSelDiv1 > #sDiv2{
	display : inline-block;
	width: 390px;
	height:auto;
	color: gray;
	font-size: 12px;
}

#volSelDiv1 > #sDiv3{

	display : inline-block;
	margin-left : 20px;
	width: 350px;
	height:auto;
	text-align: right;
	color: gray;
	font-size: 12px;
}

.carousel-indicators{
	background-color: orange;
	width: 100px;
	text-align: center;
	margin: 0 auto;
	opacity: 0.5;
	border-radius: 5px;
}
#conDiv{
	width : 700px;
	height : auto;
	margin: 50px auto 50px;
	
}
#conDiv > pre{
	font-family: "Noto Sans KR", sans-serif;
  	letter-spacing: -0.01em;
	font-size: 15px;
	color: black;
}
#btnDiv{
	
	width: 775px;
	height: auto;
	text-align: right;
	margin-bottom: 10px;

	
}
#btnDiv > .btn {
	width: 60px;
	background-color: #FFE4B5;
	border: 2px solid #FFE4B5;
	font-size: 13px;
	border-radius: 5px;
	padding: 5px;
}
#btnDiv > .btn1 {
	width: 118px;
	background-color: #FF6347;
	border: 2px solid #FF6347;
	font-size: 13px;
	border-radius: 5px;
	padding: 5px;
	font-weight: bold;
	color: white;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div id="volSelcontainer">
		<div id="volSelDiv1">
			<div id="sDiv1">
				${dto.title}
			</div>
			<div id="sDiv2">
				${dto.writer}<br>
				${dto.regDate}
			</div>
			<div id="sDiv3">
				조회수  ${dto.hit}
			</div>
		</div>
		<hr>
	<c:if test="${files[0].fileName ne null}">
	
		<!-- 사진 슬라이드  -->
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li  data-target="#demo" data-slide-to="0" class="active"></li>
				<c:if test="${files[1].fileName ne null}">
					<c:forEach begin="1" end="${files.size()-1}" step="1" varStatus="i">
						<li  data-target="#demo" data-slide-to="${i.count}"></li>
					</c:forEach>
				</c:if>	
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../resources/upload/voluntary/${files[0].fileName}">
				</div>
				<c:forEach items="${files}" var="file">
					<c:if test="${file.fileName ne files[0].fileName}">
						<div class="carousel-item">
							<img src="../resources/upload/voluntary/${file.fileName}">
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</c:if>

		<div id="conDiv">
			<pre>${dto.contents}</pre>
		</div>
			<!-- <h3 id="num">글번호 : ${dto.num}</h3> -->
		<div id="btnDiv">
			<input type="button" value="봉사 신청 현황 보기" id="res" class="btn1">
			<input type="button" value="수정하기" id="update" class="btn"> 
			<input type="button" value="삭제하기" id="del" class="btn">
			<input type="button" value="목록보기" id="golist" class="btn"> 
		</div>
	</div>

		<script type="text/javascript">
		
		
		//var num = $("#num").html();

		$("#update").click(function() {
			location.href = "./voluntaryUpdate?num=" + ${dto.num};
		});
		$("#del").click(function() {
			location.href = "./voluntaryDelete?num=" + ${dto.num};
		});

		$("#res").click( function() {
			window.open('./calendar/reserveCalendar?num=${dto.num}','예약 현황','left=250px, width=700px,height=700px, scrollbars=yes, resizable=no');
		});
		
		$("#golist").click(function() {
			location.href="./voluntaryList";
		});
	</script>
</body>
</html>