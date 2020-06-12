<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">

<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
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
					<c:if test="${first != null }">
						
						<h1 style="font-size: 40px; ">테스트 결과</h1>
						<h2 style="text-align: center;">당신의 1등 성향은 : ${first }번 입니다!</h2>
						
						<c:if test="${first ==1 }">
							<jsp:include page="type1.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==2 }">
							<jsp:include page="type2.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==3 }">
							<jsp:include page="type3.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==4 }">
							<jsp:include page="type4.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==5 }">
							<jsp:include page="type5.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==6 }">
							<jsp:include page="type6.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==7 }">
							<jsp:include page="type7.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==8 }">
							<jsp:include page="type8.jsp"></jsp:include>
						</c:if>
						<c:if test="${first ==9 }">
							<jsp:include page="type9.jsp"></jsp:include>
						</c:if>
					
						<h2  style="text-align: center;">당신의 2등 성향은 : ${second }번 입니다!</h2>
						<h2  style="text-align: center;">당신의 3등 성향은 : ${third }번 입니다!</h2>
						
						<div class="result">
								<button><a href="/anneagram/nine_type"></a>다른 성향 <br>자세히 알아보기</a> </button>
						</div>
					</c:if>
					<c:if test="${test == null }">
						<h1>아직 테스트를 보지 않으셨군요..!</h1>
						<button><a href="/test/test">테스트 <br>하러 가기</a></button>
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