<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<!-- <div class="js-fullheight"> -->
<div class="hero-wrap js-fullheight">
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>

<section class="">
	<div class="container">
		<div class="my-5 text-center">
			
			<h2>개인정보수정</h2>
			
		</div>
		<div class="row mb-5">
			<div class="col-md-12 order-md-1">
				<h4 class="mb-3">나의 정보</h4>
				<form action="${pageContext.request.contextPath}/member/member_info_update_ok" method="post" class="needs-validation">
					
					<!-- 아이디 -->
					<div class="mb-3">
						<label for="username">아이디</label>
						<div class="input-group">
							<input type="text" class="form-control" id="id" name="id" value="${login.id }" placeholder="아이디" readonly="readonly">
							<div class="invalid-feedback" style="width: 100%;">이건 뭐하는 태그</div>
						</div>
					</div>
					
					<!-- 패스워드 -->
					<div class="mb-3">
						<label for="username">비밀번호</label>
						<div class="input-group">
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 확인">
							<div class="invalid-feedback" style="width: 100%;">이건 뭐하는 태그</div>
						</div>
					</div>
					
					<!-- 패스워드확인 -->
					<div class="mb-3">
						<label for="username">패스워드</label>
						<div class="input-group">
							<input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
							<div class="invalid-feedback" style="width: 100%;">이건 뭐하는 태그</div>
						</div>
					</div>
					
					<!-- 이름 -->
					<div class="mb-3">
						<label for="username">이름</label>
						<div class="input-group">
							<input type="text" class="form-control" id="name" name="name" value="${login.name }" placeholder="이름" readonly="readonly">
							<div class="invalid-feedback" style="width: 100%;">이건 뭐하는 태그</div>
						</div>
					</div>
					
					<!-- 닉네임 -->
					<div class="mb-3">
						<label for="username">닉네임</label>
						<div class="input-group">
							<input type="text" class="form-control" id="username" name="nickname" value="${login.nickname }" placeholder="닉네임" >
							<div class="invalid-feedback" style="width: 100%;">이건 뭐하는 태그</div>
						</div>
					</div>
					
					<!-- 이메일 -->
					<div class="mb-3">
						<label for="username">이메일</label>
						<div class="input-group">
							<input type="email" class="form-control" id="email" name="email" value="${login.email }" placeholder="이메일">
							<div class="invalid-feedback" style="width: 100%;">이건 뭐하는 태그</div>
						</div>
					</div>
					
					<!-- 전화번호 -->
					<div class="mb-3">
						<label for="username">전화번호</label>
						<div class="input-group">
							<input type="tel" class="form-control" id="tel" name="tel" value="${login.tel }" placeholder="전화번호">
							<div class="invalid-feedback" style="width: 100%;">이건 뭐하는 태그</div>
						</div>
					</div>
					
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">개인정보수정</button>
				</form>
			</div>
		</div>
	</div>
</section>


<jsp:include page="../info/footer.jsp"></jsp:include>
