<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#viewOLcontainer{
	width: 500px;
	height: 400px;
	margin-top: 20px;
	font-size: 18px;
	font-weight: bold;
}

.td1 {
	width: 150px;
	height : 40px;
	background-color: #FFEFD5;
	color: black;
	text-align: center;
	font-size: 17px;
	font-weight: bold;
}
.td2{
	color: #696969;
	font-size: 15px;
	height : 40px;
}
#payInfoBtn2 {
	width: 70px;
	height: 30px;
	background-color: orange;
	text-align: center;
	color: white;
	border: 1px solid orange;

	margin-left: 200px;
	
}
.table-bordered{
	border-left-color : white;
	border-right-color: white;
}
#total{
	font-size: 19px;
	color: #D2691E;
	font-weight: bold;
}
#isPaySpan{
	font-weight: bold;
}
</style>
</head>
<body>

	<div id='viewOLcontainer'>
	<table class="table table-bordered">
			<tr>
				<td class="td1">주문번호</td>
				<td class="td2">${list.order_num}</td>
			</tr>
			<tr>
				<td class="td1">주문일자</td>
				<td class="td2">${list.regDate}</td>
			</tr>

			<tr>
				<td class="td1">주문자명</td>
				<td class="td2">${list.toName}</td>
			</tr>
			<tr>
				<td class="td1">배송정보</td>
				<td class="td2">
					받으실 곳 : <span>${list.toAddress}<span><br>
					배송메시지 : <span>${list.addComment}<span><br>
				</td>
			</tr>

			<tr>
				<td class="td1">총 결제금액</td>
				<td class="td2">
				<span id="total">${list.total}</span> 원
				</td>
			</tr>
		</table>
		
	</div>
	<button id="payInfoBtn2" onclick="self.close();">닫기</button>
	
	<script type="text/javascript">
		
	</script>
</body>
</html>