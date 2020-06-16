<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="../../resources/js/member.js"></script>
<!-- C:\Users\ysy\Desktop\spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\anneagram\WEB-INF\views\member javascript의 실제 경로인데, 
\WEB-INF\views 는 servlet-context.xml에 생략하도록 설정이 되어있음. 그렇기 때문에 그 view에 파일이 있다면 거기서 ../ 하면 webapp로 가지는듯
-->
<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">

<style type="text/css">
.content {text-align: left;}

body {
	background: rgba(248, 225, 225, 0.301);
}

div, p, input, li {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

.member {
	width: 400px;
	margin: 0 auto;
	padding-top: 30px;
}

.member-header .banner {
	background: url("img/sp-icon.png");
	width: 200px;
	height: 110px;
	margin: 0 auto;
}

.member-header h5 {
	text-align: center;
	margin: 10px 0;
}

.member-header h5 pre {
	display: inline;
	text-decoration: line-through
}

.member-body input[type="submit"] {
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	background: aqua;
	color: #fff;
	font-size:15px;
	border: none;
	margin-top: 10px;
}

.member-body input[type="text"],input[type="password"]  {
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
}

.member-body input[type="tel"] {
	width: 60%;
	height: 40px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
}

.member-body button {
	width: 38%;
	height: 43px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	margin-left: 5px;
}

.member-body button:hover {
	border: 1px solid #ccc;
}

.member-red {
	color: aqua ;
}

.email_login input:hover {
	border: 1px solid #ccc;
}

.member-body h5 {margin: 10px 0;}

.member-body ul li {margin: 10px 0;}

.member-body p {
	font-size: 13px;
	font-weight: bold;
	margin: 5px 0;
	text-align: left;
}

.member-body p:first-child {
	border-bottom: 1px solid black;
	padding: 10px 0;
}

.member-body p span {
	color: rgb(160, 160, 160);
}

input{
-webkit-appearance: none;
}
</style>

</head>
<body>
	<!-- <script>
  window.addEventListener("load",function(){
    var memberInsert = this.document.querySelector("#member-insert");
    var user_id = this.memberInsert.querySelector(".user_id");
    var user_pw = this.memberInsert.querySelector(".user_pw");
    var name = this.memberInsert.querySelector(".name");
    var tel = this.memberInsert.querySelector(".tel");
    var address = this.memberInsert.querySelector(".address");

    
    var check = function () {
		if(user_id.value == ""){
			alert("id를 입력해주세요");
			return false;
		}
		
		if(user_pw.value == ''){
			alert("password를 입력해주세요");
			return false;
		}
		
		if(name.value == ''){
			alert("이름를 입력해주세요");
			return false;
		}
		
		if(tel.value == ''){
			alert("전화번호를 입력해주세요");
			return false;
		}

		if(address.value == ''){
			alert("주소를 입력해주세요");
			return false;
		}
		
		return true;
	};
	
	 memberInsert.onsumit = return check();
});  
</script> -->

	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

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
	</div>


	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>

</body>
</html>

<!-- <form action="member_insert_ok" method="post" id="member-insert"
					onsubmit="return check();">
					<table>
						<caption>회원가입 양식</caption>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="user_id" class="user_id"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw" class="user_pw"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" class="name"></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" name="nickname"></td>
						</tr>
						<tr>
							<td>번호</td>
							<td><input type="tel" name="tel" class="tel"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="address" class="address"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" name="제출"><input
								type="button" value="이전"></td>
						</tr>

					</table>
				</form> -->