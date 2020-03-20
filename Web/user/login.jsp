<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../info/header.jsp" ></jsp:include>
	<jsp:include page="../info/banner.jsp" ></jsp:include>
	
	
	<form action="/Anneagram/AnneagramController.user" method="post">
		<fieldset>
			<legend>로그인</legend>
			<label>아이디 : </label><input type="text" name="id" placeholder="아이디"></label>
			<label>비밀번호 : <input type="text" name="pw" placeholder="비밀번호"></label>
			<input type="submit" value="로그인">
		</fieldset>
	</form>
	
	
	<jsp:include page="../info/footer.jsp"></jsp:include>
</body>
</html>