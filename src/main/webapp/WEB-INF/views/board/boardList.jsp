<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../info/header.jsp"></jsp:include>
<jsp:include page="../info/banner.jsp"></jsp:include>
<form action="boardWrite" method="get">
	<table border="1" style="text-align: center;">
		<caption>게시판 목록</caption>
		<thead>
			<tr>
				<th>글번호</th> <th>제목</th> <th>글쓴이</th> <th>수정날짜</th>
			</tr>
		</thead>
		<c:forEach var="b" items="${blist }">
			<tr>
			<td>${b.bno }</td> <td><a href="boardCont?bno=${b.bno }">${b.title }</a></td>  <td>${b.user_id }</td>  <td>${b.regdate }</td>  
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="4"> <input type="submit" value="글쓰기"> </td>
		</tr>
	</table>
</form>
<jsp:include page="../info/tail.jsp"></jsp:include>
</body>
</html>