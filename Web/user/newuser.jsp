<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../info/banner.jsp" ></jsp:include>
	
	<form action="/Anneagram/newuser.user" method="post">
		<fieldset>
			<legend>회원가입</legend>
			<label>아이디 : <input type="text" name="id" placeholder="아이디"></label><br>
			<label>비밀번호 : <input type="text" name="pw" placeholder="비밀번호"></label><br>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="pw" placeholder="비밀번호 재입력"></label><br>
			<label>이름 : <input type="text" name="name" placeholder="이름"></label><br>
			<label>나이 : <input type="text" name="age" placeholder="나이"></label><br>
			<label>생일 : <input type="text" name="birthday" placeholder="생일"></label><br>
			<label>주소 : <input type="text" name="address" placeholder="주소"></label><br>
			<label>폰 번호 : <input type="text" name="pnumber" placeholder="번호"></label><br>
			비밀번호 힌트 : <select>
			<option name="" value="">제일 기억에 남는 선생님은?</option>
			<option name="" value="">제일 기억에 남는 학교는?</option>
			</select><br>
			<label> <input type="text" name="pwhint" placeholder="비밀번호 힌트"></label><br>
			<input type="submit" value="회원가입">
			
		</fieldset>
	</form>
	
	
	
	
	<jsp:include page="../info/footer.jsp"></jsp:include>
</body>
</html>