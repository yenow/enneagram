<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 로그인 유효성 검증 코드 해야함 -->

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
		<div class="row justify-content-center content-margin">
			<div class="col-md-8 ftco-animate fadeInUp ftco-animated">
				<h2 class="text-center">내 성향</h2>
					<label class="my-1 mr-2" for="inlineFormCustomSelectPref">최근 검사</label>
					 <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
						<option selected>Choose...</option>
						<c:forEach var="p" items="${pList }">
							<option value="${p.pno }">${p.regdate}</option>
						</c:forEach>
					</select> 


				<canvas id="myChart"></canvas>
				
				<h2 class="my-3">내 성향</h2>
				<!-- eclass -->
				<c:choose>
					<c:when test="${eclass.eclass eq 1}">
				        	<h3 class="text-center">머리형</h3>
				    </c:when>
					<c:when test="${eclass.eclass eq 2}">
				      		<h3 class="text-center">가슴형</h3>
				    </c:when>
					<c:otherwise>
				      		<h3 class="text-center">장형</h3>
				    </c:otherwise>
				</c:choose> 
				<div style="min-height: 200px">${eclass.content }</div>
				
				<h3 class="text-center">${type.type }번유형이란?</h3>
				<div style="min-height: 500px">${type.content }</div>
				
				<h2>유형별 관계</h2>
				<div></div>
			</div>

			<div class="col-md-4 sidebar ftco-animate order-first fadeInUp ftco-animated">
				

					<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
						<div class="categories">
							<h3>마이페이지</h3>
							<ul>
								<li>
									<a href="${pageContext.request.contextPath}/member/mypage"> 내 유형 </a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/enneagram/enneagram?category=history"> 개인정보수정 </a>
								</li>
							</ul>
						</div>

					
				</div>
			</div>
		</div>
	</div>
</section>

<script>

	var ctx = document.getElementById('myChart');
	
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '1번', '2번', '3번', '4번', '5번', '6번','7번', '8번', '9번' ],
			datasets : [ {
				label : '# of Votes',
				data : [ 12, 19, 3, 5, 2, 3,10,10,10 ],         // 아작스로 여기에 데이터넣자
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
						beginAtZero : true
					}
				} ]
			}
		}
	});
	
	console.log(myChart);
	console.log(ctx);
	console.log(Chart); 
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>
