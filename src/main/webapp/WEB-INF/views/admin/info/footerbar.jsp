<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<footer class="footer">
	<div class="container-fluid">
		<nav class="pull-left">
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}"> Home </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/test/test"> 테스트 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=enneagram"> 에니어그램 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/board/boardList?category=속닥속닥""> 게시판 </a>
				</li>
			</ul>
		</nav>
		<p class="copyright pull-right">
			©
			<script>document.write(new Date().getFullYear())</script>
			2020
			<a href="http://www.creative-tim.com">Creative Tim</a>
			, made with love for a better web
		</p>
	</div>
</footer>