<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td><a href="">에니어그램이란</a></td>

			<td><a href="">성격 테스트</a></td>

			<td>
				<a href="/board/boardList">게시판</a>    <!-- 절대경로가 아닐경우 오류발생, 이 jsp파일은 모든파일에 공통적이게 적용되야하는 페이지라서 상대경로로하면 오류가 날 가능성이있음. 절대경로로 해야함 -->
			</td>

			<td>
				<a href="">소식지</a>
			</td>
			
			<td>
				<a href="">자료실</a>
			</td>

		</tr>
	</table>
	<hr>
</body>

</html>