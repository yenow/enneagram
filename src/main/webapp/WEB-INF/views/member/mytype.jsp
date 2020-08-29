<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
			<div class="col-md-9 ftco-animate fadeInUp ftco-animated">
				<h2 class="text-center">내 성향</h2>
				<label class="my-1 mr-2" for="inlineFormCustomSelectPref">최근 검사</label>
				<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" onchange="changePersonality(this.value);">
					<option selected>Choose...</option>
					<c:forEach var="p" items="${pList }">
						
						<%-- <fmt:formatDate var="date" pattern="yyyy-MM-dd" value="${p.regdate}" /> --%>
						<option value="${p.pno }">${p.regdate}</option>
					</c:forEach>
				</select>


				<canvas id="myChart"></canvas>

				<!-- 테스트를 했을 경우 -->
				<c:if test="${pList ne null }">
					<h2 class="my-3 text-center">내 성향</h2>
					<!-- 머리 가슴 장 -->
					<div class="mypage-eclass">
						<h3 class="text-center">${eclass.title }</h3>
						<div style="min-height: 200px">${eclass.content }</div>
					</div>
					<!-- 내 유형 -->
					<div class="mypage-type">
						<h3 class="text-center">${type.title }</h3>
						<div style="min-height: 500px">${type.content }</div>
					</div>

					<!-- 아직 준비가 안됨 -->
					<!-- 
					<h2>유형별 관계</h2>
					<div></div
					 -->
				</c:if>
				<c:if test="${pList eq null }">
					<div class="text-center mt-5">
					    <p class="text-center">이런! 아직 테스트를 한적이 없군요!</p>
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/test/test">내 성향 테스트 하러가기</a>
					</div>
					
				</c:if>
			</div>

			<!-- sidebar -->
			<div class="col-md-3 sidebar ftco-animate order-first fadeInUp ftco-animated">
				<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
					<div class="categories">
						<h3>마이페이지</h3>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/member/mytype"> 내 유형 </a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/myProfile"> 나의 프로필 </a>
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
	
	
	
	new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '1번', '2번', '3번', '4번', '5번', '6번','7번', '8번', '9번' ],
			datasets : [ {
				label : 'result',
				data : [ ${recently.one},  ${recently.two},  ${recently.three},  ${recently.four},  ${recently.five},  ${recently.six},  ${recently.seven},  ${recently.eight},  ${recently.nine} ],         // 아작스로 여기에 데이터넣자
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
	
	console.log(myChart);
	console.log(ctx);
	console.log(Chart); 
	
	
	$(document).ready(function() {
		
		
		changePersonality = function(pno) {
			
			/* var v = $('#inlineFormCustomSelectPref option:selected').value();
			console.log(v); */
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/myTypeAjax?pno="+pno ,
				type : "GET",
				dataType: 'json',
				success : function (pdata) {
					console.log(pdata);
	
					new Chart(ctx, {
						type : 'bar',
						data : {
							labels : [ '1번', '2번', '3번', '4번', '5번', '6번','7번', '8번', '9번' ],
							datasets : [ {
								label : '# of Votes',
								data : [ pdata.typeData.one,  pdata.typeData.two,  pdata.typeData.three,  pdata.typeData.four,  pdata.typeData.five,  pdata.typeData.six,  pdata.typeData.seven,  pdata.typeData.eight,  pdata.typeData.nine ],         // 아작스로 여기에 데이터넣자
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

					$('.mypage-eclass h3').text(pdata.eclass.title);
					$('.mypage-eclass div').html(pdata.eclass.content);
					$('.mypage-type h3').text(pdata.type.title);
					$('.mypage-type div').html(pdata.type.content);
				}
			});
		} 
	});
	
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>
