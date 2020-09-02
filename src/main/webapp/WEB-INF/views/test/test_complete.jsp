<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${type eq null }">
	<script>
		alert('테스트를 먼저 해주세요');
		location.href = '/enneagram/test/test';
	</script>
</c:if>

<jsp:include page="../info/header.jsp"></jsp:include>

<!-- <div class="js-fullheight"> -->
<div class="hero-wrap js-fullheight">
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>

<section class="">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2 class="text-center my-5">테스트 결과</h2>
				<!-- 간단한 소개 -->
				<div></div>
				
				<canvas id="myChart"></canvas>

				<!-- eclass -->
				<c:choose>
					<c:when test="${eclass eq 1}">
				        	<h3 class="text-center my-3">머리형</h3>
				    </c:when>
					<c:when test="${eclass eq 2}">
				      		<h3 class="text-center my-3">가슴형</h3>
				    </c:when>
					<c:otherwise>
				      		<h3 class="text-center my-3">장형</h3>
				    </c:otherwise>
				</c:choose>
				<div style="min-height: 200px">${eclassContent }</div>


				<!-- type -->
				<h3 class="text-center my-3">${type }번유형이란?</h3>
				<div style="min-height: 500px">${typeContent }</div>


				<p>다른유형도 있어요</p>

				<div class="col-12 text-center my-3">
					<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=enneagram" class="btn btn-primary mb-5">다른유형 알아보기</a>
				</div>
			</div>
		</div>
	</div>
</section>

<script>

	var ctx = document.getElementById('myChart');
	
	
	
	new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '1번유형', '2번유형', '3번유형', '4번유형', '5번유형', '6번유형','7번유형', '8번유형', '9번유형' ],
			datasets : [ {
				label : 'result',
				data : [ ${typeArray[0]},  ${typeArray[1]},  ${typeArray[2]},  ${typeArray[3]},  ${typeArray[4]},  ${typeArray[5]}, ${typeArray[6]},  ${typeArray[7]},  ${typeArray[8]} ],         // 아작스로 여기에 데이터넣자
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)','rgba(15,76,117,0.2)','rgba(56,41,51,0.2)' ,'rgba(181,43,101,0.2)'],
				borderColor : [ 'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' , 'rgba(15,76,117,1)','rgba(56,41,51,1)' ,'rgba(181,43,101,1)' ],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						min : 0,
						max : 50
					}
				} ]
			} 
		}
	});
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>





<%-- 
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
					<h1 class="y-t-center">테스트 결과</h1>
					
					
				</header>
			</div>
		</section>

		<div id="test-main">
			<div class="container">
				<div class="content">
					<div class="test-complete">
						<c:if test="${first != null }">
				
						
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

							<div class="result y-t-center">	
							<a href="${pageContext.request.contextPath}/anneagram/${first }_type" class="button primary large">${first }번성향</a></a>
							<a href="${pageContext.request.contextPath}/anneagram/${second }_type" class="button primary large">${second }번성향</a></a>
							<a href="${pageContext.request.contextPath}/anneagram/${third }_type" class="button primary large">${third }번성향</a></a>
							<a href="${pageContext.request.contextPath}/anneagram/nine_type" class="button primary large">9가지의 유형</a></a>	
							</div>
						</c:if>
						
						<c:if test="${test == null }">
							<h1 class="y-t-center">아직 테스트를 보지 않으셨군요..!</h1>
							<p class="y-t-center"><a href="${pageContext.request.contextPath}/test/test" class="button primary large ">테스트</a></p>
							
							
						</c:if>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>


<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include> --%>