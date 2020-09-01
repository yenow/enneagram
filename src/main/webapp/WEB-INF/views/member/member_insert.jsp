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
					<!-- 아이디 입력 -->
					<input type="text" class="form-control my-2" name="id" id="id"  placeholder="아이디 입력" />
					<p class="text-left" id="p_id"></p>
					<!-- 비밀번호입력-->
					<input type="password" class="form-control  my-2" name="password" id="password" placeholder="비밀번호입력" />
					<input type="password" class="form-control my-2" name="password2" id="password2"  placeholder="비밀번호 재입력" />
					<p class="text-left" id="p_password"></p>
					<!-- 이름 입력 -->
					<input type="text" class="form-control  my-2" name="name" id="name"  placeholder="이름" />
					<p class="text-left" id="p_name"></p>

					<input type="text" class="form-control  my-2" name="nickname" id="nickname"  placeholder="닉네임" />
					<p class="text-left" id="p_nickname"></p>

					<input type="tel" class="form-control  my-2" name="tel" id="tel"  placeholder="전화번호" />
					<p class="text-left" id="p_tel"></p>
					<!-- 이메일 입력 -->
					<div class="form-row" id="email-Input">
						<div class="col-10"><input type="email" class="form-control  my-2" name="email" id="email"  placeholder="이메일" /></div>
						<div class="col-2"><button type="button" class="btn btn-outline-secondary my-2" style="height: 80%" onclick="return emailAuthority();">이메일인증</button></div>
					</div>
					
					<p class="text-left" id="p_email"></p>
					
					<input type="radio" class="form-control  my-2" name="gender" id="male" value="M" />
						<label for="male" class="mx-3"><span></span>남자</label>
					<input type="radio" class="form-control  my-2" name="gender" id="female" value="F" />
						<label for="female" class="mx-3"><span></span>여자</label>
					
					<p class="text-left" id="p_gender"></p>

						<input type="submit" value="등록" class="btn btn-primary btn-block">
					
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

var flag = true;
var emailcode;
var complete=false;
function emailAuthority() {
	console.log("이메일 인증 아작스");
	var email = $('#email').val();
	if(email==''){
		$('#p_email').html('이메일을 입력해주세요');
		return false;
	}else{
		
			$.ajax({
				url : '${pageContext.request.contextPath}/member/emailConfirm',
				type : 'POST',
				data : {'email' : email}, 
				dataType : 'html',
				success : function(data) {
					console.log(data);
					
					// 이메일이 존재할떄
					if(data=='true'){
						alert('중복된 이메일 입니다');
						return false;
					}else{  // 이메일이 없을떄, 이메일은 중복되면 안됨, 이제 인증코드 보냄
						
						if(flag==false){
							return false;
						}
						flag = false;
						$div1= $('<div class="col-10 email-confirm-div"><input type="number" class="form-control  my-2" name="email-confirm" id="email-confirm"  placeholder="이메일 인증코드" /></div>');
						$div2= $('<d iv class="col-2"><button class="btn btn-outline-secondary" style="height: 80%; width:100%;" onclick="return emailConfirm();">확인</button></div>');
						$('#email-Input').append($div1);
						$('#email-Input').append($div2);
						
						$.ajax({
							url : '${pageContext.request.contextPath}/member/auth.do',
							type : 'POST',
							data : {'email' : email}, 
							dataType : 'html',
							success : function(dice) {
								console.log(dice);
								emailcode = dice;
							},
							error : function() {
								console.log('전송실패');
							}
						});
					}
					
				},
				error : function() {
					console.log('전송실패');
				}
		});
	}
}

// 인증코드 확인작업
function emailConfirm() {
	console.log("이메일 인증 번호 확인");
	var code = $('#email-confirm').val();
	if(emailcode==code){
		alert('인증되었습니다');
		complete = true;
		$('.email-confirm-div').next().remove();
		$('.email-confirm-div').remove();
	}else{
		alert('코드가 맞지 않습니다');
		$('#email-confirm').val('');
	}
}

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
				$('#p_id').html('사용가능한 아이디입니다');
				$('#p_id').css({'color':'blue'});
			}
			
		}, 'json');
		
		
		
	});
	
	$('#password').blur(function () {
		if($('#password').val()==''){
			$('#p_password').html('비밀번호를 입력해주세요');
		}else{
			$('#p_password').html('');
		}
		
		if($('#password').val()!=$('#password2').val()){
			$('#p_password').html('비밀번호가 같지 않습니다');
		}else{
			$('#p_password').html('비밀번호 일치');
			$('#p_password').css({'color':'blue'});
		}
	});
		
	$('#password2').blur(function () {
		if($('#password').val()==''){
			$('#p_password').html('비밀번호를 입력해주세요');
		}else{
			$('#p_password').html('');
		}
		
		if($('#password').val()!=$('#password2').val()){
			$('#p_password').html('비밀번호가 같지 않습니다');
		}else{
			$('#p_password').html('비밀번호 일치');
			$('#p_password').css({'color':'blue'});
		}
	});
		
	$('#name').blur(function () {
		if($('#name').val()==''){
			$('#p_name').html('이름을 입력해주세요');
		}else{
			$('#p_name').html('');
		}
	});
	
	$('#nickname').blur(function () {
		if($('#nickname').val()==''){
			$('#p_nickname').html('닉네임을 입력해주세요');
		}else{
			$('#p_nickname').html('');
		}
	});
	
	$('#tel').blur(function () {
		if($('#tel').val()==''){
			$('#p_tel').html('전화번호를 입력해주세요');
		}else{
			$('#p_tel').html('');
		}
	});
	
	$('#email').blur(function () {
		if($('#email').val()==''){
			$('#p_email').html('이메일을 입력해주세요');
		}else{
			$('#p_email').html('');
		}
	});
	
	

	$('#signUpForm').submit(function () {
		
		if($('#id').val()==''){
			alert('아이디를 입력해주세요');
			document.querySelector('#id').scrollIntoView();
			return false;
		}
		if($('#password').val()==''){
			alert('비밀번호를 입력해주세요');
			document.querySelector('#password').scrollIntoView();
			return false;
		}
		if($('#name').val()==''){
			alert('이름을 입력해주세요');
			document.querySelector('#name').scrollIntoView();
			return false;
		}
		if($('#nickname').val()==''){
			alert('닉네임을 입력해주세요');
			document.querySelector('#nickname').scrollIntoView();
			return false;
		}
		if($('#tel').val()==''){
			alert('전화번호를 입력해주세요');
			document.querySelector('#tel').scrollIntoView();
			return false;
		}
		if($('#email').val()==''){
			alert('이메일을 입력해주세요');
			document.querySelector('#email').scrollIntoView();
			return false;
		}
		if($('#male').val()=='' && $('#female').val()==''){
			alert('성별을 입력해주세요');
			return false;
		}
		if(complete==false){
			$('.alert').alert('이메일 인증이 필요합니다');
			return false;
		}
		
	});
});

</script>

<jsp:include page="../info/footer.jsp"></jsp:include>
