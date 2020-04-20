<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<jsp:include page="info/header.jsp"></jsp:include>  <%--이거는 .jsp를 붙여줘야 하네?? / 매핑경로를 사용하는게 아니라 실제 경로를 사용하는듯 --%>
<%-- jstl를 사용, 외부 경로도 가능, 느낌상 매핑경로도 이용가능하다는 느낌 <c:import url="/info/header"></c:import> --%>

<a href="">에니어그램 소개</a><br>
<a href="">테스트</a><br>
<a href="board/boardList">게시판</a><br>
<a href="">9가지 유형</a><br>


</body>
</html>
