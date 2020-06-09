<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../resources/js/jquery.js"></script>

<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="banner">
			<div class="nav" >
				<ul>
					<li><a  class="btn">에니어그램</a>
					
						<!-- <div class="first w3-animate-fading">
							<ul>
								<li><a href="/anneagram/anneagram">에니어그램이란</a></li>
								<li><a href="/anneagram/nine_type">9가지의 유형</a></li>
								<li><a href="/anneagram/history">에니어그램의 역사</a></li>
							</ul>
						</div> -->
						
					</li>
					<li><a class="btn">성격테스트</a></li>
					
					<li><a class="btn">소식지</a>
						<!-- <div class="first">
							<ul>
								<li><a href="#">뉴스</a></li>
								<li><a href="#">칼럼</a></li>
								<li><a href="#">회원체험 및 사례</a></li>
							</ul>
						</div> -->
					</li>
					<li><a  class="btn">게시판</a>
						<!-- <div class="first">
							<ul>
								<li><a href="#">공지</a></li>
								<li><a href="/board/boardList">자유게시판</a></li>
								
							</ul>
						</div> -->
					</li>
					<li><a  class="btn">자료실</a>
						<!-- <div class="first">
							<ul>
								<li><a href="#">일반자료실</a></li>
								<li><a href="#">강의자료실</a></li>
								<li><a href="#">논문</a></li>
								<li><a href="#">상담</a></li>
							</ul>
						</div> -->
					</li>
				</ul>			
			</div>
			<div class="temp1">
				<ul>
					<li class="temp">
						<div class="nav-info-1">
							<ul>
								<li><a href="/anneagram/anneagram">에니어그램이란</a></li>
								<li><a href="/anneagram/nine_type">9가지의 유형</a></li>
								<li><a href="/anneagram/history">에니어그램의 역사</a></li>
								
							</ul>
						</div>
					</li>

					<li class="temp">
						<div class="nav-info-1">
							<ul>
								<li><a href="/test/test">테스트</a></li>
								<li><a href="/test/test_complete">테스트 결과</a></li>
								
							</ul>
						</div>
					</li>

					
					<li class="temp">
						<div class="nav-info-1">
						<ul>
							<li><a href="#">뉴스</a></li>
							<li><a href="#">칼럼</a></li>
							<li><a href="#">회원체험 및 사례</a></li>
							
						</ul>
					</div>
					</li>

					<li class="temp">
				
					<div class="nav-info-1">
						<ul>
							<li><a href="#">공지</a></li>
							<li><a href="/board/boardList">자유게시판</a></li>
							<li></li>
							<li></li>
						</ul>
					</div>
					</li>

					<li class="temp">
					<div class="nav-info-1">
						<ul>
							<li><a href="#">일반자료실</a></li>
							<li><a href="#">강의자료실</a></li>
							<li><a href="#">논문</a></li>
							<li><a href="#">상담</a></li>
						</ul>
					</div>
					</li>
					</ul>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var nav = document.querySelector('.nav');
		var temp = document.querySelector('.temp1');
		var closeButton = document.querySelector('.close-button');
		var n=0;
		nav.addEventListener('click',function(){
            if(n%2==0){
            	temp.style.display='block';
            }else{
            	temp.style.display='none';
            }
			n++;
        });
	
	</script>
	
</body>
</html>	