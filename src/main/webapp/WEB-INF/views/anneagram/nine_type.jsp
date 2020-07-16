<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<jsp:include page="../c_info/header.jsp"></jsp:include>


<!-- Main -->
<div id="main">
	<div class="inner">

		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"> <strong>9가지 유형</strong>
			</a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"> <span class="label">Twitter</span>
				</a></li>
				<li><a href="#" class="icon brands fa-facebook-f"> <span class="label">Facebook</span>
				</a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"> <span class="label">Snapchat</span>
				</a></li>
				<li><a href="#" class="icon brands fa-instagram"> <span class="label">Instagram</span>
				</a></li>
				<li><a href="#" class="icon brands fa-medium-m"> <span class="label">Medium</span>
				</a></li>
			</ul>
		</header>

		<!-- Banner -->
		<%-- <section id="banner">
			<div class="content">
				<header>
					<h1>
						에니어그램이란
					</h1>
					<p>A free and fully responsive site template</p>
				</header>
				<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin aliquam facilisis ante interdum congue. Integer mollis, nisl amet convallis, porttitor magna ullamcorper, amet egestas mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p>
				<ul class="actions">
					<li><a href="#" class="button big">Learn More</a></li>
				</ul>
			</div>
			<span class="image object"> <img src="${pageContext.request.contextPath}/resources/images/pic10.jpg" alt="" />
			</span>
		</section> --%>

		<div id="main">

			<div class="inner">
				<header>
					<h1 style="padding: 0; margin: 10px;">에니어그램 9가지의 유형입니다</h1>
					<p style="padding-top: 15px; margin: 0;">에니어그램 9가지의 유형입니다</p>
				</header>
				<section class="tiles" style="padding-top: 0; margin-top: 0;">
					<article class="style1">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic01.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/1_type">
							<h2>1유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style2">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic02.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/2_type">
							<h2>2유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic03.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/3_type">
							<h2>3유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style4">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic04.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/4_type">
							<h2>4유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style5">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic05.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/5_type">
							<h2>5유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style6">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic06.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/6_type">
							<h2>6유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style2">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic07.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/7_type">
							<h2>7유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic08.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/8_type">
							<h2>8유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
					<article class="style1">
						<span class="image"> <img src="${pageContext.request.contextPath}/resources/images/pic09.jpg" alt="" />
						</span> <a href="${pageContext.request.contextPath}/anneagram/9_type">
							<h2>9유형</h2>
							<div class="content">
								<p></p>
							</div>
						</a>
					</article>
				</section>
			</div>
		</div>

	</div>
</div>


<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>



