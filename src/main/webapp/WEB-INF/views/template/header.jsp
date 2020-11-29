<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="sub-nav">
            <c:choose>
                  <c:when test="${not empty member}">
                      <li class="sub-item">
                         <a class="sub-link" href="${pageContext.request.contextPath}/member/memberPage">마이페이지</a>
                      </li>
                     <li class="sub-item">
                        <a class="sub-link" href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
                     </li>
                     	<c:if test="${member.id eq 'admin'}">
                     	 	<li class="sub-item">
                         		<a class="sub-link" href="${pageContext.request.contextPath}/admin/adminPage">
                         		<img alt="" src="${pageContext.request.contextPath}/resources/img/common/setting.png" width="23px" height="23px">
                         		</a>
                      		</li>
                     	</c:if>
                  </c:when>
                  <c:otherwise>
                     <li class="sub-item">
                        <a class="sub-link" href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>
                     </li>
                     <li class="sub-item">
                        <a class="sub-link" href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
                     </li>
                  </c:otherwise>
            </c:choose>
			</ul>
		</div>
	
	
		<div class="col-12">
			<nav class="navbar navbar-expand-lg navbar-light">
			  <a class="navbar-brand" href="${pageContext.request.contextPath}/">
			  	<img alt="logo" src="${pageContext.request.contextPath}/resources/img/common/logo.png" width="80px">
			  	<p>PAWINHAND</p>
			  </a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
			    <ul class="navbar-nav">
			      <li class="nav-item active">
			        <a class="nav-link" href="${pageContext.request.contextPath}/intro">포인핸드 소개</a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="${pageContext.request.contextPath}/voluntary/voluntaryList">봉사</a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="${pageContext.request.contextPath}/shelter/shelterList">보호소</a>
			      </li>    
			      <li class="nav-item active">
			        <a class="nav-link" href="${pageContext.request.contextPath}/lost/lostList">신고제보</a>
			      </li>
			      <li class="nav-item active">
			      	<a class="nav-link" href="${pageContext.request.contextPath}/product/goodsList">스토어</a>
			      </li>
			      <li class="nav-item dropdown active">
			        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">공지사항</a>
			      	<div class="dropdown-menu">
			      		<a class="dropdown-item" href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
			      		<a class="dropdown-item" href="${pageContext.request.contextPath}/qna/qnaList">Q&A</a>
			      		<a class="dropdown-item" href="${pageContext.request.contextPath}/community/communityList">커뮤니티</a>
			      	</div>  
			      </li>
			    </ul>
			  </div>  
			</nav>
		</div>
	</div>
</div>
</header>
