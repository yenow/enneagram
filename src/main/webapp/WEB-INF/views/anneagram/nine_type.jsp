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
			<div class="blank"></div>
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
					<li><a href="#"></a>1유형</li>
					<li><a href="#"></a>2유형</li>
					<li><a href="#"></a>3유형</li>
					<li><a href="#"></a>4유형</li>
					<li><a href="#"></a>5유형</li>
					<li><a href="#"></a>6유형</li>
					<li><a href="#"></a>7유형</li>	
					<li><a href="#"></a>8유형</li>
					<li><a href="#"></a>9유형</li>
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