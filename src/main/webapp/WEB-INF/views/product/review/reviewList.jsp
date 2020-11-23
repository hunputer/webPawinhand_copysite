<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<div style="width: 1050px; margin-bottom: 100px">
		<form id="reviewform" action="../review/reviewInsert" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${member.id}">
			<input type="hidden" name="product_num" value="${num}">
			<div>
				<textarea name="contents" id="reviewText" style="width:1050px;height:100px">후기를 작성하세요!</textarea>
			</div> 
			<div>
				<input id="reviewfile" type="file" name="file"><input style="float: right;" id="reviewbnt" type="button" value="리뷰등록">
			</div>
		</form>
	</div>
	
	<input type="hidden" id="tableName" value="review">
	
  	<c:forEach items="${lists}" var="dto">
  		<div style="margin-bottom: 20px">
  			<div style="width: 1110px;">
	  			<span style="font-size: 10px">${dto.contents}</span>
	  			<div style="float: right;width: 200px;padding-left:20px">
		  			<h3 style="font-size: 5px; color: gray;">작성자</h3>
		  			<h3 style="font-size: 5px">${dto.id}</h3>
	  			</div>
	  		</div>
	  		<c:if test="${dto.fileName != null}">
	  		<div>
	  			<img src="../resources/img/upload/product/review/${dto.fileName}" width="270" height="270" alt="">
	  		</div>
	  		</c:if>
	  		<c:if test="${member.id == 'admin' || member.id == dto.id}">
	  			<a style="font-size: 5px" href="../review/reviewDelete?review_num=${dto.review_num}&product_num=${dto.product_num}">글삭제</a>
	  		</c:if>
  		</div>
  		<hr>
  	</c:forEach>
  	
  	<div style="text-align: center" class="pager">
  	<c:if test="${pager.startNum gt 1}">
  		 <span class="c1" title="${pager.startNum-1}">[이전]</span>
    </c:if>
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<span class="c1" title="${i}">${i}</span>
  	</c:forEach>
  	
  	<c:if test="${pager.nextCheck}">
  		<span class="c1" title="${pager.lastNum+1}">[다음]</span>
  	</c:if>
  </div>

