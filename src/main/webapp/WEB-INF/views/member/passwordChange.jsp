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
				<form action="${pageContext.request.contextPath}/member/passwordChange_ok" method="post">
					<input type="hidden" name="mno" value="${member.mno }">
				
					<h2>비밀번호 변경</h2>
					<div class="form-group">
						<label for="exampleInputEmail1"></label>
						<input type="password" class="form-control" id="exampleInputEmail1" name="password" aria-describedby="emailHelp" placeholder="비밀번호">
						<small id="emailHelp" class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail2"></label>
						<input type="password" class="form-control" id="exampleInputEmail2" name="password2" aria-describedby="emailHelp" placeholder="비밀번호 확인">
						<small id="emailHelp" class="form-text text-muted">새 비밀번호를 적어주세요</small>
					</div>
				</form>
			</div>
				
		</div>
	</div>
</section>

<script>
// 비밀번호 유효성 검증..

</script>
    
<jsp:include page="../info/footer.jsp"></jsp:include>
    