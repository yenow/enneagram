<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<jsp:include page="n_info/header.jsp"></jsp:include>

		<!-- Intro -->
			<section id="intro" class="main style1 dark fullscreen">
				<div class="content">
					<header>
						<h2>Hey.</h2>
					</header>
					<p>Welcome to <strong>Big Picture</strong> a responsive site template designed by <a href="https://html5up.net">HTML5 UP</a><br />
					and released for free under the <a href="https://html5up.net/license">Creative Commons Attribution license</a>.</p>
					<footer>
						<a href="#one" class="button style2 down">More</a>
					</footer>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="main style2 right dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>What I Do</h2>
					</header>
					<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.
					Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis arcu,
					id varius justo euismod in. Curabitur egestas consectetur magna.</p>
				</div>
				<a href="#two" class="button style2 down anchored">Next</a>
			</section>

		<!-- Two -->
			<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>Who I Am</h2>
					</header>
					<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.
					Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis arcu,
					id varius justo euismod in. Curabitur egestas consectetur magna.</p>
				</div>
				<a href="#work" class="button style2 down anchored">Next</a>
			</section>

		<!-- Work -->
			<section id="work" class="main style3 primary">
				<div class="content">
					<header>
						<h2>My Work</h2>
						<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.
						Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis
						arcu, id varius justo euismod in. Curabitur egestas consectetur magna vitae.</p>
					</header>

					<!-- Gallery  -->
						<div class="gallery">
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/images/fulls/01.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/images/thumbs/01.jpg" title="The Anonymous Red" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/images/fulls/02.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/images/thumbs/02.jpg" title="Airchitecture II" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/images/fulls/03.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/images/thumbs/03.jpg" title="Air Lounge" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/images/fulls/04.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/images/thumbs/04.jpg" title="Carry on" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/images/fulls/05.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/images/thumbs/05.jpg" title="The sparkling shell" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/images/fulls/06.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/images/thumbs/06.jpg" title="Bent IX" alt="" /></a>
							</article>
						</div>

				</div>
			</section>

		<!-- Contact -->
			<section id="contact" class="main style3 secondary">
				<div class="content">
					<header>
						<h2>Say Hello.</h2>
						<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.</p>
					</header>
					<div class="box">
						<form method="post" action="#">
							<div class="fields">
								<div class="field half"><input type="text" name="name" placeholder="Name" /></div>
								<div class="field half"><input type="email" name="email" placeholder="Email" /></div>
								<div class="field"><textarea name="message" placeholder="Message" rows="6"></textarea></div>
							</div>
							<ul class="actions special">
								<li><input type="submit" value="Send Message" /></li>
							</ul>
						</form>
					</div>
				</div>
			</section>

<jsp:include page="n_info/footer.jsp"></jsp:include>