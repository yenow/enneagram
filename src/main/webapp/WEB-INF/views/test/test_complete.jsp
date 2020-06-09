<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 여기는 음.. 배열에 있는 값들을 계산해서 너가 어떤 유형사람인지 알려주고, 간단하게 소개하는 페이지,, 그리고 자세한걸 원하면 그거 페이지로 연결하는 버튼이 있음 -->

	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

	<div id="content">
		<div class="container">
			<div class="content">
				<c:if test="${test != null }">
					
				</c:if>
				<c:if test="${test == null }">
					
				</c:if>
			</div>
		</div>
	</div>

	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>
	
</body>
</html>