<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">

</head>
<body>
	
	<div class="container">
		<div class="header">
			<h1>
				<a class="anneagram_home" href="/"><img src="../../resources/img/anneagram.png" alt="anneagram"> 
				<span>에니어그램</span></a>
			</h1>
			
			<div class="login_info"> 
				<c:if test="${login!=null }">
					<p><Strong>${login.nickname}</Strong>님환영합니다</p>
					<a href="/member/logout">로그아웃 </a>
					<a href="/member/">마이페이지</a>
				</c:if> 
				<c:if test="${login==null }">
					<a href="/member/login">로그인 </a>
					<a href="/member/member_insert">회원가입</a>
				</c:if>
			</div>

			<div class="header_list">
				<div class="drop-down">
					<button class="first-drop-btn">에니어그램이란</button>
				</div>
				<div class="dropdown-content">
					<a href="#">에니어그램이란</a> 
					<a href="#">9가지의 유형</a> 
					<a href="#">에니어그램의 역사</a>
				</div>
				
				<div class="drop-down">
					<button class="first-drop-btn">테스트</button>
				</div>
				<div class="dropdown-content">
					<a href="#">에니어그램이란</a> 
					<a href="#">9가지의 유형</a> 
					<a href="#">에니어그램의 역사</a>
				</div>
				<div class="drop-down">
					<button class="first-drop-btn"><a href="/board/boardList">게시판</a></button>
				</div>
				<div class="dropdown-content">
					<a href="#">에니어그램이란</a> 
					<a href="#">9가지의 유형</a> 
					<a href="#">에니어그램의 역사</a>
				</div>
				<div class="drop-down">
					<button class="first-drop-btn">소식지</button>
				</div>
				<div class="dropdown-content">
					<a href="#">에니어그램이란</a> 
					<a href="#">9가지의 유형</a> 
					<a href="#">에니어그램의 역사</a>
				</div>
				<div class="drop-down">
					<button class="first-drop-btn">자료실</button>
				</div>
				<div class="dropdown-content">
					<a href="#">에니어그램이란</a> 
					<a href="#">9가지의 유형</a> 
					<a href="#">에니어그램의 역사</a>
				</div>
				
				<!-- 절대경로가 아닐경우 오류발생, 이 jsp파일은 모든파일에 공통적이게 적용되야하는 페이지라서 상대경로로하면 오류가 날 가능성이있음. 절대경로로 해야함 -->
			</div>
		</div>
	</div>

	<script src="../../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../../resources/js/bootstrap.js"></script>

</body>
</html>