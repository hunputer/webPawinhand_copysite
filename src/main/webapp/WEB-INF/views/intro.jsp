<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/bootStrap.jsp"></c:import>
<style type="text/css">
	#introContainer{
		width : 1100px;
		height : 2000px;
		margin : 30px auto 50px;
		
	}
	
	.introHeader{
		width : 400px;
		height: 140px;
		margin-right : 300px;
	}
.introHeader > #hdiv1{
	width: 400px;
	height: 100px;
	font-size: 50px;
	line-height: 130px;
	text-align: center;

}
.introHeader > #hdiv2{
	width: 400px;
	height: 40px;
	text-align: center;
}	
.introbar{
	width: 150px;
	height: 20px;
	background-color: #FF8C00;
	margin: 50px auto 50px;;
	border-radius: 6px;
	
}
.introCon{
	width: 700px;
	height: 200px;
	margin: 0 auto;
	text-align: center;
	font-size: 30px;
}
.introCon2{
	width: 500px;
	height: 200px;
	margin: 40px auto 0px;
	text-align: center;
	font-size: 30px;
}
.introCon2 >.con2div1{
	width: 500px;
	height: 70px;
	font-size: 20px;
	color: black;
	text-align: center;
}

.introCon2 > .con2div2{
	width: 500px;
	height: 100px;
	font-size: 15px;
	text-align: center;
	color: #D3D3D3;
	
}
.introCon3{
	width: 700px;
	height: 400px;
	margin: 0 auto;
	text-align: center;

}
.introCon3 > img{
	width: 700px;
	height: 400px;
}
.introCon{
	width: 700px;
	height: 200px;
	margin: 0 auto;
	text-align: center;
	font-size: 30px;
}

.introCon3 >.con2div1{
	width: 700px;
	height: 60px;
	font-size: 17px;
	color: black;
	text-align: left;
}

.introCon3 > .con2div2{
	width: 700px;
	height: 100px;
	font-size: 14px;
	text-align: left;
	color: #D3D3D3;
	
}
</style>

</head>

<body>
	<c:import url="./template/header.jsp"></c:import>
	
	<div id="introContainer">
		
		<div class="introHeader">
			<div id="hdiv1">포인핸드 소개</div>
			<div id="hdiv2">A B O U T      P A W I N H A N D</div>
		</div>
		
		<div class="introbar"></div>
		
		<div class="introCon">
			포인핸드는<br>
			사지않고 입양하는 문화를 만듭니다.
		</div>
		
		
		
		<div class="introCon2">
			<div class="con2div1">
			매년 전국적으로 10만 마리 이상의 유기동물들이<br>
			보호소로 구조되고 있습니다.
			</div>
			<div class="con2div2">
			안타깝게도 이 중 절반에 가까운 동물들은 다시 가족을 만나지 못하고<br>
			안락사되거나 자연사하고 있습니다.
			</div>
		</div>
		
		<div class="introbar"></div>
		
		<div class="introCon">
			포인핸드는 매년 1만 마리 이상의 유기동물들에게<br>
			소중한 가족을 찾아주고 있습니다.
		</div>
		
		<div class="introbar"></div>
		
		<div class="introCon">
			포인핸드는 잊혀져가는 유기동물들을 세상에 알리고<br>
			소중한 가족을 찾아주는 플랫폼 입니다.
		</div>
		
		<div class="introCon3">
			<img  src="${pageContext.request.contextPath}/resources/img/common/intro_logo.PNG">
		</div>
		

		<div class="introCon3">
			<div class="con2div1">
			전국 유기동물 보호소에 구조된 유기동물들의 입양을 도와주는 '포인핸드'는 제품 판매 수익의 50%<br>
			(영업이익 기준)를 유기동물을 구조하여 입양까지 보내는 '입양카페'에 물품으로 후원하고 있습니다.
			</div>
			<div class="con2div2">
			또한 입양된 유기동물들의 건강검진을 지원함으로써 입양 후 건강하고 행복하게 지낼 수 있는 환경을 만들어가고 있습니다.<br>
			포인핸드가 만들어가는 사지 않고 입양하는 문화에 여러분도 함께해주세요.
			</div>
		</div>
		
		
	</div>
	
</body>

</html>