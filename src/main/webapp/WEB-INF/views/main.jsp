<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="n_info/header.jsp"></jsp:include>

<!-- Intro -->
<section id="intro" class="main style1 dark fullscreen">
	<div class="content">
		<header>
			<h2>Hello</h2>
		</header>
		<p>에니어 그램 사이트에 오신것을 환영합니다</p>
		<footer>
			<a href="#one" class="button style2 down">More</a>
		</footer>
	</div>
</section>

<!-- One -->
<section id="one" class="main style2 right dark fullscreen">
	<div class="content box style2">
		<header>
			<h2>에니어 그램이란?</h2>
		</header>
		<p>에니어그램은 사람을 이해하는데 도움을 주는 이론이다.</p>
	</div>
	<a href="#two" class="button style2 down anchored">Next</a>
</section>

<!-- Two -->
<section id="two" class="main style2 left dark fullscreen">
	<div class="content box style2">
		<header>
			<h2>WHO AM I?</h2>
		</header>
		<p>
			자신이 누구인지를 알고 자기 자신이 되어라 <br> - 핀다(PINDAR)
		</p>
	</div>
	<a href="#work" class="button style2 down anchored">Next</a>
</section>

<!-- Work -->
<section id="work" class="main style3 primary">


		<!-- Gallery  -->
		<div class="ttt" style="width: 100%">
			<div class="y-t-center">
				<a href="/anneagram/anneagram" class="button large" style="display: inline-block;">에니어그램 알아보기</a>
				<%-- <a href="${pageContext.request.contextPath}/resources/images/fulls/01.jpg" class="image fit">
				<img src="${pageContext.request.contextPath}/resources/images/thumbs/01.jpg" title="The Anonymous Red" alt="" /> 
				</a>
				<p>에니어그램 알아보기</p> --%>
			</div>
			<div class="y-t-center" style="margin-top: 20px;">
				<a href="/test/test" class="button large" style="display: inline-block; ">테스트하러가기</a>
				<%-- <a href="${pageContext.request.contextPath}/resources/images/fulls/02.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/images/thumbs/02.jpg" title="Airchitecture II" alt="" /></a>
				<p>테스트하러가기</p> --%>
			</div>
		</div>

	
</section>

<jsp:include page="n_info/footer.jsp"></jsp:include>