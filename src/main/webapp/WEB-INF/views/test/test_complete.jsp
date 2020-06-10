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
				<div class="test-complete">
					<h2> 테스트 결과 입니다 </h2>
					
					<c:if test="${test != null }">
						
						<h1>당신의 성향은 : ${first }번 입니다!</h1>
						<button><a href="/anneagram/nine_type">좀 더 <br>자세히 알아보기</a> </button>
						<div class="result">
							
						</div>
					</c:if>
					<c:if test="${test == null }">
						<h1>아직 테스트를 보지 않으셨군요..!</h1>
						<button><a href="/test/test">테스트 보러 가기</a></button>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>
	
</body>
</html>