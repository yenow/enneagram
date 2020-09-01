<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${member == null }">
<script>
	alert('인증이 필요합니다');
	location.href='${pageContext.request.contextPath}/member/login';
</script>
</c:if>

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
				<h3>아이디</h3>			
				<p>${member.id }</p>
				<div>
				<a href="${pageContext.request.contextPath}/member/email_input?kind=password" class="btn btn-primary">비밀번호 찾으러가기</a>
				<a href="${pageContext.request.contextPath}/member/member_insert" class="btn btn-primary">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../info/footer.jsp"></jsp:include>