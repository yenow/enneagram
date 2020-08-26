<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="info/header.jsp"></jsp:include>

<!-- <div class="js-fullheight"> -->
	<div class="hero-wrap js-fullheight">
		<!-- 분홍색 배경 -->
		<div class="overlay"></div>
		<!-- 동적인 처리 -->
		<div id="particles-js"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
				<div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						We love <strong>All People</strong> 
					</h1>
					<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						<a href="${pageContext.request.contextPath}/test/test" class="btn btn-primary btn-outline-white px-5 py-3">Test</a>
					</p>
				</div>
			</div>
		</div>
	</div>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-5">
			<div class="col-md-6 text-center heading-section ftco-animate">
				<h2 class="mb-4">에니어그램 사이트</h2>
			</div>
			<div class="col-md-12 text-center heading-section ftco-animate">
				<p>에니어그램(Enneagram)은 그리스어로 ennea와 gram이 합쳐진 말이다. ennea는 '9'를 뜻하고, gram은 '도형'이라는 뜻의 grammos에서 나왔습니다. 9가지 유형으로 이야기합니다</p>
			</div>
			<div class="col-md-6 text-center heading-section ftco-animate">
				<h4 class="mb-4">에니어그램의 목적</h4>
			</div>
			<div class="col-md-12 text-center heading-section ftco-animate">
				<p>에니어그램의 통해서 우리는 사람에 대해서 통찰력을 가질수 있습니다. 에니어그램을 통해서 우리가 하면 좋은것은 첫번째로 먼저 자신을 이해하고, 두번쨰로 타인을 이해하는것입니다.
				그러므로 우리 삶의 에너지 균형을 이루고, 개인적인 마음의 평화를 얻고, 다른 사람을 이해함으로서 성격이 개선되거나 인간관계가 개선 될 수 있습니다. 나아가서 내적여행을 통해서
				스스로의 발전과 자아실현을 이루어 낼수 있습니다. </p>
			</div>
		</div>
		
	
		<div class="row">
			<div class="col-md-12">
				<h4 class="text-center mb-5">에니어그램의 단계</h4>
			</div>
			<div class="col-md-6 col-lg-4 d-flex align-self-stretch ftco-animate">
				<div class="pl-3 media block-6 services d-block text-center" style="width: 100%;">
					<div class="d-flex justify-content-center">
						<div class="icon color-3 d-flex justify-content-center mb-3">
							<span class="align-self-center icon-lightbulb-o"></span>
						</div>
					</div>
					<div class="media-body p-2 mt-3">
						<h3 class="heading">유형을 찾아서(자기관찰)</h3>
						<p>자기자신의 집착을 찾아내는 단계</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-flex align-self-stretch ftco-animate">
				<div class="pl-3 media block-6 services d-block text-center" style="width: 100%;">
					<div class="d-flex justify-content-center">
						<div class="icon color-1 d-flex justify-content-center mb-3">
							<span class="align-self-center icon-laptop"></span>
						</div>
					</div>
					<div class="media-body p-2 mt-3">
						<h3 class="heading">신념을찾아서(자기이해)</h3>
						<p>집착의 원인을 이해하는 단계</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-flex align-self-stretch ftco-animate">
				<div class="pl-3 media block-6 services d-block text-center" style="width: 100%;">
					<div class="d-flex justify-content-center">
						<div class="icon color-2 d-flex justify-content-center mb-3">
							<span class="align-self-center icon-gear"></span>
						</div>
					</div>
					<div class="media-body p-2 mt-3">
						<h3 class="heading">소명을 찾아서(자기변형)</h3>
						<p>집착을 극복하는 단계</p>
					</div>
				</div>
			</div>

			<!-- <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services d-block text-center">
					<div class="d-flex justify-content-center">
						<div class="icon color-4 d-flex justify-content-center mb-3">
							<span class="align-self-center icon-live_help"></span>
						</div>
					</div>
					<div class="media-body p-2 mt-3">
						<h3 class="heading">Help &amp; Supports</h3>
						<p>Even the all-powerful Pointing has no control about the
							blind texts it is an almost unorthographic.</p>
					</div>
				</div>
			</div> -->
			<p>이러한 단계를 통해서 우리는 새로운 자기 이해는 물론, 치유를 위한 실제 지침을 얻고, 참된 자기자신과 더욱 깊고 진실한 관계를 맺을수 있습니다!</p>
		</div>
	</div>
</section>

<section class="ftco-section-parallax">
	<div class="parallax-img d-flex align-items-center">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div
					class="col-md-7 text-center heading-section heading-section-white ftco-animate">
					<h2>more</h2>
					<p>더 에니어그램을 알고 싶거나,<br> 더 나에 대해서 알고 싶거나 <br>
					더 전문가에게 상담을 받고 싶다면,<br> 이메일 주소를 적어주세요!</p>
					<div class="row d-flex justify-content-center mt-5">
						<div class="col-md-6">
							<form action="#" class="subscribe-form">
								<div class="form-group">
									<span class="icon icon-paper-plane"></span>
									<input type="text" class="form-control"
										placeholder="Enter email address">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section testimony-section bg-light">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-5">
			<div class="col-md-7 text-center heading-section ftco-animate">
				<span class="subheading">famous saying</span>
				<h2 class="mb-4">마음의 양식</h2>
				<p></p>
			</div>
		</div>
		<div class="row ftco-animate">
			<div class="col-md-12">
				<div class="carousel-testimony owl-carousel ftco-owl">
					<div class="item text-center">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-4"
								style="background-image: url(images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text">
								<p class="mb-5">인생이란 진지하게 이야기하기에는 너무나 중요한 것이다</p>
								<p class="name">오스카 와일드</p>
								<span class="position">Oscar Wilde</span>
							</div>
						</div>
					</div>
					<div class="item text-center">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-4"
								style="background-image: url(images/person_2.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text">
								<p class="mb-5">성격이 모두 나와 같아지기를 바라지 말라.
								매끈한 돌이나 거친 돌이나 다 제각기 쓸모가 있는 법이다.
								남의 성격이 내성격과 같아지기를 바라는 것은 어리석은 생각이다.
								</p>
								<p class="name">안창호</p>
							</div>
						</div>
					</div>
					<div class="item text-center">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-4"
								style="background-image: url(images/person_3.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text">
								<p class="mb-5">남들보다 더 잘하려고 고민하지 마세요.
								'지금의 나'보다 잘하려 애쓰는 게 중요해요
								</p>
								<p class="name">윌리엄 포크너</p>
							</div>
						</div>
					</div>
					<div class="item text-center">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-4"
								style="background-image: url(images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text">
								<p class="mb-5">Far far away, behind the word mountains, far
									from the countries Vokalia and Consonantia, there live the
									blind texts.</p>
								<p class="name">Dennis Green</p>
								<span class="position">Web Developer</span>
							</div>
						</div>
					</div>
					<div class="item text-center">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-4"
								style="background-image: url(images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text">
								<p class="mb-5">Far far away, behind the word mountains, far
									from the countries Vokalia and Consonantia, there live the
									blind texts.</p>
								<p class="name">Dennis Green</p>
								<span class="position">System Analytics</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-counter" id="section-counter">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-5">
			<div
				class="col-md-7 text-center heading-section heading-section-white ftco-animate">
				<h2>Our achievements</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia, there live the blind texts.
					Separated they live in</p>
			</div>
		</div>
		<div class="row">
			<div
				class="col-md-6 col-lg-4 d-flex justify-content-center counter-wrap ftco-animate">
				<div class="block-18 text-center">
					<div class="text">
						<strong class="number" data-number="400">0</strong> <span>Customers
							are satisfied with our professional support</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-6 col-lg-4 d-flex justify-content-center counter-wrap ftco-animate">
				<div class="block-18 text-center">
					<div class="text">
						<strong class="number" data-number="1000">0</strong> <span>Amazing
							preset options to be mixed and combined</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-6 col-lg-4 d-flex justify-content-center counter-wrap ftco-animate">
				<div class="block-18 text-center">
					<div class="text">
						<strong class="number" data-number="8000">0</strong> <span>Average
							response time on live chat support channel</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="info/footer.jsp"></jsp:include>