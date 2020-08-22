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
			<div class="col-md-9 order-md-1 border rounded py-3 px-3 ">
				<!-- 내 프로필 -->
				<h4 class="mb-5 h2">나의 프로필</h4>
				<div class="d-flex justify-content-start align-items-center">
					<img src="../resources/images/normal.png" width="60" height="90" alt="Image placeholder" class="img-fluid my-img float-right"> <span class="ml-5"><strong>별명 </strong> <span> mooon</span> </span>
				</div>
				<!-- 프로필 사진 변경 -->
				<div class="input-group my-4">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary rounded" type="button" id="inputGroupFileAddon03">프로필 사진 등록</button>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03">
						<label class="custom-file-label" for="inputGroupFile03 inputGroupFile03label"></label>
					</div>
				</div>
				<div class="text-center">
					<a href="${pageContext.request.contextPath}/member/is_member" class="btn btn-primary">수정</a>
				</div>
				<hr />
				<!-- 비밀번호 -->
				<h4 class="mb-3 h2">개인정보수정</h4>
				<p>로그인 시 사용하는 비밀번호를 변경하거나 별명과, 전화번호, 이메일 주소등을 변경할수 있습니다. 주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</p>
				<div class="text-center">
					<a href="${pageContext.request.contextPath}/member/is_member" class="btn btn-primary">개인정보 수정하기</a>
				</div>
			</div>
			<!-- sidebar -->
			<div class="col-md-3 sidebar ftco-animate order-first fadeInUp ftco-animated">
				<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
					<div class="categories">
						<h3>마이페이지</h3>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/member/mytype"> 내 유형 </a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/myPage"> 개인정보수정 </a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>

$(document).ready(function() {
	$('#inputGroupFile03').change(function() {
		
		$('#inputGroupFile03label').html(this.files[0].name)
		console.log(this);
		console.log(this.files[0].name);
		console.log(this.files[0].type);
		console.log(this.files[0].size);
		new formData();
	});
	
	// 내 프로필 사진과 별명 정보를 꺼내오는 작업 필요
});

</script>

<jsp:include page="../info/footer.jsp"></jsp:include>
