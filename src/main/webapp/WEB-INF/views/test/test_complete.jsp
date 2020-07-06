<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../c_info/header.jsp"></jsp:include>

<!-- Main -->
<div id="main">
	<div class="inner">

		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"> <strong>Introduce</strong>
			</a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"> <span class="label">Twitter</span>
				</a></li>
				<li><a href="#" class="icon brands fa-facebook-f"> <span class="label">Facebook</span>
				</a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"> <span class="label">Snapchat</span>
				</a></li>
				<li><a href="#" class="icon brands fa-instagram"> <span class="label">Instagram</span>
				</a></li>
				<li><a href="#" class="icon brands fa-medium-m"> <span class="label">Medium</span>
				</a></li>
			</ul>
		</header>

		<!-- Banner -->
		<section id="banner">
			<div class="content">
				<header>
					<h1>테스트 결과</h1>
					
					
				</header>
			</div>
		</section>

		<div id="test-main">
			<div class="container">
				<div class="content">
					<div class="test-complete">
						<c:if test="${first != null }">
				
							<h1 style="font-size: 40px;">테스트 결과</h1>
							<h2 style="text-align: center;">당신의 1등 성향은 : ${first }번 입니다!</h2>
							<h2 style="text-align: center;">당신의 2등 성향은 : ${second }번 입니다!</h2>
							<h2 style="text-align: center;">당신의 3등 성향은 : ${third }번 입니다!</h2>

							<c:if test="${first ==1 }">
								<jsp:include page="type1.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==2 }">
								<jsp:include page="type2.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==3 }">
								<jsp:include page="type3.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==4 }">
								<jsp:include page="type4.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==5 }">
								<jsp:include page="type5.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==6 }">
								<jsp:include page="type6.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==7 }">
								<jsp:include page="type7.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==8 }">
								<jsp:include page="type8.jsp"></jsp:include>
							</c:if>
							<c:if test="${first ==9 }">
								<jsp:include page="type9.jsp"></jsp:include>
							</c:if>

							<div class="result">
								<button>
									<a href="/anneagram/nine_type"></a>다른 성향 <br>자세히 알아보기</a>
								</button>
							</div>
						</c:if>
						<c:if test="${test == null }">
							<h1>아직 테스트를 보지 않으셨군요..!</h1>
							<button>
								<a href="/test/test">테스트 <br>하러 가기
								</a>
							</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>


<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>