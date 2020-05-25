<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="content">
				<div class="test-notice">
					<div class="notice1">
						<p> 총 검사 시간은 12분 내외입니다</p>
					</div>
					<div class="notice2">
						<p> 질문이 기분 나쁘더라도 이해해주세요</p>
					</div>
					<div class="notice3">
						<p> 보통은 웬만하면 기피해주세요</p>
					</div>
					</div>
				</div>
			<div class="test">
				<form action="/test/test1">
					<input type="hidden" name="number11" value="">
					<ul>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number1" value="1">
							<input type="radio" name="number1" value="2">
							<input type="radio" name="number1" value="3">
							<input type="radio" name="number1" value="4">
							<input type="radio" name="number1" value="5">
							</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number2" value="1">
							<input type="radio" name="number2" value="2">
							<input type="radio" name="number2" value="3">
							<input type="radio" name="number2" value="4">
							<input type="radio" name="number2" value="5">
						</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number3" value="1">
							<input type="radio" name="number3" value="2">
							<input type="radio" name="number3" value="3">
							<input type="radio" name="number3" value="4">
							<input type="radio" name="number3" value="5">
						</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number4" value="1">
							<input type="radio" name="number4" value="2">
							<input type="radio" name="number4" value="3">
							<input type="radio" name="number4" value="4">
							<input type="radio" name="number4" value="5">
						</li>
					    <li>
					    <h3>질문1</h3>	
							<input type="radio" name="number5" value="1">
							<input type="radio" name="number5" value="2">
							<input type="radio" name="number5" value="3">
							<input type="radio" name="number5" value="4">
							<input type="radio" name="number5" value="5">
						</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number6" value="1">
							<input type="radio" name="number6" value="2">
							<input type="radio" name="number6" value="3">
							<input type="radio" name="number6" value="4">
							<input type="radio" name="number6" value="5">
						</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number7" value="1">
							<input type="radio" name="number7" value="2">
							<input type="radio" name="number7" value="3">
							<input type="radio" name="number7" value="4">
							<input type="radio" name="number7" value="5">
						</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number8" value="1">
							<input type="radio" name="number8" value="2">
							<input type="radio" name="number8" value="3">
							<input type="radio" name="number8" value="4">
							<input type="radio" name="number8" value="5">
						</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number9" value="1">
							<input type="radio" name="number9" value="2">
							<input type="radio" name="number9" value="3">
							<input type="radio" name="number9" value="4">
							<input type="radio" name="number9" value="5">
						</li>
						<li>
							<h3>질문1</h3>
							<input type="radio" name="number10" value="1">
							<input type="radio" name="number10" value="2">
							<input type="radio" name="number10" value="3">
							<input type="radio" name="number10" value="4">
							<input type="radio" name="number10" value="5">
						</li>
						<li><input type="submit" value="제출" onclick=""></li>
					</ul>
				</form>
			</div>
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