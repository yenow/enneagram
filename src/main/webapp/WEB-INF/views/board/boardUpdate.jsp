<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
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
				<c:if test="${login == null }">
					<script type="text/javascript">
						alert("로그인이 필요합니다");
						location.href = '../member/login';
					</script>
				</c:if>


				<form action="boardUpdate_ok" method="post">
					<input type="hidden" name="bno" value="${b.bno }">
					<table border="1">
						<caption>게시판 수정</caption>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="${b.title }"></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td><input type="text" name="user_id" value="${b.user_id }"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td><p>${b.cnt}</p></td>
						</tr>
						<tr>
							<td>등록일</td>
							<td><p>${b.regdate}></p></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea rows="10" cols="20" name="content"> ${b.content }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><input
								type="submit" value="등록"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>
</body>
</html>