<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.css">
</head>
<body>
	<c:if test="${login!=null }">
		<p>${login.user_id }님환영합니다</p>
	</c:if>

	<table>
		<tr>
			<td><a href="/">홈페이지</a></td>


			<c:if test="${login!=null }">
				<td><a href="/member/logout">로그아웃</a></td>
				<td><a href="/member/">마이페이지</a></td>
				<!-- 미완성 -->
			</c:if>
			<c:if test="${login==null }">
				<td><a href="/member/login">로그인</a></td>
				<td><a href="/member/member_insert">회원가입</a></td>
			</c:if>


		</tr>
	</table>

	<hr>

	<button class="btn btn-info">테스트</button>

	<script src="../../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../../resources/js/bootstrap.js"></script>

</body>
</html>