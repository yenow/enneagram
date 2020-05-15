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
				<form action="member_insert_ok" method="post" id="member-insert"
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
				</form>
			</div>
		</div>
	</div>


	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>

</body>
</html>