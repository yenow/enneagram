<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<div class="container">
		<div class="header">
			<h1>
				<a class="anneagram_home" href="/"><img src="../../resources/img/anneagram.png" alt="anneagram"><span>에니어그램</span></a>
			</h1>
			
			<div class="login_info"> 
				<c:if test="${login!=null }">
					<p><Strong>${login.nickname}</Strong>님환영합니다</p>
					<a href="/member/logout">로그아웃 </a>
					<a href="/member/">마이페이지</a>
				</c:if> 
				<c:if test="${login==null }">
					<a href="/member/login">로그인 </a>
					<a href="/member/member_insert">회원가입</a>
				</c:if>
			</div>
		</div>
	</div>

	<script src="../../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../../resources/js/bootstrap.js"></script>

</body>
</html>