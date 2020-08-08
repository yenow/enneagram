<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div class="hero-wrap js-fullheight">
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>

<section class="">
	<div class="container">
		<div class="row justify-content-center content-margin text-center">
			<h2>속닥속닥</h2>
			<div class="table col-md-12 board-list">
				<ul>
					<li class="text-left"><span>[1번유형]</span>제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</li>
					<li>
						<span>작성자</span> <span>조회수</span> <span>등록일</span> <span>좋아요</span>
					</li>

				</ul>
				<ul>
					<li>제목</li>
					<li>
						<span>작성자</span> <span>조회수</span> <span>등록일</span> <span>좋아요</span>
					</li>
				</ul>
				<ul>
					<li>제목</li>
					<li>
						<span>작성자</span> <span>조회수</span> <span>등록일</span> <span>좋아요</span>
					</li>
				</ul>
			</div>

		</div>
	</div>

	<div class="row mt-5">
		<div class="col text-center">
			<div class="block-27">
				<ul>
					<li>
						<a href="#">&lt;</a>
					</li>
					<li class="active">
						<span>1</span>
					</li>
					<li>
						<a href="#">2</a>
					</li>
					<li>
						<a href="#">3</a>
					</li>
					<li>
						<a href="#">4</a>
					</li>
					<li>
						<a href="#">5</a>
					</li>
					<li>
						<a href="#">&gt;</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../info/footer.jsp"></jsp:include>


<%-- 

<body class="is-preload">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="${pageContext.request.contextPath}/board/boardList" class="logo"><strong>게시판</strong> by HTML5 UP</a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
					</ul>
				</header>

				<!-- Content -->
				<section>
				<header class="main select-header">
					<h1>게시판</h1>

					<form id="list-target" class="select-maxline" action="${pageContext.request.contextPath}/board/boardList" method="get">
						<select class="maxLine" name="maxLine" onchange="maxLineEX();" id="demo-category">
							<option value="" selected disabled>개수를 선택</option>
							<option value="10">10개</option>
							<option value="30">30개</option>
							<option value="50">50개</option>
						</select>
					</form>


				</header>


				<!-- board table -->
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>제목</th>
									<th>아이디</th>
									<th>등록날짜</th>
									<th>조회수</th>
									<th>좋아요</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="b" items="${blist }">
									<tr>
										<td><span class="board-title"><a href="boardCont?bno=${b.bno }">${b.title }</a></span></td>
										<td><span class="board-nickname">${b.nickname }</span></td>
										<td><span class="board-date">${b.s_regdate }</span></td>
										<td><span class="board-count">${b.cnt }</span></td>
										<td><span class="board-good"></span></td>
									</tr>
								</c:forEach>
							<tr>
								<td colspan="5">
									<ul class="pagination y-t-center" >
										<li><a href="boardList?startnum=${page-1}" class="button">Prev</a></li>
											<c:set var="n" value="1" />
											<c:forEach var="n" end="${count }" begin="1" step="1">
												<li><a href="boardList?startnum=${n}" class="page">${n} </a></li>
											</c:forEach>
										<li><a href="boardList?startnum=${page+1}" class="button">Next</a></li>
										<li class="y-right" style="float: right;"><a href="${pageContext.request.contextPath}/board/boardWrite" class="button">글쓰기</a></li>
									</ul>
									
								</td>
							</tr>
							</table>
					</div>
					
					<div class="y-clear"></div>
					
					<!-- 검색 폼 -->
					<form action="${pageContext.request.contextPath}/board/boardList" method="get" style="text-align: right;">
						<select class="" name="search_type" onchange="" id="" style="display: inline-block; width: 20%" >
							<option value="" selected disabled>형식</option>
							<option value="title">제목</option>
							<option value="nickname">글쓴이</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="search"  style="display: inline-block; width: 50%; "> 
						<input type="submit" value="검색"  style="display: inline-block;">
					</form>
				</section>

			</div>
		</div>
	
</body>

<script type="text/javascript">
	  function maxLineEX(){
          var submit = document.querySelector('#list-target');
          submit.submit();
	  }
</script> 


<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>



<div id="content">
	<div class="container">
		<div class="row">
			<div class="content">
				<h1>게시판 목록</h1>
				<!-- 검색기능 박스 -->
				<div class="searchBox"></div>

				<div class="boardList">
					<form id="list-target" action="boardList" method="get">
						<select class="maxLine" name="maxLine" onchange="maxLineEX();">
							<!-- onchange는 셀렉트박스에 값이 변경이 될 때마다 함수를 호출함 -->
							<option value="" selected disabled>개수를 선택</option>
							<option value="10">10개</option>
							<option value="30">30개</option>
							<option value="50">50개</option>
						</select>
						<ul>
							<li><span class="board-title">제목</span><span class="board-nickname">글쓴이</span><span class="board-date">수정날짜</span> <span class="board-count">조회수</span><span class="board-good">좋아요</span></li>

							

							<li>
								<button class="write-button" type="submit" class="write-box">
									<a href="/board/boardWrite">글쓰기</a>
								</button> <select name="search">
									<option value="" selected disabled>검색</option>
									<option value="title">제목</option>
									<option value="name">글쓴이</option>
									<option value="content">내용</option>
							</select> <input type="text" name="searchbox"> <input type="submit" value="검색">

							</li>

							<!-- 게시글 페이지번호 -->
							<li><a href="boardList?startnum=${page-1}">이전</a> <c:set var="n" value="1" /> <c:forEach var="n" end="${count }" begin="1" step="1">
									<a href="boardList?startnum=${n}">${n} </a>
								</c:forEach> <a href="boardList?startnum=${page+1}">다음</a></li>
						</ul>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>




<!-- 
<script type="text/javascript">
	  function maxLineEX(){
          var submit = document.querySelector('#list-target');
          submit.submit();
      }
      
		
</script> -->



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

						
						</tr>
					</table>
				</form>
 --> --%>