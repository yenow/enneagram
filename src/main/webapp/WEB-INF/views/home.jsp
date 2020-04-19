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

<%-- <jsp:include page="/info/header"></jsp:include> 풀리지 않는 숙제 --%>
<c:import url="/info/header"></c:import>

<a href="">에니어그램 소개</a><br>
<a href="">테스트</a><br>
<a href="">게시판</a><br>
<a href="">9가지 유형</a><br>


</body>
</html>
