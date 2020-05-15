<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">
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
				<div class="login_page">
					<div class="login_header">
						<strong>로그인</strong>
					</div>

					<div class="login_cont">
						<form action="login_ok" method="post">
							<label id="login_id">아이디 <input type="text"
								name="user_id"></label> <label id="login_pw">비밀번호 <input
								type="password" name="user_pw"></label> <input type="submit"
								value="로그인">
						</form>
					</div>

					<div class="login_footer">
						<a>회원가입</a> <a>아이디/비밀번호 찾기</a>
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