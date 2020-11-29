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
	.shelter-Sel-btn{
		border: 2px solid #FDC033;
		color: #FDC033;
		font-size: 0.88em;
		font-weight: 500;
		margin: 0 0 100px 3px;
		float: right;
	}
	.shelter-container{
		margin-top: 100px;
	}
	#title{
		text-align: center;
	}
	
	#title h4{
		font-size: 1.43em;
		margin-top: 3px;
	}
	#animal{
		font-size: 1.8em;
		font-weight: 550;
		background-color: #ffffdb;
	}
	#shelter-sel-map{
		cursor: pointer;
	}
	#shelter-container{
		margin-top: 100px;
	}
	#shelter-sel-contents h3{
		font-size: 1.3em;
		margin-left: 30px;
	}
</style>


</head>
<body>
<c:import url="../template/header.jsp"></c:import>

  <div class="container shelter-container">
  
  	 <div class="row">
		<c:import url="./shelterRow.jsp"></c:import>
		<div class="col-12 col-md-9">
		
  	<div id="title">
  
		<c:if test="${filelist[0].fileName ne null}">
	
		<!-- 사진 슬라이드  -->
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li  data-target="#demo" data-slide-to="0" class="active"></li>
				<c:if test="${filelist[1].fileName ne null}">
					<c:forEach begin="1" end="${filelist.size()-1}" step="1" varStatus="i">
						<li  data-target="#demo" data-slide-to="${i.count}"></li>
					</c:forEach>
				</c:if>	
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../resources/upload/shelter/${filelist[0].fileName}" width="500px" height="300px">
				</div>
				<c:forEach items="${filelist}" var="file">
					<c:if test="${file.fileName ne filelist[0].fileName}">
						<div class="carousel-item">
							<img src="../resources/upload/shelter/${file.fileName}" width="500px" height="300px">
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</c:if>
	
	
  	<hr>
  	<span id="animal">[${dto.animal}] ${dto.animal_kind}</span>
  	
  	<h4>${dto.sex}(${dto.neuter}) | ${dto.color} | ${dto.birth}(년생) | ${dto.kg}(Kg)</h4>
  </div>
  	<hr>
  	
  	<div id="shelter-sel-contents">
	  	<h3>·공고번호 : ${dto.num}</h3>
 		<h3>·공고기간 : ${dto.period_1} ~ ${dto.period_2}</h3>
  		<h3>·발견장소 : ${dto.place_of_find}</h3>
  		<h3>·특이사항 : ${dto.special}</h3>
  		<h3>·보호센터 : ${dto.center} (Tel: ${dto.center_tel}) 
  		<a onclick="window.open('./shelterMap?num=${dto.num}','insert','width = 500, height = 350, top = 100, left = 200, location = no');">
  		<img id="shelter-sel-map" alt="" src="../resources/img/common/map.png" width="25px" height="25px"></a></h3> 
  	</div>	
  		
  	<hr>
  
  
  <input type="button" class="btn btn-default shelter-Sel-btn" value="목록" id="list">
  <c:if test="${member.member_type eq 1 and member.id eq dto.id}">
  <input type="button" class="btn btn-default shelter-Sel-btn" value="삭제" id="del">
  <input type="button" class="btn btn-default shelter-Sel-btn" value="수정" id="update">
  </c:if>
  
  </div>
  <script type="text/javascript">
  
  	$("#list").click(function() {
		location.href="./shelterList";
	});
  
	$("#update").click(function() {
		location.href="./shelterUpdate?num=${dto.num}";
	});
	
	$("#del").click(function() {
		location.href="./shelterDelete?num=${dto.num}";
	});
	
	
	


</script>

</div>
</div>

</body>
</html>