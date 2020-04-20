<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>header</h1>
	
	
	<c:if test="${login!=null }">
	<p>${login.user_id }님 환영합니다</p>
	</c:if>
				
	

	<table>
		<tr>
			<td><a href="member/login">로그인</a></td> 
			<c:choose>
				<c:when test="${login!=null }"><td><a href="/member/member_insert">마이페이지</a></td></c:when>
				<c:otherwise><td><a href="/member/member_insert">회원가입</a></td></c:otherwise>
			</c:choose>
		</tr>
	</table>
	
	<hr>
	
	
</body>
</html>