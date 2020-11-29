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
	.c1{
		cursor: pointer;
	}
	
	.carousel-inner > .carousel-item > img{
		width : 1100px;
		height : 500px;
		min-width : 700px;
	}
	
	.description{
		margin-top: 20px;
	}
	
	.replytable{
		width : 800px
	}
	
	.del{
		display: inline-block;
		margin-right: 15px;
		color: gray;
		cursor: pointer;
		font-size: 11px;
	}
	
	.replyEmpty{
		display: inline-block;
		width : 24px;
		height : 20px;
	}
	
	.replyEmpty > span{
		color : white;
	}
	
	.replyContents{
		display : inline-block;
	}
	
	.state-select{ 
		color: white;
	}
	
	.reply{
		display: inline-block;
		color: gray;
		cursor: pointer;
		font-size: 11px;
	}
	
	.replyId{
		display : inline-block;
		margin-right: 50px; 
	}
	
	.replyId > h3{
		font-size: 13px;
	}
	
	.replyDate{
		display : inline-block; 
	}
	
	.replyDate > h3{
		font-size: 13px;
		color: gray;
	}
	
	.divs{
		margin-top : 20px;
	}
	
	.titles{
		margin-right : 10px;
		color: gray;
	}
	
	.replyTitles{
		display : inline-block;
		font-size: 1em;
		color : gray;
	}
	
	#lostDelete{
		color : blue;
		margin-right: 5px;
	}
	
	#lostUpdate{
		color : blue;
	}
	
	.replyId{
		display : inline-block;
		margin-right: 10px;
		font-size: 12px;
	}
	
	.replybtns{
		margin-left: 10px;
	}
	
	.slash{
		color: white;
	}

	.replyTextTable{
		margin : 0px 5px 5px 5px;
		border: 1px black solid;
		padding: 2px;
	}
	
	.reply-item {
		border-bottom: 1px #d9d9d9 solid;
	}
</style>

</head>

<body>

<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<div class="row">
		<div class="col-12 col-md-2 lost-header">
		<h1>신고 제보</h1>
		<hr>
		<ul class="state-link">
			<li>
			<a class="lost-link" href="./lostList?state=">전체</a>
			</li>
			<li>
			<a class="lost-link" href="./lostList?state=실종">실종</a>
			</li>
			<li>
			<a class="lost-link" href="./lostList?state=보호">보호</a>
			</li>
			<li>
			<a class="lost-link" href="./lostList?state=목격">목격</a>
			</li>
			<li>
			<a class="lost-link" href="./lostList?state=완료">완료</a>
			</li>
		</ul>
		</div>
	
	<div class="col-12 col-md-10">
	<div class="ls-item">
		<div class="state_select" title="${dto.state}">${dto.state}</div>
		<span>${dto.detailSpecies}</span>
		<span>성  별 : ${dto.gender} / 나 이 : ${dto.age} / ${dto.color} </span>
	</div>
  <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
       <img src="../resources/img/upload/lost/${files[0].fileName}" style="width:100%;">
    </div>
    <c:forEach items="${files}" var="file">
	  	<div class="carousel-item">
        	<img src="../resources/img/upload/lost/${file.fileName}" style="width:100%;">
      	</div>
	 </c:forEach>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>

<div class="description">

	<div class="divs">
		<span class="div_item">성  별 : ${dto.gender} / 나 이 : ${dto.age} / ${dto.color} </span>
	</div>
	
	<div class="divs">
		<span class="titles">특  징 :</span>
		<span>${dto.feature}</span>
	</div>
	<hr>
	
	<div class="divs">
		<span class="titles">실 종 일 :</span>
		<span>${dto.lostDate}</span>
	</div>
	
	<div class="divs">
		<span class="titles">실종장소 :</span>
		<span>${dto.lostProvince} ${dto.lostCity} ${dto.lostLocation}</span>
	</div>
	
	<div class="divs">
		<span class="titles">아 이 디 :</span>
		<span>${dto.id}</span>
	</div>
	
	<div class="divs">
		<span class="titles">연 락 처 :</span>
		<span>${dto.phone}</span>
	</div>
	<hr>
	
	<div class="divs">
		<span class="titles">특이사항 :</span>
		<span>${dto.contents}</span>
	</div>
	<hr>
	
	<div class="replyTitle">
		<h3 class="replyTitles">댓글</h3>
		<h3 class="replyTitles">(${replyCount})</h3>
	</div>
	<div id="result">
		
	</div>
	
	<form action="../lostReply/lostReplyInsert" method="post">
	  <input placeholder="댓글을 입력하세요" class="replyText" type="text" name="contents">
	  <input type="hidden" value="${dto.num}" name="lostNum">
	  <input type="hidden" value="${member.id}" name="id">
	  <button class="btn primary">댓글</button>
	</form>
	
	<c:if test="${member.id == 'admin' || member.id == dto.id}">
		<a id="lostDelete" href="./lostDelete?num=${dto.num}">글삭제</a>
		<a id="lostUpdate">글수정</a>
	</c:if>
</div>
</div>
	</div>
	<script type="text/javascript">
	 	var curPage = 1;
	    getList();
	    stateColor();
		
	    $("#lostUpdate").click(function(){
			window.open("./lostUpdate?num=${dto.num}", 'Write Form', 'width=630px, height=700px, scrollbars=yes');
		});
	    
	    $("#result").on("click", ".c1", function(){
	    	curPage = $(this).attr("title");
	    	alert(curPage);
	    	getList();
	    });
	    
	    $("#result").on("click", ".reply", function(){
	    	var num = $(this).attr("title");
	    	$("#reply"+num).html("<form action='../lostReply/reply' method='get'><h3 class='replyId'>${member.id}</h3><input type='hidden' value="+num+" name='num'><input type='hidden' value='${member.id}' name='id'><input type='text' placeholder='답글을 입력하세요' class='replyText' name='contents'><button class='replybtns'>등록</button></form>");
	    	$("#reply"+num).addClass("replyTextTable");
	    });
	    
	    $("#result").on("click", ".del", function(){
	    	var num = $(this).attr("title");
	    	var lostNum = "${dto.num}";
	    	location.href="../lostReply/lostReplyDelete?num="+num+"&lostNum="+lostNum;
	    });
	    
		function getList(){
			var num = "${dto.num}";
			$.get("../lostReply/lostReplyList?lostNum="+num+"&curPage="+curPage,function(data) {
				$("#result").html(data);
			});
		}
		
		function stateColor(){
			var val = $(".state_select").attr("title");
			if(val == "목격"){
				$(".state_select").css('background-color','#ffc107');
			}else if(val == "보호"){
				$(".state_select").css('background-color','#28a745');
			}else if(val == "실종"){
				$(".state_select").css('background-color','#fd7e14');
			}else if(val == "완료"){
				$(".state_select").css('background-color','#007bff');
			}
			
			$(".state_select").css('color','#fff');
		}
	</script>
</div>
</body>
</html>