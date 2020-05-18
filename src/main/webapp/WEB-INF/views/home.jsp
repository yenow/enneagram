<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>에니어그램</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css?after ">
<link rel="stylesheet" href="../resources/css/style.css?after ">
</head>
<body>
	<%-- <h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P> --%>


	<%-- <jsp:include page="info/header.jsp"></jsp:include> 이거는 .jsp를 붙여줘야 하네?? / 매핑경로를 사용하는게 아니라 실제 경로를 사용하는듯 --%>
	<%-- jstl를 사용, 외부 경로도 가능, 느낌상 매핑경로도 이용가능하다는 느낌 <c:import url="/info/header"></c:import> --%>
	<%-- 그중에 가장 많이 쓰이는 Tag인 <jsp:include /> 하지만 이 <jsp:include /> Tag의 단점은 원격지의 JSP 페이지를 include 할 수 없는데 있다.

출처: https://yongblog.tistory.com/entry/jspinclude-와-include-차이 [개발 그리고 너] --%>
	
	<%-- ${pageContext.request.contextPath} --%>
	<div id="header">
		<jsp:include page="info/header.jsp"></jsp:include>
	</div>
	
	<div id="banner">
		<jsp:include page="info/banner.jsp"></jsp:include>
	</div>
	
	<div id="content">
		<jsp:include page="info/content.jsp"></jsp:include>
	</div>
	
	<div id="tail">
		<jsp:include page="info/tail.jsp"></jsp:include>
	</div>


	<script src="../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
</body>
</html>
