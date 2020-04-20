<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login_ok" method="post">
	<table>
		<caption>로그인</caption>
		<tr>
			<th>아이디</th> <td><input type="text" name="user_id"></td> <td rowspan="2"><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<th>비밀번호</th> <td><input type="text" name="user_pw"></td>
		</tr>
	</table>
</form>
  
</body>
</html>