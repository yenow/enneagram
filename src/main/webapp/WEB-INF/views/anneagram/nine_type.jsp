<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>9가지의 유형</title>

<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">

<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

</head>
<body>
	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

	<div id="content">
		<div class="container">
			
			<div class="content2">
				<ul>
					<li><a href="/anneagram/anneagram">에니어그램이란</a></li>
					<li class="anneagram-nav"><a href="/anneagram/nine_type">9가지의 유형</a></li>
					<li><a href="/anneagram/history">에니어그램의 역사</a></li>
				</ul>
			</div>
			<div class="content3">
				<h2>9가지의 유형</h2>
				<ul>
					<li><a href="/anneagram/1_type"><img alt="1유형" src="../../resources/img/mytype1.png"></a></li>
					<li><a href="/anneagram/2_type"><img alt="2유형" src="../../resources/img/mytype2.png"></a></li>
					<li><a href="#"><img alt="3유형" src="../../resources/img/mytype3.png"></a></li>
					<li><a href="#"><img alt="4유형" src="../../resources/img/mytype4.png"></a></li>
					<li><a href="#"><img alt="5유형" src="../../resources/img/mytype5.png"></a></li>
					<li><a href="#"><img alt="6유형" src="../../resources/img/mytype6.png"></a></li>
					<li><a href="#"><img alt="7유형" src="../../resources/img/mytype7.png"></a></li>	
					<li><a href="#"><img alt="8유형" src="../../resources/img/mytype8.png"></a></li>
					<li><a href="#"><img alt="9유형" src="../../resources/img/mytype9.png"></a></li>
				</ul>
			</div>
		</div>
	</div>


	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>

	<script src="../../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../../resources/js/bootstrap.js"></script>
</body>
</html>