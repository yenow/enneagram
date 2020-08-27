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
		<div class="row content-margin">
			<!-- 본문부분 -->
			<div class="col-md-8 ftco-animate fadeInUp ftco-animated">
				<h2 class="mb-1">${e.title }</h2>
				<div class="my-2" style="min-height: 500px;">${e.content }</div>

			</div>
			<!-- .col-md-8 -->
			
			
			
			<div class="col-md-4 sidebar ftco-animate order-first fadeInUp ftco-animated">

				<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
					<div class="categories">
						<h3>Categories</h3>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=enneagram"> 에니어그램이란 </a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=history"> 역사 </a>
							</li>
							<li>
								<a class="eclass-toggle dropdown-toggle" style="color :#ee76ad"> 분류 </a>
								<ul class="sub-9" id="eclass-toggle-li" style="display: none">
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=eclass&eclass=1">머리형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=eclass&eclass=2">가슴형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=eclass&eclass=3">장형</a>
									</li>
								</ul>
							</li>
							<li>
								<a class="type-toggle dropdown-toggle" style="color :#ee76ad"> 9가지의 유형 </a>
								<ul class="sub-9" id="type-toggle-li" style="display: none">
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=1">1유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=2">2유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=3">3유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=4">4유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=5">5유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=6">6유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=7">7유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=8">8유형</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=type&type=9">9유형</a>
									</li>
								</ul>
							</li>

						</ul>
					</div>

				</div>


				<div class="sidebar-box ftco-animate fadeInUp ftco-animated text-center">

					<c:if test="${login.category =='관리자' }">
						<a href="${pageContext.request.contextPath}/enneagram/registration" class="btn btn-outline-danger">
							<button type="button" class="btn btn-outline-danger">등록</button>
						</a>
					</c:if>
				</div>

			</div>
		</div>
	</div>
</section>

<script>
	$(document).ready(function() {
		$('.type-toggle').click(function() {
			console.log('cc');
			$('#type-toggle-li').toggle();
		});
		
		$('.eclass-toggle').click(function() {
			console.log('cc');
			$('#eclass-toggle-li').toggle();
		});
	});
	
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>

