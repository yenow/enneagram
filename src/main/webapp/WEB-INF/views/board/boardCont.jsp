<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../info/header.jsp"></jsp:include>
	<jsp:include page="../info/banner.jsp"></jsp:include>

	<form action="boardUpdate" method="post">
		<input type="hidden" name="bno" value="${b.bno }">
		<table border="1">
			<caption>게시판 보기</caption>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${b.title }"
					readonly></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="user_id" value="${b.user_id }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">내용</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="10" cols="20" name="content"
						readonly="readonly">${b.content }</textarea></td>
			</tr>
			<c:if test="${b.user_id eq login.user_id}">
				<tr>
					<td colspan="2" style="text-align: center;">
				
					<input type="submit" value="수정">
					<a href="boardDelete?bno=${b.bno }"><input type="button" value="삭제"></a>
					</td>
				</tr>
			</c:if>
			<!-- test="${b.user_id ne login.user_id} " 이렇게 뒤에 공간이 있으면 안됨;; -->
			<c:if test="${b.user_id ne login.user_id}">
				<tr>
				<td colspan="2" style="text-align: center;"><button onclick="history.back();">뒤로가기</button></td>
				</tr>
			</c:if>
		</table>
	</form>
	
	<jsp:include page="../info/tail.jsp"></jsp:include>
</body>
</html>