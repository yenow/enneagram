<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../c_info/header.jsp"></jsp:include>

<div id="main">
	<div class="inner">
		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"><strong>회원정보</strong></a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
			</ul>
		</header>

		<section>
			<h3>회원정보</h3>
			<div class="table-wrapper">
				<table>
					<tbody>
						<tr>
							<td>아이디</td>
							<td>${member_info.user_id }</td>
							
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>******</td>
						
						</tr>
						<tr>
							<td>이름</td>
							<td>${member_info.name }</td>
						
						</tr>
						<tr>
							<td>닉네임</td>
							<td>${member_info.nickname }</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${member_info.tel }</td>
						</tr>
						<tr>
							<td colspan="2"><a href="member_info_update" class="button primary fit">회원정보 수정하기</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

	</div>
</div>

<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>