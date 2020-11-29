<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!Doctype html>
<html>
<head>
<c:import url="./template/bootStrap.jsp"></c:import>	

<title>Project</title>

<style type="text/css">
	#index_textbox{
		width:100%;
		height: 630px;
		margin-bottom: 50px;
		background-color: #ffcc80;
		background-image: url("./resources/img/common/main-img01.jpg");
		background-size: cover;
		position: relative;
	}
	#index_textbox h1{
		font-size: 4.8em;
		font-weight: 600;
		color: white;
	}
	#index_textbox h2{
		font-size: 2.3em;
		font-weight: 500;
		color: white;
	}
	#index_textbox_layer{
		text-align: center;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		background-color: rgba(255, 184, 66, 0.7);
   	 	position: absolute;
   	 	top: 0;
   	 	left: 0;
    	width: 100%;
   		height: 100%;
	}
</style>

</head>
<body>
<c:import url="./template/header.jsp"></c:import>	


<section class="shelter" style="width: 100%">
	<div class="container">
		<div class="row">
			<div id="index_textbox" class="col-12">
			 <div id="index_textbox_layer">
			 	<h1>Adopt Animals</h1>
				<h1 style="margin-top: -13px;">Adopt Family</h1><br><br>
				
				<h2>포인핸드는 사지 않고 입양하는 문화를 만듭니다.</h2>
			 </div>
			</div>
			
			<div class="col-12 title">
				<h1>ADOPT!!</h1>
				<h2>입양해주세요</h2>
			</div>
			
			<div class="col-12 col-md-4 sl" >
				<a href="#">
					<img alt="pet image" src="${pageContext.request.contextPath}/resources/img/common/p1.jpg">
					<p>배수관에 빠져 울고있던 새끼 고양이 #양옹이</p>
				</a>
			</div>
			<div class="col-12 col-md-4 sl">
				<a href="#">
					<img alt="pet image" src="${pageContext.request.contextPath}/resources/img/common/p2.jpg">
					<p>차도에서 도망가지 못하던 새끼 고양이 #요미</p>
				</a>
			</div>
			<div class="col-12 col-md-4 sl">
				<a href="#" class="">
					<img alt="pet image" src="${pageContext.request.contextPath}/resources/img/common/p3.jpg">
					<p>보호자 건강악화로 새가족을 찾는 #쿠키</p>
				</a>
			</div>
			<div class="col-12 col-md-4 sl" >
				<a href="#">
					<img alt="pet image" src="${pageContext.request.contextPath}/resources/img/common/p4.jpg">
					<p>보호소의 외톨이 개 #클로버</p>
				</a>
			</div>
			<div class="col-12 col-md-4 sl">
				<a href="#">
					<img alt="pet image" src="${pageContext.request.contextPath}/resources/img/common/p5.jpg">
					<p>늘 기회에서 밀려나던 #바비</p>
				</a>
			</div>
			<div class="col-12 col-md-4 sl">
				<a href="#" class="">
					<img alt="pet image" src="${pageContext.request.contextPath}/resources/img/common/p6.jpg">
					<p>고양시 불법 번식장에서 구조한 26마리 개</p>
				</a>
			</div>
			</div>
	</div>	
</section>

  </body>
</html>
</body>
</html>

