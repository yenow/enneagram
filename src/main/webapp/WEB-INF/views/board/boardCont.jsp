<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../info/header.jsp"></jsp:include>
	<jsp:include page="../info/banner.jsp"></jsp:include>
	
	<form action="boardUpdate" method="post">
		
		<table border="1">
			<caption>게시판 보기</caption>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${b.title }"
					readonly></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="user_id" value="${b.user_id }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;" readonly>내용</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="10" cols="20" name="content">${b.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<input type="submit" value="수정"></a> <input type="button" value="삭제"> </td>
			</tr>
		</table>
	</form>

</body>
</html>