<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width: 1050px; margin-bottom: 100px">
	<input id="qnaInsertbtn" type="button" class="btn btn-dark" value="Q&A 작성하기">
	<table style="margin-top: 50px" class="tableborder table table-hover">
		<tr class="qnatr">
	  		<td style="color: black">번호</td>
	  		<td style="color: black">내용</td>
	  		<td style="color: black">작성자</td>
	  		<td style="color: black">등록일자</td>
	  	</tr>
  	<c:forEach items="${lists}" var="dto">
  		<tr class="qnatr">
  			<td>${dto.qna_num}</td>
  			<td style="cursor: pointer" class="qnatitle" title="${dto.qna_num}">${dto.title}</td>
  			<td>${dto.id}</td>
  			<td>${dto.regDate}</td>
  		</tr>
  		<tr style="display: none;" id="qnacontent${dto.qna_num}">
  			<td style="padding-left : 100px" class="qnacon" colspan="5">
  			${dto.contents}<br>
  			<c:if test="${member.id == 'admin'}">
	  			<a onclick="window.open('../productQna/productQnaReplyInsert?qna_num=${dto.qna_num}','insert','width = 576, height = 373.2, top = 100, left = 200, location = no');" 
	  			style="font-size:12px;color: #007bff;cursor: pointer;">답글</a>
	  			|
  			</c:if>
  			<c:if test="${member.id == 'admin' || member.id == dto.id}">
  				<a style="font-size:12px" href="../productQna/productQnaDelete?qna_num=${dto.qna_num}&product_num=${dto.product_num}">삭제</a>
  			</c:if>
  			</td>
  		</tr>
  		<c:if test="${dto.productQnaReplyDTO != null}">
  			<tr style="display: none;background-color: #f7f8fa;text-align: center" id="qnareplycontent${dto.qna_num}" >
  				<td style="font-size:12px;color: black;vertical-align: middle">관리자</td>
  				<td colspan="2" style="vertical-align: middle">
  				<p style="margin-bottom:0px;font-size:12px;color: black">
  					${dto.productQnaReplyDTO.contents}
  					<c:if test="${member.id == 'admin'}">
  				  		<a style="font-size:12px" href="../productQna/productQnaReplyDelete?qna_num=${dto.qna_num}&product_num=${dto.product_num}">삭제</a>
  				  	</c:if>
  				</p>
  				</td>
  				<td style="font-size:12px;color: black;vertical-align: middle">${dto.productQnaReplyDTO.regDate}</td>
  			</tr>
  		</c:if>
  	</c:forEach>
  </table>
  <input type="hidden" id="tableName" value="qna">
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
  
</div>
