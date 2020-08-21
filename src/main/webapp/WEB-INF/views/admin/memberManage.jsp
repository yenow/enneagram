<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
									<h4 class="title">회원관리</h4>
									<p class="category">여기는 회원을 관리 할수 있습니다</p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<th>ID</th>
											<th>Name</th>
											<th>Salary</th>
											<th>Country</th>
											<th>City</th>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Dakota Rice</td>
												<td>$36,738</td>
												<td>Niger</td>
												<td>Oud-Turnhout</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Minerva Hooper</td>
												<td>$23,789</td>
												<td>CuraÃ§ao</td>
												<td>Sinaai-Waas</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Sage Rodriguez</td>
												<td>$56,142</td>
												<td>Netherlands</td>
												<td>Baileux</td>
											</tr>
											<tr>
												<td>4</td>
												<td>Philip Chaney</td>
												<td>$38,735</td>
												<td>Korea, South</td>
												<td>Overland Park</td>
											</tr>
											<tr>
												<td>5</td>
												<td>Doris Greene</td>
												<td>$63,542</td>
												<td>Malawi</td>
												<td>Feldkirchen in KÃ¤rnten</td>
											</tr>
											<tr>
												<td>6</td>
												<td>Mason Porter</td>
												<td>$78,615</td>
												<td>Chile</td>
												<td>Gloucester</td>
											</tr>
										</tbody>
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
