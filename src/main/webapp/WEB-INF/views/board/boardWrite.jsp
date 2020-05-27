<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
</html>