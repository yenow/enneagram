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
		<div class="row justify-content-center content-margin">
			<div class="col-md-8 ftco-animate fadeInUp ftco-animated">
				
			</div>

			<div class="col-md-4 sidebar ftco-animate order-first fadeInUp ftco-animated">
				<div class="col-md-4 sidebar ftco-animate order-first fadeInUp ftco-animated">

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
	</div>
</section>


<jsp:include page="../info/footer.jsp"></jsp:include>
