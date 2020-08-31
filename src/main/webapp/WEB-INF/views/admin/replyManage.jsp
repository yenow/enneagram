<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Light Bootstrap Dashboard by Creative Tim</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<!-- Animation library for notifications   -->
<link href="../resources/assets/css/animate.min.css" rel="stylesheet" />
<!--  Light Bootstrap Table core CSS    -->
<link href="../resources/assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../resources/assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="../resources/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="../resources/assets/css/myStyle.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
		<jsp:include page="info/sidebar.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="info/navbar.jsp"></jsp:include>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">댓글 관리</h4>
									<p class="category">여기는 댓글을 관리 할수 있습니다</p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<th>댓글번호</th>
												<th>게시물번호</th>
												<th>회원번호</th>
												<th colspan="3">내용</th>
												<th>이름</th>
												<th>등록시간</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="r" items="${rList }">
												<tr>
													<td>${r.rno }</td>
													<td>${r.bno }</td>
													<td>${r.mno }</td>
													<td colspan="3">${r.content }</td>
													<td>${r.rname }</td>
													<td>${r.regdate }</td>
													<th>삭제</th>
												</tr>
											</c:forEach>
											<tr>
												<!--  style="display: flex; justify-content: center; align-content: center" -->
												<td colspan="10">
													<div style="display: flex; justify-content: center; align-content: center">
														<select class="border-rounded border-1 color-gray" >
															<option class="color-gray">no</option>
															<option class="color-gray">아이디</option>
															<option class="color-gray">비밀번호</option>
															<option class="color-gray">이름</option>
															<option class="color-gray">닉네임</option>
															<option class="color-gray">이메일</option>
															<option class="color-gray">전화번호</option>
														</select>
														<input type="text" class="border-rounded align-self-stretch border-1 w50p" >
														<button class="btn btn-outline-secondary border-1">검색</button>
													</div>
												</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="10" class="text-center">
													<!-- 이전페이지 10개 -->
													<button class="btn btn-outline-secondary btn-sm border-1">&#60;</button>
													<c:forEach var="p" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
														<button class="btn btn-outline-secondary btn-sm border-1" >${p}</button>
													</c:forEach>
													<!-- 다음페이지 10개 -->
													<button class="btn btn-outline-secondary btn-sm border-1" >&#62;</button>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li>
								<a href="#"> Home </a>
							</li>
							<li>
								<a href="#"> Company </a>
							</li>
							<li>
								<a href="#"> Portfolio </a>
							</li>
							<li>
								<a href="#"> Blog </a>
							</li>
						</ul>
					</nav>
					<p class="copyright pull-right">
						&copy;
						<script>document.write(new Date().getFullYear())</script>
						<a href="http://www.creative-tim.com">Creative Tim</a>
						, made with love for a better web
					</p>
				</div>
			</footer>
		</div>
	</div>
</body>
<!--   Core JS Files   -->
<script src="../resources/assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="../resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="../resources/assets/js/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../resources/assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="../resources/assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>
<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="../resources/assets/js/demo.js"></script>
</html>