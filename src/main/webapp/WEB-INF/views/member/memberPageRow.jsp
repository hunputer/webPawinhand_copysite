<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<ul class="myPage">
				<h1>마이 페이지</h1>
				<hr>
				<li>
					<h2>쇼핑정보</h2>
					<ul class="myPage-item">
						<li><a href="#">- 주문목록/배송조회</a></li>		
						<li><a href="#">- 취소/반품/교환 내역</a></li>		
						<li><a href="#">- 환불/입금 내역</a></li>		
						<li><a href="../cart/cartList">- 찜리스트</a></li>
						<li><a href="#">- 적립금</a></li>					
					</ul>
				</li>
				<li>
					<h2>회원정보</h2>
					<ul class="myPage-item">
						<li><a href="${pageContext.request.contextPath}/member/memberUpdateCheck">- 회원정보 변경</a></li>		
						<li id="member_del"><a href="${pageContext.request.contextPath}/member/memberDeleteCheck">- 회원탈퇴</a></li>			
					</ul>
				</li>
				<li>
					<h2>나의 상품문의/후기</h2>
					<ul class="myPage-item">
						<li><a href="#">- 나의 상품문의</a></li>		
						<li><a href="#">- 나의 상품후기</a></li>	
					</ul>
				</li>
			</ul>
		




</body>
</html>