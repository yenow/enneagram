<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 로그인 유효성 검증 코드 해야함 -->

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
		<div class="row my-5">
			<div class="col-md-9 order-md-1">
				<h4 class="mb-3">비밀번호확인</h4>
				<form class="needs-validation" action="${pageContext.request.contextPath}/member/member_info_check_ok" method="get" onsubmit="return validate();">
					<input type="hidden" name="kind" value="${kind }">
					
					<div class="mb-3">
						<label for="username">비밀번호</label>
						<div class="input-group">
							<input type="password" class="form-control" id="username" name="password" placeholder="password" required="">
							<div class="invalid-feedback" style="width: 100%;">password</div>
						</div>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">비밀번호확인</button>
				</form>
			</div>

			<div class="col-md-3 sidebar ftco-animate order-first fadeInUp ftco-animated">
				<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
					<div class="categories">
						<h3>마이페이지</h3>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/member/mytype"> 내 유형 </a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=history"> 개인정보수정 </a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
function validate() {
	if('${kind}'=='delete'){
		var flag = confirm('정말 삭제하시겠습니까?');
		if(flag==true){
			
		}else{
			return false;
		}
	}
}
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>
