<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../c_info/header.jsp"></jsp:include>

<!-- Main -->
<div id="main">
	<div class="inner">

		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"><strong>게시판 글쓰기</strong></a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
			</ul>
		</header>

		<section>

			<div class="box">
				<form action="boardWrite_ok" method="post">
					<input type="hidden" name="user_id" value="${login.user_id }"> <input type="hidden" name="nickname" value="${login.nickname }">

					<h2 id="content">
						<input type="text" name="title" placeholder="제목">
					</h2>

					<p class="board-content">
						<textarea rows="50" cols="100" name="content" placeholder="내용"></textarea>
					<p>
					<hr>
					<p class="y-t-center">
						<input type="submit" value="등록"> 
						<input type="button" value="취소" onclick="history.back();">
					</p>
				</form>
			</div>

		</section>

	</div>
</div>

<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>





<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">
</head>

<body>
	<c:if test="${login == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다");
			location.href = '../member/login';
		</script>
	</c:if>

	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="content">
					<div class="boardWrite">
						<h1>게시판 글쓰기</h1>
	
						<form action="boardWrite_ok" method="post">
							<input type="hidden" name="user_id" value="${login.user_id }">
							<input type="hidden" name="nickname" value="${login.nickname }">
							
							<ul>
								<li><input type="text" name="title" placeholder="제목"></li>
								<li><textarea rows="50" cols="100" name="content" placeholder="내용"></textarea></li>
								<li>
								<input type="submit" value="등록"> 
								<input type="button" value="취소" onclick="history.back();">
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>
</body>
</html> --%>