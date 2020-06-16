<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">

  <style>
        div,p,input,a {margin: 0; padding: 0;}

        .login {width: 500px; margin: 0 auto; margin-top: 20px;}
        .logo {width: 100px; height: 100px; margin: 0 auto; background : #ccc ;}
       
        .font_test3 { text-decoration:line-through;  }

        .sns_login {}
        .sns_login h5 {text-align: center; margin: 20px 0;}
        .sns_login h5 pre {display: inline; text-decoration:line-through;}
        .sns_login p {text-align: center; margin-top: 5px;}
        .sns_login button {border: 1px solid #ccc; margin: 0 auto; background: #fff; font-size: 11px;}


        .email_login {text-align: center; margin: 20px 0;}
        .email_login h5 {text-align: center; margin: 20px 0;}
        .email_login h5 pre {display: inline; text-decoration:line-through}
        .email_login p {vertical-align: middle;}
        .email_login input {width: 100%; height: 40px; margin-bottom: 10px; border: 1px solid #ccc; }
        .email_login input:last-child {background: #b2ebf2; color: #fff; border: none; margin-top: 10px;}
        .email_login input:hover {border: 1px solid #ccc;}
        .email_login button {width: 100%; height: 40px; margin-bottom: 10px;
            border: 1px solid #b2ebf2; color: #b2ebf2;
        }
        .email_login .helper {display: inline-block; }
        .email_login .email_info {display: inline-block; vertical-align: middle; margin:0; padding: 0;}
    	.email_login .email_info input {margin: 0; padding: 0;}
    </style>
</head>
<body>

	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

	<div id="content">
		<div class="container">
			<div class="content">
			  <div class="login">
			       
			        <div class="sns_login">
			            
			            <h5><pre>                                   </pre>
			                가운데 줄긋기
			                <pre>                                   </pre></h5>
			            <img src="/resources/img/kakao.png">
			            <p>
			                <button>다른방법으로 로그인</button>
			            </p>
			          
			        </div>
			        <div class="email_login">
			            <h5><pre>                                   </pre>
			          			      이메일 로그인
			                <pre>                                   </pre></h5>
			            <form action="login_ok" method="post" >
			                <input type="text" name="user_id" placeholder="아이디" >
			                <input type="password" name="user_pw" placeholder="비밀번호" >
			                <p>
			                <div class="helper"></div>
			                <div class="email_info" style="float:left; font-size: 15px; color: rgb(48, 48, 48);" >
			                    <input type="checkbox" style="width: 15px; height: 15px;">이메일 저장하기</div> 
			                <div class="email_info" style="float:right; font-size: 15px; color:  rgb(48, 48, 48); ">
			                    <a>아이디</a>/<a>비밀번호</a>를 잊어버리셨나요?</div>
			                </p>
			                <input type="submit" value="로그인" >
			            </form>
			            <button class="member"><a>회원가입</a></button>
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