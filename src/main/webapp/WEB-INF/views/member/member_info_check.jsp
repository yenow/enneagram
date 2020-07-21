<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../c_info/header.jsp"></jsp:include>

<div id="main">
	<div class="inner">
		<!-- Header -->
		<header id="header">
			<a href="${pageContext.request.contextPath}/member/member_info_check" class="logo"><strong>회원정보 수정</strong></a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
			</ul>
		</header>

		<section>
			<h3>회원정보 수정</h3>
			<div class="table-wrapper">
			<form action="${pageContext.request.contextPath}/member/member_info_check_ok" method="post">
				<table>
					<tbody>
						<tr>
							<td>
								비밀번호 확인
							</td>
							<td>
								<input type="password" name="password" />
							</td>
						</tr>		
					</tbody>
				</table>
				<div class="y-t-center">
					<input type="submit" class="button primary large " value="확인">
				</div>
				
			</form>
			</div>
		</section>

	</div>
</div>

<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>