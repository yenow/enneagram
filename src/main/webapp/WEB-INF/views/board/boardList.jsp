<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../resources/js/jquery.js"></script>

<link rel="stylesheet" href="../../resources/css/style.css">
<link rel="stylesheet" href="../../resources/css/reset.css">

</head>
<body>
	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

	<div id="select"></div>

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="content">
					<h1>게시판 목록</h1>
					<!-- 검색기능 박스 -->
					<div class="searchBox"></div>

					<div class="boardList">
						<form id="list-target" action="boardList" method="get">
							<select class="maxLine" name="maxLine" onchange="maxLineEX();">   <!-- onchange는 셀렉트박스에 값이 변경이 될 때마다 함수를 호출함 -->
										<option value="" selected disabled>개수를 선택</option> 
									    <option value="10">10개</option>
									    <option value="30">30개</option>
									    <option value="50">50개</option>
  							</select>
							<ul>
								<li><span class="board-title">제목</span><span
									class="board-nickname">글쓴이</span><span class="board-date">수정날짜</span>
									<span class="board-count">조회수</span><span class="board-good">좋아요</span></li>

								<!-- 게시물 내용 반복 -->
								<c:forEach var="b" items="${blist }">
									<li><span class="board-title"><a
											href="boardCont?bno=${b.bno }">${b.title }</a></span><span
										class="board-nickname">${b.nickname }</span> <span
										class="board-date">${b.regdate }</span> <span
										class="board-count">${b.cnt }</span><span class="board-good"></span></li>
								</c:forEach>
								
								<li>
									<button class="write-button" type="submit" class="write-box"><a href="/board/boardWrite">글쓰기</a></button>
									<select name="search" >
										<option value="" selected disabled>검색</option> 
									    <option value="title">제목</option>
									    <option value="name">글쓴이</option>
									    <option value="content">내용</option>
  									</select>
  									<input type="text" name="searchbox"> <input type="submit" value="검색">
									
								</li>
								
								<!-- 게시글 페이지번호 -->
								<li>
								<a href="boardList?startnum=${page-1}">이전</a>
								<c:set var="n" value="1" /> 
								<c:forEach var="n" end="${count }" begin="1" step="1">
									<a href="boardList?startnum=${n}">${n} </a>
								</c:forEach>
								<a href="boardList?startnum=${page+1}">다음</a>
								</li>
							</ul>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>

	
	<script type="text/javascript">
	  function maxLineEX(){
          var submit = document.querySelector('#list-target');
          submit.submit();
      }
      
		
	</script>
	
</body>
</html>

<!-- 
<form action="boardWrite" method="get">
					<table border="1" style="text-align: center;">
						<caption>게시판 목록</caption>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>수정날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<c:forEach var="b" items="${blist }">
							<tr>
								<td>${b.bno }</td>
								<td><a href="boardCont?bno=${b.bno }">${b.title }</a></td>
								<td>${b.user_id }</td>
								<td>${b.regdate }</td>
								<td>${b.cnt }</td>
							</tr>
						</c:forEach>

						<td colspan="5"><a href="boardList?startnum=${page-1}">이전</a>
							<c:set var="n" value="1" /> <c:forEach var="n" end="${count }"
								begin="1" step="1">
								<a href="boardList?startnum=${n}">${n} </a>
							</c:forEach> <a href="boardList?startnum=${page+1}">다음</a> <input
							type="submit" value="글쓰기"></td>
						</tr>
					</table>
				</form>
 -->