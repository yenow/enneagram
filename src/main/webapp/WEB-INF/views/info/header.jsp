<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>enneagram</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mycss.css">

<!-- 이건 차트 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">Enneagram</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a href="${pageContext.request.contextPath}" class="nav-link">Home</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/test/test" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Test</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/test">Test</a> 
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/test_complete">결과</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/enneagram/enneagram" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">에니어그램</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=enneagram">에니어그램</a> 
							<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=history">역사</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=eclass">분류</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=type">9가지 유형</a>
						</div>
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/board/boardList" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList?category=공지사항">공지사항</a> 
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList?category=속닥속닥">속닥속닥</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList?category=자료실">자료실</a>
						</div>
					</li>
						
					<li class="nav-item">
						<a href="#" class="nav-link">실시간 채팅</a>
					</li>

					<!-- 비로그인시 -->
					<c:if test="${login eq null }">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/member/member_insert" class="nav-link"> <span>회원가입</span></a>
						</li>
						<li class="nav-item cta">
							<a href="${pageContext.request.contextPath}/member/login" class="nav-link"> <span>로그인</span></a>
						</li>
						
					</c:if>
					<!-- 로그인시 -->
					<c:if test="${login ne null }">
					
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/member/mytype" class="nav-link"> <span>마이페이지</span></a>
						</li>
						<li class="nav-item cta">
							<a href="${pageContext.request.contextPath}/member/logout" class="nav-link"> <span>로그아웃</span></a>
						</li>
						
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
