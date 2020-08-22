<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<!-- <div class="js-fullheight"> -->
<div class="hero-wrap js-fullheight">
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>

<section class="member-insert">
	<div class="container">
		<div class="row justify-content-center content-margin member-insert">
			<div class="col-md-6 text-center">
				<form method="post" action="${pageContext.request.contextPath}/member/member_insert_ok" id="signUpForm">
					<h2 class="text-center mb-5">회원가입</h2>

					<input type="text" class="form-control my-2" name="id" id="id"  placeholder="아이디 입력" />
					<p class="text-left" id="p_id"></p>

					<input type="password" class="form-control  my-2" name="password" id="password" placeholder="비밀번호입력" />
					<input type="password" class="form-control my-2" name="password2" id="password2"  placeholder="비밀번호 재입력" />
					<p class="text-left" id="p_password"></p>

					<input type="text" class="form-control  my-2" name="name" id="name"  placeholder="이름" />
					<p class="text-left" id="p_name"></p>

					<input type="text" class="form-control  my-2" name="nickname" id="nickname"  placeholder="닉네임" />
					<p class="text-left" id="p_nickname"></p>

					<input type="tel" class="form-control  my-2" name="tel" id="tel"  placeholder="전화번호" />
					<p class="text-left" id="p_tel"></p>
					
					<input type="email" class="form-control  my-2" name="email" id="email"  placeholder="이메일" />
					<p class="text-left" id="p_email"></p>
					
					<input type="radio" class="form-control  my-2" name="gender" id="male" value="M" />
						<label for="male" class="mx-3"><span></span>남자</label>
					<input type="radio" class="form-control  my-2" name="gender" id="female" value="F" />
						<label for="female" class="mx-3"><span></span>여자</label>
					
					<p class="text-left" id="p_gender"></p>

					<input type="submit" value="회원가입" class="btn btn-primary form-control">
					
					<p></p>
				</form>
			</div>
		</div>
	</div>
</section>

<div class="alert alert-danger" role="alert" style="display: none;">
  A simple danger alert—check it out!
</div>

<script>
// 아작스로 구현해야함,, 유효성검증
$(document).ready(function () {
	// 포커스를 벗어날 때
	$('#id').blur(function () {
		if($('#id').val()==''){
			$('#p_id').html('아이디를 입력해주세요');
		}
		
		var id = $('#id').val();
		var data = {'id' : id};
		$.get('${pageContext.request.contextPath}/member/idValidate', data, function(data, textStatus, req) {
			console.log(data);
			if(data==true){
				$('#p_id').html('중복된 아이디가 있습니다');
			}
			
			if($('#id').val()!='' && data==false){
				$('#p_id').html('');
			}
			
		}, 'json');
		
		
		
	});
	
	$('#password').blur(function () {
		if($('#password').val()==''){
			$('#p_password').html('비밀번호를 입력해주세요');
		}
	});
		
	$('#password2').blur(function () {
		if($('#password').val()==''){
			$('#p_password').html('비밀번호를 입력해주세요');
		}
	});
		
	$('#name').blur(function () {
		if($('#name').val()==''){
			$('#p_name').html('이름을 입력해주세요');
		}
	});
	
	$('#nickname').blur(function () {
		if($('#nickname').val()==''){
			$('#p_nickname').html('닉네임을 입력해주세요');
		}
	});
	
	$('#tel').blur(function () {
		if($('#tel').val()==''){
			$('#p_tel').html('전화번호를 입력해주세요');
		}
	});
	
	$('#email').blur(function () {
		if($('#email').val()==''){
			$('#p_email').html('이메일을 입력해주세요');
		}
	});
	
	

	$('#signUpForm').submit(function () {
		
		if($('#id').val()==''){
			$('.alert').alert('아이디를 입력해주세요');
			document.querySelector('#id').scrollIntoView();
			return false;
		}
		if($('#password').val()==''){
			$('.alert').alert('비밀번호를 입력해주세요');
			document.querySelector('#password').scrollIntoView();
			return false;
		}
		if($('#name').val()==''){
			$('.alert').alert('이름을 입력해주세요');
			document.querySelector('#name').scrollIntoView();
			return false;
		}
		if($('#nickname').val()==''){
			$('.alert').alert('닉네임을 입력해주세요');
			document.querySelector('#nickname').scrollIntoView();
			return false;
		}
		if($('#tel').val()==''){
			$('.alert').alert('전화번호를 입력해주세요');
			document.querySelector('#tel').scrollIntoView();
			return false;
		}
		if($('#email').val()==''){
			$('.alert').alert('이메일을 입력해주세요');
			document.querySelector('#email').scrollIntoView();
			return false;
		}
		if($('#male').val()=='' && $('#female').val()==''){
			$('.alert').alert('성별을 입력해주세요');
			return false;
		}
		
	});
});

</script>

<jsp:include page="../info/footer.jsp"></jsp:include>


<%-- 
<div id="main">
	<div class="inner">
		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"><strong>회원가입</strong></a>
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

			<form method="post" action="${pageContext.request.contextPath}/member/member_insert_ok" onsubmit="return check();">
				<div class="row gtr-uniform">
					<div class="col-12">
						<input type="email" name="user_id" id="user_id" value="" placeholder="이메일 주소 입력" />
						<p> </p>
					</div>
					<div class="col-12">
						<input type="password" name="user_pw" id="user_pw" value="" placeholder="비밀번호입력" />
						<p> </p>
					</div>
					<div class="col-12">
						<input type="password" name="user_pw2" id="user_pw" value="" placeholder="비밀번호 재입력" />
						<p> </p>
					</div>
					<div class="col-12">
						<input type="text" name="name" id="name" value="" placeholder="이름" />
						<p> </p>
					</div>
					<div class="col-12">
						<input type="text" name="nickname" id="nickname" value="" placeholder="닉네임" />
						<p> </p>
					</div>
					<div class="col-12">
						<input type="tel" name="tel" id="tel" value="" placeholder="전화번호" />
						<p> </p>
					</div>
					<div class="col-12">
						<input type="submit" value="회원가입" class="primary" />
						<p> </p>
					</div>

				</div>
			</form>
		</section>

	</div>
</div>


<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>
 --%>
