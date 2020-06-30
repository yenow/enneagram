<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<!-- /부트스트랩 -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" /></noscript>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/n_style.css" >


</head>
<body>

	<header id="header">
		<h1>Anneagram</h1>
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/anneagram/anneagram">Introduce</a></li>
				<li><a href="#one">Test</a></li>
				<li><a href="#two">Board</a></li>
				<li><a href="#work"><buttontype="button" class="btn btn-secondary">로그인</button></a></li>
				<li><a href="#contact"><buttontype="button" class="btn btn-secondary">회원가입</button></a></li>
			</ul>
		</nav>
	</header>