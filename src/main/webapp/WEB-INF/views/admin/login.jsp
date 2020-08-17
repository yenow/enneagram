<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>

<!-- <div class="wrapper">
	<div class="content">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<form action="">
							<h2 class="text-center">관리자 로그인</h2>
							
						</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>


</div> -->
<body class="text-center login-body">
	<div class="login-main">
	<form action="${pageContext.request.contextPath}/admin/login_ok" class="form-signin mt-5">

		<h1 class="h3 mb-3 font-weight-normal">관리자 로그인</h1>
		<label for="inputEmail" class="sr-only">관리자 아이디</label>
		<input type="email" id="inputEmail" name="id" class="form-control" placeholder="관리자 아이디" required="" autofocus="">
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" id="inputPassword" name="password" class="form-control" placeholder="비밀번호" required="">
		<div class="checkbox mb-3">
			<label> <input type="checkbox" value="remember-me"> Remember me
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		<p class="mt-5 mb-3 text-muted">© 2017-2020</p>
	</form>
	</div>
</body>

<jsp:include page="footer.jsp"></jsp:include>