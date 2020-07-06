<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">

		<!-- Search -->
		<section id="search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="Search" />
			</form>
		</section>

		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>Menu</h2>
			</header>
			<ul>
				<li><a href="${pageContext.request.contextPath}/">Homepage</a></li>
				<li><span class="opener">Introduce</span>
					<ul>
						<li><a href="${pageContext.request.contextPath}/anneagram/anneagram">에니어그램이란</a></li>
						<li><a href="${pageContext.request.contextPath}/anneagram/nine_type">9가지의 유형</a></li>
						<li><a href="${pageContext.request.contextPath}/anneagram/history">역사</a></li>
					</ul></li>
				<li><span class="opener">Test</span>
					<ul>
						<li><a href="${pageContext.request.contextPath}/test/test">테스트</a></li>
						<li><a href="${pageContext.request.contextPath}/test/test_complete">결과</a></li>
					</ul></li>
				<li><span class="opener">Board</span>
					<ul>
						<li><a href="#">공지사항(준비중)</a></li>
						<li><a href="${pageContext.request.contextPath}/board/boardList">게시판</a></li>
						<li><a href="#">실시간 채팅(준비중)</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/member/member_insert">회원가입</a></li>
			</ul>
		</nav>

		
		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images:
				<a href="https://unsplash.com">Unsplash</a>
				. Design:
				<a href="https://html5up.net">HTML5 UP</a>
				.
			</p>
		</footer>

	</div>
</div>

<%-- <!-- Section -->
		<section>
			<header class="major">
				<h2>Ante interdum</h2>
			</header>
			<div class="mini-posts">
				<article>
					<a href="#" class="image">
						<img src="${pageContext.request.contextPath}/resources/images/pic07.jpg" alt="" />
					</a>
					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
				</article>
				<article>
					<a href="#" class="image">
						<img src="${pageContext.request.contextPath}/resources/images/pic08.jpg" alt="" />
					</a>
					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
				</article>
				<article>
					<a href="#" class="image">
						<img src="${pageContext.request.contextPath}/resources/images/pic09.jpg" alt="" />
					</a>
					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
				</article>
			</div>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</section>

		<!-- Section -->
		<section>
			<header class="major">
				<h2>Get in touch</h2>
			</header>
			<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
			<ul class="contact">
				<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
				<li class="icon solid fa-phone">(000) 000-0000</li>
				<li class="icon solid fa-home">1234 Somewhere Road #8254<br /> Nashville, TN 00000-0000
				</li>
			</ul>
		</section> --%>
