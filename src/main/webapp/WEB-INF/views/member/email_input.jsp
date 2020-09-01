<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../info/header.jsp"></jsp:include>

<!-- <div class="js-fullheight"> -->
<div class="hero-wrap js-fullheight" >
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>
<section class="">
	<div class="container">
		<div class="row justify-content-center content-margin">
			<div class="login-box col-md-5 text-center">
				
				
					<h2 class="pb-2 pt-2">이메일 입력</h2>
					<div class="form-group">
						<label for="exampleInputEmail1"></label>
						<input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="이메일 주소">
						<small id="emailHelp" class="form-text text-muted">가입했을 때 이메일을 적어주세요</small>
					</div>
					<div class="form-group">
						 <button type="submit" class="btn btn-outline-secondary btn-block" onclick="return sendCode();">인증코드보내기</button>
					</div>
					
					<hr />
					<div class="form-row" id="email-Input" style="display: none;">
						<div class="col-10 email-confirm-div"><input type="number" class="form-control  my-2" name="email-confirm" id="email-confirm"  placeholder="이메일 인증코드" /></div>
						<div class="col-2"><button class="btn btn-outline-secondary my-2" style="height: 80%" onclick="return emailAuthority();">인증확인</button></div>
					</div>
				
			</div>
		</div>
	</div>
</section>

<script>

var realemail;
var emailcode;
function sendCode() {
	var email = $('#exampleInputEmail1').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/member/emailConfirm',
		type : 'POST',
		data : {'email' : email}, 
		dataType : 'html',
		success : function(flag) {
			console.log(flag);
			// 등록된 이메일이 있으면
			if(flag=='true'){
				realemail = email;
				alert('인증코드가 발송되었습니다');
				console.log(realemail);
				// 이메일에 인증코드 보내는 아작스
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
				
			}else{
				alert('등록된 이메일이 없습니다');
				$('#exampleInputEmail1').val('');
				return false;
			}
		},
		error : function() {
			console.log('전송실패');
		}
	});
	
		
	$('#email-Input').show();
}

function emailAuthority() {
	var code = $('#email-confirm').val();
	if(code==emailcode){
		alert('인증성공');
		if('${kind}'=='password'){
			location.href='${pageContext.request.contextPath}/member/passwordChange?email='+realemail;
		}else if('${kind}'=='id'){
			location.href='${pageContext.request.contextPath}/member/findIdResult?email='+realemail;
		}
	}else{
		alert('인증코드가 맞지 않습니다');
		$('#email-confirm').val('');
	}
	
}
</script>


<jsp:include page="../info/footer.jsp"></jsp:include>