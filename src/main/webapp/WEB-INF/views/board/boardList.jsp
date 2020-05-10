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
			
			<%-- <a href="board/boardList?startnum="${page-1}>이전</a> --%>
			<c:set var="n" value="1" />
			<c:forEach var="n" end="${count }" begin="1" step="1">
				<a href="boardList?startnum="${n}>${n} </a>
			</c:forEach>
			
			<%-- <a href="board/boardList?startnum="${page+1}>다음</a>  --%>
			<td colspan="4"> 
				<a href="boardList?startnum=${page-1}">이전</a>
				<c:set var="n" value="1" />
				<c:forEach var="n" end="${count }" begin="1" step="1">
					<a href="boardList?startnum=${n}">${n} </a>
				</c:forEach>
				<a href="boardList?startnum=${page+1}">다음</a>
				<input type="submit" value="글쓰기"> 
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../info/tail.jsp"></jsp:include>
</body>
</html>