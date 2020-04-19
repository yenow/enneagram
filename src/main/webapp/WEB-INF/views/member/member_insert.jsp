<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="member_insert_ok" method="post">
	<table>
		<caption>회원가입 양식</caption>
		<tr>
			<td>아이디</td> <td><input type="text" name="user_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td> <td><input type="password" name="user_pw"></td>
		</tr>
		<tr>
			<td>이름</td> <td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>닉네임</td> <td><input type="text" name="nickname"></td>
		</tr>
		<tr>
			<td>번호</td> <td><input type="tel" name="tel"></td>
		</tr>
		<tr>
			<td>이메일</td> <td><input type="email" name="email"></td>
		</tr>
		<tr>
			<td>주소</td> <td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="제출"><input type="button" value="이전"></td>
		</tr>
		
	</table>
</form>
</body>
</html>