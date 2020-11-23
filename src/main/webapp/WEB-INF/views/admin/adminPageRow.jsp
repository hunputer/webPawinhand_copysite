<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<ul class="myPage">
				<h1>관리자 페이지</h1>
				<hr>
				<li>
					<h2>쇼핑정보</h2>
					<ul class="myPage-item">
						<li><a href="${pageContext.request.contextPath}/admin/adminPage">- 재고 현황</a></li>
						<li><a href="#">- 주문목록/배송조회</a></li>		
						<li><a href="#">- 취소/반품/교환 내역</a></li>		
						<li><a href="#">- 환불/입금 내역</a></li>		
					</ul>
				</li>
				<li>
					<h2>회원정보</h2>
					<ul class="myPage-item">
						<li><a href="${pageContext.request.contextPath}/member/memberUpdateCheck">- 회원정보 변경</a></li>	
						<li><a href="${pageContext.request.contextPath}/admin/admin_memberList">- 회원관리</a></li>		
					</ul>
				</li>
				<li>
					<h2>상품문의/후기</h2>
					<ul class="myPage-item">
						<li><a href="${pageContext.request.contextPath}/admin/admin_qnaList">- 상품문의</a></li>		
						<li><a href="${pageContext.request.contextPath}/admin/admin_reviewList">- 상품후기</a></li>	
					</ul>
				</li>
			</ul>
		




</body>
</html>