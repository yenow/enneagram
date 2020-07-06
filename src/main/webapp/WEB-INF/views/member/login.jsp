<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../c_info/header.jsp"></jsp:include>

<div id="main">
	<div class="inner">
		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"><strong>로그인</strong></a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
			</ul>
		</header>

		<section>
			<h3>Form</h3>

			<form method="post" action="${pageContext.request.contextPath}/member/login_ok">
				<div class="row gtr-uniform">
					<div class="col-12">
						<input type="text" name="user_id" id="user_id" value="" placeholder="이메일 주소 입력" />
					</div>
					<div class="col-12">
						<input type="password" name="user_pw" id="user_pw" value="" placeholder="비밀번호입력" />
					</div>
					<ul class="login-form">
						<li><p><a>아이디</a>/<a>비밀번호</a>를 잊어버리셨나요?&#09;&#32;|&#09;&#32;<span><a href="${pageContext.request.contextPath}/member/member_insert">회원가입</a></span></p></li>
						<li><input type="submit" value="로그인" class="primary" /></li>
					</ul>

				</div>
			</form>
		</section>

	</div>
</div>


<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>

<%-- 
<div id="content">
	<div class="container">
		<div class="content">
			<div class="login">

				<div class="sns_login">

					<h5>
						<pre>                                   </pre>
						가운데 줄긋기
						<pre>                                   </pre>
					</h5>
					<img src="/resources/img/kakao.png">
					<p>
						<button>다른방법으로 로그인</button>
					</p>

				</div>
				<div class="email_login">
					<h5>
						<pre>                                   </pre>
						이메일 로그인
						<pre>                                   </pre>
					</h5>
					<form action="login_ok" method="post">
						<input type="text" name="user_id" placeholder="아이디"> <input type="password" name="user_pw" placeholder="비밀번호">
						<p>
						<div class="helper"></div>
						<div class="email_info" style="float: left; font-size: 15px; color: rgb(48, 48, 48);">
							<input type="checkbox" style="width: 15px; height: 15px;">이메일 저장하기
						</div>
						<div class="email_info" style="float: right; font-size: 15px; color: rgb(48, 48, 48);">
							<a>아이디</a>/<a>비밀번호</a>를 잊어버리셨나요?
						</div>
						</p>

						<input type="submit" value="로그인">
					</form>
					<button class="member">
						<a>회원가입</a>
					</button>
				</div>

			</div>
		</div>
	</div>
</div>

<div id="tail">
	<jsp:include page="../info/tail.jsp"></jsp:include>
</div>
 --%>


<!-- <div class="row gtr-uniform">
															<div class="col-6 col-12-xsmall">
																<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />
															</div>
															Break
															<div class="col-12">
																<select name="demo-category" id="demo-category">
																	<option value="">- Category -</option>
																	<option value="1">Manufacturing</option>
																	<option value="1">Shipping</option>
																	<option value="1">Administration</option>
																	<option value="1">Human Resources</option>
																</select>
															</div>
															Break
															<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority-low" name="demo-priority" checked>
																<label for="demo-priority-low">Low</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority-normal" name="demo-priority">
																<label for="demo-priority-normal">Normal</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority-high" name="demo-priority">
																<label for="demo-priority-high">High</label>
															</div>
															Break
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-copy" name="demo-copy">
																<label for="demo-copy">Email me a copy</label>
															</div>
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-human" name="demo-human" checked>
																<label for="demo-human">I am a human</label>
															</div>
															Break
															<div class="col-12">
																<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
															</div>
															Break
															<div class="col-12">
																<ul class="actions">
																	<li><input type="submit" value="Send Message" class="primary" /></li>
																	<li><input type="reset" value="Reset" /></li>
																</ul>
															</div>
														</div>

 -->