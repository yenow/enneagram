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

<c:if test="${login.category != '관리자' }">
	<script>
		alert('관리자만 입장할수 있습니다');
		location.href='${pageContext.request.contextPath}/admin/login';
	</script>
</c:if>

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
									<h4 class="title">게시글 관리</h4>
									<p class="category">여기는 게시글을 관리 할수 있습니다</p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<th>No</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>아이디</th>
												<th>닉네임</th>
												<th>등록시간</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="b" items="${bList }">
												<tr>
													<td>${b.bno }</td>
													<td>${b.category }</td>
													<td>${b.title }</td>
													<td>${b.id }</td>
													<td>${b.nickname }</td>
													<td>${b.regdate }</td>
													<td>삭제</td>
												</tr>
											</c:forEach>
											<tr>
												<!--  style="display: flex; justify-content: center; align-content: center" -->
												<td colspan="8">
													<div style="display: flex; justify-content: center; align-content: center">
														<select class="border-rounded border-1 color-gray" id="selectBox" onchange="selectSearch(this);">
															<option class="color-gray" value="bno">게시글 번호</option>
															<option class="color-gray" value="category">카테고리</option>
															<option class="color-gray" value="title">제목</option>
															<option class="color-gray" value="id">아이디</option>
															<option class="color-gray" value="nickname">닉네임</option>
														</select>
														<input type="text" id="selectInput" name="selected-value" class="border-rounded align-self-stretch border-1 w50p" >
														<button class="btn btn-outline-secondary border-1" onclick="searchSubmit();">검색</button>
													</div>
												</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="8" class="text-center">
													<form action="${pageContext.request.contextPath}/admin/boardManage" id="pageForm" method="post" >
														<input type="hidden" name="search" value="${pageDTO.cri.search}">
														<input type="hidden" name="insertCategory" value="${pageDTO.cri.insertCategory}">
														
														<c:if test="${pageDTO.prev == true }">
															<a class="btn btn-outline-secondary btn-sm border-1" data-pageNum="${pageDTO.starPage-10}" onclick="pageSubmit(this);">&#60;</a>
														</c:if>
														<c:forEach var="p" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
															<a class="btn btn-outline-secondary btn-sm border-1" data-pageNum="${p}" onclick="pageSubmit(this);">${p }</a>
														</c:forEach>
														<c:if test="${pageDTO.next == true }">
															<a class="btn btn-outline-secondary btn-sm border-1" data-pageNum="${pageDTO.starPage+10}" onclick="pageSubmit(this);">&#60;</a>
														</c:if>
													
													</form>
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
			<jsp:include page="info/footerbar.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
	
	function selectSearch(select) {
		console.log(select);
		var insertCategory = $("#selectBox option:selected").val();
		var search = $('#selectInput').val();
		console.log(insertCategory);
		console.log(search);
		
	}
	
	function pageSubmit(data) {
	  	var page = $(data).data("pagenum");
	  	$('#pageForm').append($('<input type="hidden" value="'+page+'" name="pageNum">'));
	  	console.log(page);
	  	console.log(data);
		$('#pageForm').submit();
	}
	
	function searchSubmit() {
		var insertCategory = $("#selectBox option:selected").val();
		var search = $('#selectInput').val();
		console.log(insertCategory);
		console.log(search);
		document.location.href='${pageContext.request.contextPath}/admin/boardManage?pageNum=${pageDTO.cri.pageNum}&search='+search+'&insertCategory='+insertCategory;
	} 
	
	</script>
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