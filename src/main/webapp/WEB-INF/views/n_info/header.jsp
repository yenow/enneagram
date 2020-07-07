<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>




</head>
<body>

	<header id="header">
		<h1>Enneagram</h1>
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/anneagram/anneagram">Introduce</a></li>
				<li><a href="${pageContext.request.contextPath}/test/test">Test</a></li>
				<li><a href="${pageContext.request.contextPath}/board/boardList">Board</a></li>
				<c:if test="${login ne null }">
					<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					<li><a href="#">회원정보</a></li>
				</c:if>
				<c:if test="${login eq null }">
					<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/member/member_insert">회원가입</a></li>
				</c:if>
			</ul>
		</nav>
	</header>