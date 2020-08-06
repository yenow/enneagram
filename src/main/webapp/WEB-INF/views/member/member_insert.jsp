<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../c_info/header.jsp"></jsp:include>

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

<script>

function check(){
    if($.trim($('#user_id').val())==""){
        alert("아이디를 입력해주세요");
        $('#user_id').val('').focus();
        return false;
    }
    if($.trim($('#user_pw').val())==""){
        alert("비밀번호를 입력해주세요");
        $('#user_id').val('').focus();
        return false;
    }
    if($.trim($('#name').val())==""){
        alert("이름를 입력해주세요");
        $('#user_id').val('').focus();
        return false;
    }
    if($.trim($('#nickname').val())==""){
        alert("닉네임를 입력해주세요");
        $('#user_id').val('').focus();
        return false;
    }
    if($.trim($('#tel').val())==""){
        alert("전화번호를 입력해주세요");
        $('#user_id').val('').focus();
        return false;
    }
}

</script>

<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>

<!-- 
	<div id="content">
		<div class="container">
			<div class="content">
				<div class="member">
			        <div class="member-header">
			           
			            <h5>
			                <pre>                 </pre>
			                정말 간단한 회원가입하기
			                <pre>                 </pre>
			            </h5>
			            <div class="member-info"></div>
			        </div>
		        <div class="member-body">
		            <form action="member_insert_ok" method="post" id="member-insert"
						onsubmit="return check();">
		                <ul>
		                	<li>
		                        <h5><span class="member-red">*</span> 아이디</h5>
		                        <input type="text" name="user_id" class="user_id" placeholder="아이디를 입력해주세요">
		                    </li>
		                    
		                    <li>
		                        <h5><span class="member-red">*</span> 비밀번호</h5>
		                        <input type="password" name="user_pw" class="user_pw" placeholder="비밀번호 입력해주세요">
		                        <input type="password" placeholder="비밀번호 다시 입력해주세요">
		                    </li>
		                    
		                    <li>
		                        <h5><span class="member-red">*</span> 이름</h5>
		                        <input type="text" name="name" class="name" placeholder="이름을 입력해주세요">
		                    </li>
		                    
		                    <li>
		                        <h5><span class="member-red">*</span> 닉네임</h5>
		                        <input type="text" name="nickname" placeholder="닉네임을 입력해주세요">
		                    </li>
		                    
		                     <li>
		                        <h5><span class="member-red">*</span> 이메일</h5>
		                        <input type="text" type="email" name="email" placeholder="이메일을 입력해주세요">
		                    </li>
		                    
		                    <li>
		                        <h5><span class="member-red">*</span> 전화번호</h5>
		                        <input type="tel" name="tel" class="tel" placeholder="010-1234-4567"><button>인증요청</button>
		                    </li>
		                    
		                    <li>
		                        <h5><span class="member-red">*</span> 주소</h5>
		                        <input type="text" name="address" class="address" placeholder="주소을 입력해주세요">
		                    </li>
		                    
		                    <li>
		                        <h5><span class="member-red">*</span> 추천인코드</h5>
		                        <input type="text" placeholder="선택사항">
		                    </li>
		                    
		                    <li>
		                        <p><input type="checkbox" style="width: 10px; height: 10px; display : inline-block; border: 1px solid #ccc;
		                         -webkit-appearance: none;"> 모두 동의합니다</p>
		                        <p><input type="checkbox" style="width: 10px; height: 10px; display : inline-block; border: 1px solid #ccc;
		                          -webkit-appearance: none;"> 이용약관 필수 동의</p>
		                        <p><input type="checkbox" style="width: 10px; height: 10px; display : inline-block; border: 1px solid #ccc;
		                         -webkit-appearance: none;"> 개인정보 처리방침 필수 동의</p>
		                        <p><input type="checkbox" style="width: 10px; height: 10px; display : inline-block; border: 1px solid #ccc;
		                         -webkit-appearance: none;"> 쿠폰/이벤트 알림 선택 동의<br>
		                            <span>SMS, 이메일을 통해 쿠폰 및 이벤트 정보를 받아보실수 있습니다</span>
		                        </p>
		                    </li>
		                    <li>
		                        <input type="submit" value="회원가입하기">
		                    </li>
		                </ul>
		
		            </form>
		        </div>
		    </div>
    

			</div>
		</div>
	</div> -->

