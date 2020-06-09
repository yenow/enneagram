<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>에니어그램</title>
<script src="../resources/js/jquery.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.css?after ">
<link rel="stylesheet" href="../resources/css/style.css?after ">
<link rel="stylesheet" href="../resources/css/reset.css?after">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
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
	
	<div id="content2">
			<div>성격으로 문을 열수는 있으나 품성만이 열린문을 그대로 유지할 수 있다.</div>
			<div>에니어 그램은 성격을 9가지 유형으로 구분합니다.</br> 이는 획일해 놓은것이 아니라 아홉가지의 문으로, 그 문을 통과해 내면의 여행을 떠나봅시다</div>
		
	</div>
	
	<div id="tail">
		<jsp:include page="info/tail.jsp"></jsp:include>
	</div>

</body>
</html>
