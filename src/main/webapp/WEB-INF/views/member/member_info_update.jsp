<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../c_info/header.jsp"></jsp:include>

<div id="main">
	<div class="inner">
		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"><strong>회원정보 수정</strong></a>
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
			<form action="${pageContext.request.contextPath}/member/member_info_update_ok" method="post">
				<input type="hidden" name="uno" value="${login.uno }">
				<table>
					<tbody>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="user_id" value="${login.user_id }" readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw" /></td>
						
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td><input type="password" name="user_pw_ok" /></td>
						
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" value="${login.name }" readonly="readonly" /></td>
						
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" name="nickname" value="${login.nickname }" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" value="${login.tel }" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" class="button primary large" value="등록"></td>
						</tr>
					</tbody>
				</table>
			</form>
			</div>
		</section>

	</div>
</div>

<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>