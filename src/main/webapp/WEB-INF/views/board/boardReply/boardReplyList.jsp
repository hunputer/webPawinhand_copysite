<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="reply-table">
	<c:forEach items="${lists}" var="dto">
		<div>
			<c:catch>
	  			<c:forEach begin="1" end="${dto.depth}">
		  			<div class="replyEmpty">
		  				<span class="slash">>></span>
		  			</div>
	  			</c:forEach>
	  		</c:catch>
	  		<div class="replyContents">
		  		<div class="reply-title">
						<h3>${dto.writer} </h3>
						<h2>${dto.regDate}</h2>
						<div class="reply-func">
							<div title="${dto.num}" class="del">삭제</div>
							<div title="${dto.num}" class="reply">답글</div>
						</div>
				</div>
				<div class="reply-contents">
					<span>${dto.contents}</span>
				</div>
				
				<div id="reply${dto.num}"></div>
			</div>
		</div>
	</c:forEach>
</div>
<div class="reply-pager">
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