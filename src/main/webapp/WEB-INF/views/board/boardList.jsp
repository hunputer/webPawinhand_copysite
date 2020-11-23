<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/bootStrap.jsp"></c:import>
</head>
<body>

<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<div class="col-12">
	  <h1 class="board-title">${name}</h1>
	  <table class="tableborder table table-hover board-table">
		<tr>
			<th> </th>
			<c:if test="${board eq 'community'}">
			<th>종류</th>
			</c:if>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회</th>	
		</tr>  
	  	
	  	<c:forEach items="${lists}" var="dto">
	  		<tr>
	  			<td>${dto.num}</td>
	  			<c:if test="${board eq 'community'}">
	  				<td>${dto.type}</td>
	  			</c:if>
	  			<td><a href="./${board}Select?num=${dto.num}">
	  			<c:catch>
	  				<c:forEach begin="1" end="${dto.depth}">
	  				--
	  				</c:forEach>
	  			</c:catch>
	  			<strong>
	  			${dto.title}</a></strong></td>
	  			<td>${dto.writer}</td>
	  			<td>${dto.regDate}</td>
	  			<td>${dto.hit}</td>
	  			
	  			
	  		</tr>
	  		
	  		
	  	</c:forEach>
	  	
	  	<c:choose>
				<c:when test="${board eq 'community'}">
					<c:if test="${empty lists}"><tr><td colspan="6">해당 데이터가 없습니다.</td></tr></c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${empty lists}"><tr><td colspan="5">해당 데이터가 없습니다.</td></tr></c:if>
				</c:otherwise>
		</c:choose>
	  	
	  </table>
	  
	  <div class="pager">
	  	<c:if test="${pager.startNum gt 1}">
	  		 <span class="c1" title="${pager.startNum-1}"}>[이전]</span>
	    </c:if>
	  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	  		<span class="c1" title="${i}">${i}</span>
	  	</c:forEach>
	  	
	  	<c:if test="${pager.nextCheck}">
	  		<span class="c1" title="${pager.lastNum+1}">[다음]</span>
	  	</c:if>
	  </div>
	  
	  <div class="searchrow">
		  <div class="search-form">
		  <form id="searchForm" action="./${board}List">
		  	<input type="hidden" name="curPage" id="curPage">
		       <div class="input-group">
		       <c:if test="${board eq 'community'}">
		      	<select class="input-group-sm" id="type" name="type">
					<option value="dog">개</option>
					<option value="cat">고양이</option>
					<option value="etc">기타</option>
				</select>
		       </c:if>
		       
		        <select class="input-group-sm" id="kind" name="kind">
		        	<option value="tt">제목</option>
		        	<option value="wr">내용</option>
		        	<option value="con">작성자</option>
		        </select>
		        <input id="search" type="text" class="form-control" name="search">
		        <div class="input-group-btn">
		              <button class="btn btn-light" type="submit">
		            	검색
		              </button>
		        </div>
		      </div>
		  </form>
		  </div>
		  <img class="writeIcon" src="../resources/img/lost/write.png" tabindex=0 width="50" height="50" alt="">
	  </div>

</div>
</div>
<script type="text/javascript">
	var type = '${pager.type}';
	var kind = '${pager.kind}';
	if(kind == ''){
		kind = "tt";
	}
	if(type == ''){
		type= "dog";
	}
	var search = '${pager.search}';
	$("#kind").val(kind);
	$("#type").val(type);
	$("#search").val(search);
	
	$(".c1").click(function(){
		var cur = $(this).attr("title");
		$("#curPage").val(cur);
		$("#kind").val(kind);
		$("#type").val(type);
		$("#search").val(search);
		$("#searchForm").submit();
	})
	
		$(".writeIcon").click(function(){
		location.href= "./${board}Write";
	});

	$(".writeIcon").mouseenter(function(){
		$(this).addClass("writeIconfocus");
	});

	$(".writeIcon").mouseleave(function(){
		$(this).removeClass("writeIconfocus");
	});
</script>
</body>
</html>