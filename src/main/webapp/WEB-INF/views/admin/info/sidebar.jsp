<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<div class="sidebar" data-color="purple" data-image="${pageContext.request.contextPath }/resources/assets/img/sidebar-5.jpg">
	<!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->
	<div class="sidebar-wrapper">
		<div class="logo">
			<a href="http://www.creative-tim.com" class="simple-text"> Creative Tim </a>
		</div>
		<ul class="nav">
			<li>
				<a href="${pageContext.request.contextPath }/admin/memberManage">
					<i class="pe-7s-graph"></i>
					<p>회원 관리</p>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/boardManage">
					<i class="pe-7s-graph"></i>
					<p>게시글 관리</p>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/replyManage">
					<i class="pe-7s-graph"></i>
					<p>댓글 관리</p>
				</a>
			</li>
			<li class="active-pro">
				<a href="upgrade.html">
					<i class="pe-7s-rocket"></i>
					<p>Upgrade to PRO</p>
				</a>
			</li>
		</ul>
	</div>
</div>