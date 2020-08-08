<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<!-- <div class="js-fullheight"> -->
<div class="hero-wrap js-fullheight" >
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>

<section class="">
	<div class="container">
		<div class="row justify-content-center content-margin">
			<div class="login-box col-md-5 text-center">
				<form action="${pageContext.request.contextPath}/member/login_ok" method="post">
					<h2 class="pb-2 pt-2">로그인</h2>
					<%-- <img alt="로고사진" src="${pageContext.request.contextPath}/resources/img/logo.png" class="logo"> --%>
					<input type="text" class="form-control mt-3" placeholder="아이디">
					<input type="password" class="form-control my-3" placeholder="비밀번호">
					<p>
						<input type="checkbox" id="log-check" class="float-left">
						<label class="float-left" for="log-check"> <span></span> 로그인 상태 유지
						</label>
					</p>
					<div class="comment-form-wrap"></div>
					<p>
						<a href="#" class="float-left">아이디찾기</a> <a href="#" class="float-left ml-2">비밀번호찾기</a> <a href="${pageContext.request.contextPath}/member/member_insert" class="float-right">회원가입</a>
					</p>
					<div class="comment-form-wrap"></div>
					<input type="submit" value="로그인" class="btn btn-primary py-3 px-7 mt-2">
					<hr>
					<%-- <a><img alt="" src="${pageContext.request.contextPath}/resources/img/icon/kakao_login.png" class="logo2 mb-3"></a>
					<a><img alt="" src="${pageContext.request.contextPath}/resources/img/icon/naverLogin.PNG" class="logo2 mb-3"></a> --%>
				</form>
			</div>
		</div>
	</div>
</section>


<jsp:include page="../info/footer.jsp"></jsp:include>
