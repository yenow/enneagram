<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			<h2>Enneagram Test</h2>
			<h3>주의사항</h3>
			<div class="col-md-12 test">
				<ul>
					<c:forEach var="x" begin="1" end="10" step="1">
						<li class="testnum">
							<h3 class="query"></h3>
							<input type="radio" name="number${x}" value="1">
							<input type="radio" name="number${x}" value="2">
							<input type="radio" name="number${x}" value="3">
							<input type="radio" name="number${x}" value="4">
							<input type="radio" name="number${x}" value="5">
						</li>
					</c:forEach>
				</ul>

			</div>
			<div class="col-md-12 test2">
				<ul>
					<li>
						<progress value="0" max="100"></progress>
					</li>
					<li>
						<a onclick="return aaa(); replace_query();" class="button primary large">다음</a>
					</li>

				</ul>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	var page = 0; // 현재 페이지
	var value = []; // ajax를 통해서.. 데이터를 넘김. session을 이용해서 값을 저장

	/* 질문 저장 */
	var query = new Array(8); // 이차원 배열려 질문이 들어가있음
	for (var i = 0; i < 8; i++) {
		query[i] = new Array(11);
	}
	/* 질문 저장 */
	query[0][0] = '나는 무엇인가에 대하여 집중하여 통찰한다';
	query[0][1] = '나는 자기만족적이며 태평한 편이다';
	query[0][2] = '나는 모든일에 개선하기 위해 깊이 생각해서 행동한다';
	query[0][3] = '나에게는 지도자로서의 기질이 있다';
	query[0][4] = '나는 감성적이여서 혼자 있을 때가 많다';
	query[0][5] = '나는 자발적으로 재미있는 일을 즐긴다';
	query[0][6] = '나는 다른 사람들과 함께 일하기를 더 좋아한다';
	query[0][7] = '나는 문제가 있으면 풀릴때 까지 그것만 골똘히 생각한다';
	query[0][8] = '나는 의사 결정을 할 때 적절히 지도력을 발휘한다';
	query[0][9] = ' 나는 감정동요가 많지 않은 원만한 사람이다 ';

	query[1][0] = '나는 공적인 것 보다는 개인 생활에 대한 관심이 많다';
	query[1][1] = '나는 안전한 해결책을 원하고 되도록 갈등을 피한다';
	query[1][2] = '나는 혼자서 자신만의 고상한 취미를 즐긴다';
	query[1][3] = '나의 관심사는 다른 사람들을 도와주는 것이다';
	query[1][4] = '나는 모험적이며 위험을 감수한다';
	query[1][5] = '나는 능력을 발휘하는데 많은 시간을 투자한다';
	query[1][6] = '나는 낭만적이고 예술가적인 기질이 있다';
	query[1][7] = '나는 끊임 없이 변화하는 생활을 좋아한다';
	query[1][8] = '나는 사람들에게 칭찬을 잘 한다';
	query[1][9] = '나는 친구들과 긴장을 풀고 마음 편하게 지낸다';

	query[2][0] = '나는 다른 사람들보다 근면하며 책임감이 강하다';
	query[2][1] = '나는 명확한 지침이 있을 때 일의 능률이 오른다';
	query[2][2] = '내 생각보다는 남의 생각에 더 공감할 때가 많다';
	query[2][3] = '나는 늘 강해야한다고 생각한다';
	query[2][4] = '나는 정직하고 자제력이 있는 사람이다';
	query[2][5] = '나는 사랑하는 사람을 가끔 의심하는 경향이 있다 ';
	query[2][6] = '나는 사람들을 유쾌하고 편하게 대한다';
	query[2][7] = '나는 자극과 흥분을 유발하는 활동을 좋아한다';
	query[2][8] = '나는 감정보다는 이성을 추구한다';
	query[2][9] = '나는 과정보다는 결과를 중시한다';

	query[3][0] = '나는 어린아이처럼 명량하고 순진하다';
	query[3][1] = '나는 인간중심적이기보다는 오히려 목표중심적이다';
	query[3][2] = '나의 행동은 원칙에 기초를 둔다';
	query[3][3] = '나의 성공에 대해서도 가끔 평가 절하하는 경향이 있다';
	query[3][4] = '나는 완벽을 위해 끝까지 참고 노력한다';
	query[3][5] = '나는 사람들에게 영향력 있는 사람이다';
	query[3][6] = '나는 이방인처럼 느낄 때가 많다';
	query[3][7] = '나는 시간이나 돈을 아끼는 경향이 있다';
	query[3][8] = '나는 적응력이 뛰어나 상황에 적절히 대응한다';
	query[3][9] = '나는 잘 훈련되어있어 조직이나 집단에 헌신할 수 있다';

	query[4][0] = '나는 다른 사람들과는 다른 독특한 감정을 가지고 있다';
	query[4][1] = '나는 다른 사람들이 말하기 어려워하는 것을 이야기 한다';
	query[4][2] = '나는 분위기에 약하고 자기 생각에 골몰하는 편이다';
	query[4][3] = '나는 공격적이고 자기주장이 강하다';
	query[4][4] = '나는 사람들에게 지나친 경쟁을 강요한다';
	query[4][5] = '나의 관심사는 나를 둘러싼 세계를 이해하는 것이다';
	query[4][6] = '나는 사람들을 통제하려 한다';
	query[4][7] = '나는 친구들이 나에게 의지할 때 기분이 좋다 ';
	query[4][8] = '나는 모든 일에서 안전을 중요하게 생각한다';
	query[4][9] = '나는 사람들에 대한 배려보다는 일의 성취를 더 중요하게 여긴다';

	query[5][0] = '사람들은 나를 그냥 좋아한다';
	query[5][1] = '나는 사람들을 관심있게 대하고 보살피려 한다';
	query[5][2] = '나는 사람들을 지시하고 동기를 부여한다';
	query[5][3] = '나는 규칙을 잘 지키며 엄격하다';
	query[5][4] = '나는 세상에 대해 낙관적인 편이다';
	query[5][5] = '나는 권위를 믿지 않고 규칙을 무시한다';
	query[5][6] = '나는 미래에 대해 항상 열정을 가지고 있다';
	query[5][7] = '나는 강한 자신감으로 사람들을 설득시킨다';
	query[5][8] = '사람들은 내게 때로 용기가 필요하다고 말한다';
	query[5][9] = '나는 다른사람들의 신임을 얻을 수 있다';

	query[6][0] = '사람들이 하는 일은 각자의 몫이며, 나와 상관없는 일이다';
	query[6][1] = '나는 사람들과 친해지려고 많이 노력하고 있다';
	query[6][2] = '나는 여러가지 일들을 즐기며 새로운 경험을 갈망한다';
	query[6][3] = '나는 내 행동의 동기와 감정에 대해 회의스런 생각이 들 때가 있다';
	query[6][4] = '나는 정의감이 강하고 근면하다';
	query[6][5] = '나는 성공만이 애정을 획득할 수 있다고 믿는다';
	query[6][6] = '나는 한 가지 일에 정착하기가 어렵다';
	query[6][7] = '나는 지적이고 냉철하게 관찰하는 편이다';
	query[6][8] = '나는 결과에 대한 두려움 때문에 일을 질질 끄는 경우가 있다';
	query[6][9] = '나는 조화로움을 추구하는 평화주의자이다';

	query[7][0] = '나는 실패를 두려워하여 과장하는 경향이 있다';
	query[7][1] = '나는 타인의 만족을 위해 노력한다';
	query[7][2] = '나는 주로 나의 양심과 이성에 따른다';
	query[7][3] = '나는 감동적인 것을 추구하다가 혼자 우울해지기도 한다';
	query[7][4] = '나는 머리로 모든 것을 이해하고 판단한다';
	query[7][5] = '나는 충성할 만한 사랑이라고 판단되면 헌신할 수 있다';
	query[7][6] = '나는 타인의 호감을 얻기 위해 노력한다';
	query[7][7] = '나는 침체에 빠지지 않고 무엇인가를 끊임없이 행한다';
	query[7][8] = '나는 현실에 만족하지 않고 새로운 것을 추구한다';
	query[7][9] = '나는 비현실적이며 몽상가적인 기질을 가지고 있다';
	query[7][10] = '나는 친하게 지내는 사람과 영원한 우정을 유지하도록 노력한다';
	/* end) 질문 저장  */

	/* 페이지가 넘어갈 때 질문을 바꿈 */
	function replace_query() {
		if (page == 7) {
			var plusli = document.querySelector('.test ul');
			var li = document.createElement('li');
			li.className = 'testnum';
			li.innerHTML = "<h3 class='query'></h3><input type='radio'  name='number' value='1'><input type='radio'  name='number' value='2'><input type='radio'  name='number' value='3'><input type='radio'  name='number' value='4'><input type='radio'  name='number' value='5'>";
			plusli.appendChild(li);
		}
		var queryAll = document.querySelectorAll('.query');
		for (var i = 0; i < 11; i++) {
			if (query[page][i] != undefined) {
				queryAll[i].textContent = query[page][i];
			}
		}
		document.querySelector('.test2 progress').value = (100 / 8) * page;
		page++;
	}// replace_query
	replace_query();

	/* 문항이 다 체크 되었는지 확인하는 메서드 */
	function aaa(event) {
		var dataSet;
		var testnum = document.querySelectorAll('.testnum');
		var flag = 0;

		/* check가 되어있으면 그 input태그의 value 값을 가져옴 */
		for (var j = 0; j < testnum.length; j++) {
			for (var i = 0; i < testnum[j].getElementsByTagName('input').length; i++) {
				if (testnum[j].getElementsByTagName('input')[i].checked == true) {
					value[j] = testnum[j].getElementsByTagName('input')[i]
							.getAttribute('value');
					flag++;
				}
			}
		}
		console.log(flag);
		console.log(testnum.length);
		console.log(value);

		/* 문항이 다 선택되지 않았으면 다음으로 넘어가지 않음  */
		if (flag != testnum.length) {
			alert('문항을 다 선택해 주십시요');
			return false;
			// event.preventDefault();  이벤트가 더이상 진행되는걸 막는듯.. 근데 나는 작동이 안됨..
			// event.preventDefault();   // 오류가 나서 진행이 안되는 그런느낌으로감..
		} else {
			/* 문항을 다 입력했으면 check가 된 라디오박스를 취소해주는 작업  */
			for (var j = 0; j < testnum.length; j++) {
				for (var i = 0; i < testnum[j].getElementsByTagName('input').length; i++) {
					if (testnum[j].getElementsByTagName('input')[i].checked == true) {
						testnum[j].getElementsByTagName('input')[i].checked = false;
					}
				}
			}

			/* ajax로 서버에 페이지별로 데이터 보냄 */
			$.ajax({
				type : 'POST', // method
				url : '/test/test_ok?page=' + page, // POST 요청은 데이터가 요청 바디에 포함됩니다.
				async : 'true', // true
				data : JSON.stringify(value),
				contentType : 'application/json',
				dataType : 'text', // 명시하지 않을 경우 자동으로 추측
				success : function(data) {
					console.log(data)
					if (data != 'success') {
						location.href = '/test/test_complete';
					}
				},
				error : function(error) {
					console.log("error", error);
				}
			});

			replace_query();
			$('html').scrollTop(0);
		}

		/* 마지막 페이지일 경우*/
		/* $.ajax({
			type : 'POST', // method
			url : '/test/test_ok?page='+page, // POST 요청은 데이터가 요청 바디에 포함됩니다.
			async : 'true', // true
			data : JSON.stringify(value),
			contentType : 'application/json',
			dataType : 'text', // 명시하지 않을 경우 자동으로 추측
			success : function(data) {
				console.log(data)
			 	if(data!='success'){
					location.href='/test/test_complete';
				}  
			},
			error : function(error) {
				console.log("error", error);
			}
		}); */

	}//  /aaa()

	/* 
	function check(){
		var dataSet;
		var value=[];
		var testnum = document.querySelectorAll('.testnum');
		for(var j=0; j<testnum.length ; j++){
			for(var i=0; i <  testnum[j].getElementsByTagName('input').length ; i++){
	            if(testnum[j].getElementsByTagName('input')[i].getAttribute('checked')=='checked'){
	                value[i]=testnum[j].getElementsByTagName('input')[i].getAttribute('value')
	            }
	        }
		}	
	
	$.ajax({
		type : 'POST', // method
		url : 'entity_nobody_param', // POST 요청은 데이터가 요청 바디에 포함됩니다.
		async : 'true', // true
		data : JSON.stringify(dataSet),
		contentType : 'application/json',
		dataType : 'json', // 명시하지 않을 경우 자동으로 추측
		success : function(data, status, xhr) {
			responseJson(data);
		},
		error : function(error) {
			console.log("error", error);
			responseError(error);
		}
	});
	} */
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>

<%-- 

<jsp:include page="../c_info/header.jsp"></jsp:include>

<!-- Main -->
<div id="main">
	<div class="inner">

		<!-- Header -->
		<header id="header">
			<a href="${pageContext.request.contextPath}/test/test" class="logo"><strong>테스트</strong>
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
					<h1 class="y-t-center">성격테스트</h1>
					<h3 class="y-t-center">주의사항</h3>
					<div class="row">
						<div class="col-4 col-12-medium">
							
							<p>1.총 검사 시간은 12분 내외입니다</p>
						</div>
						<div class="col-4 col-12-medium">
						
							<p>2.질문이 기분 나쁘더라도 이해해주세요</p>
						</div>
						<div class="col-4 col-12-medium">
							
							<p>3.가운데 번호는 웬만하면 기피해주세요</p>
						</div>
						
					</div>
				</header>
			</div>
			<span class="image object"> <img src="${pageContext.request.contextPath}/resources/images/pic10.jpg" alt="" />
			</span>
		</section>

		<div class="test-main">
			<div class="container">
				<div class="test">
					<ul>
						<c:forEach var="x" begin="1" end="10" step="1">
							<li class="testnum">
								<h3 class="query"></h3> <input type="radio" name="number${x}" value="1"> <input type="radio" name="number${x}" value="2"> <input type="radio" name="number${x}" value="3"> <input type="radio" name="number${x}" value="4"> <input type="radio" name="number${x}" value="5">
							</li>
						</c:forEach>
					</ul>

				</div>
				<div class='test2'>
					<ul>
						<li><progress value="0" max="100"></progress></li>
						<li><a onclick="return aaa(); replace_query();" class="button primary large">다음</a></li>

					</ul>
				</div>

			</div>
		</div>

	</div>
</div>


<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>

<script type="text/javascript">
		var page = 0;	// 현재 페이지
		var value=[];   // ajax를 통해서.. 데이터를 넘김. session을 이용해서 값을 저장
		
		/* 질문 저장 */
		var query = new Array(8);  // 이차원 배열려 질문이 들어가있음
		for(var i=0; i<8 ; i++){
		    query[i] = new Array(11);
		}
		/* 질문 저장 */
		query[0][0] = '나는 무엇인가에 대하여 집중하여 통찰한다';
		query[0][1] = '나는 자기만족적이며 태평한 편이다';
		query[0][2] = '나는 모든일에 개선하기 위해 깊이 생각해서 행동한다';
		query[0][3] = '나에게는 지도자로서의 기질이 있다';
		query[0][4] = '나는 감성적이여서 혼자 있을 때가 많다';
		query[0][5] = '나는 자발적으로 재미있는 일을 즐긴다';
		query[0][6] = '나는 다른 사람들과 함께 일하기를 더 좋아한다';
		query[0][7] = '나는 문제가 있으면 풀릴때 까지 그것만 골똘히 생각한다';
		query[0][8] = '나는 의사 결정을 할 때 적절히 지도력을 발휘한다';
		query[0][9] = ' 나는 감정동요가 많지 않은 원만한 사람이다 ';	
	
		query[1][0] = '나는 공적인 것 보다는 개인 생활에 대한 관심이 많다';
		query[1][1] = '나는 안전한 해결책을 원하고 되도록 갈등을 피한다';
		query[1][2] = '나는 혼자서 자신만의 고상한 취미를 즐긴다';
		query[1][3] = '나의 관심사는 다른 사람들을 도와주는 것이다';
		query[1][4] = '나는 모험적이며 위험을 감수한다';
		query[1][5] = '나는 능력을 발휘하는데 많은 시간을 투자한다';
		query[1][6] = '나는 낭만적이고 예술가적인 기질이 있다';
		query[1][7] = '나는 끊임 없이 변화하는 생활을 좋아한다';
		query[1][8] = '나는 사람들에게 칭찬을 잘 한다';
		query[1][9] = '나는 친구들과 긴장을 풀고 마음 편하게 지낸다';
		
		query[2][0] = '나는 다른 사람들보다 근면하며 책임감이 강하다';
		query[2][1] = '나는 명확한 지침이 있을 때 일의 능률이 오른다';
		query[2][2] = '내 생각보다는 남의 생각에 더 공감할 때가 많다';
		query[2][3] = '나는 늘 강해야한다고 생각한다';
		query[2][4] = '나는 정직하고 자제력이 있는 사람이다';
		query[2][5] = '나는 사랑하는 사람을 가끔 의심하는 경향이 있다 ';
		query[2][6] = '나는 사람들을 유쾌하고 편하게 대한다';
		query[2][7] = '나는 자극과 흥분을 유발하는 활동을 좋아한다';
		query[2][8] = '나는 감정보다는 이성을 추구한다';
		query[2][9] = '나는 과정보다는 결과를 중시한다';	
	
		query[3][0] = '나는 어린아이처럼 명량하고 순진하다';
		query[3][1] = '나는 인간중심적이기보다는 오히려 목표중심적이다';
		query[3][2] = '나의 행동은 원칙에 기초를 둔다';
		query[3][3] = '나의 성공에 대해서도 가끔 평가 절하하는 경향이 있다';
		query[3][4] = '나는 완벽을 위해 끝까지 참고 노력한다';
		query[3][5] = '나는 사람들에게 영향력 있는 사람이다';
		query[3][6] = '나는 이방인처럼 느낄 때가 많다';
		query[3][7] = '나는 시간이나 돈을 아끼는 경향이 있다';
		query[3][8] = '나는 적응력이 뛰어나 상황에 적절히 대응한다';
		query[3][9] = '나는 잘 훈련되어있어 조직이나 집단에 헌신할 수 있다';
		
		query[4][0] = '나는 다른 사람들과는 다른 독특한 감정을 가지고 있다';
		query[4][1] = '나는 다른 사람들이 말하기 어려워하는 것을 이야기 한다';
		query[4][2] = '나는 분위기에 약하고 자기 생각에 골몰하는 편이다';
		query[4][3] = '나는 공격적이고 자기주장이 강하다';
		query[4][4] = '나는 사람들에게 지나친 경쟁을 강요한다';
		query[4][5] = '나의 관심사는 나를 둘러싼 세계를 이해하는 것이다';
		query[4][6] = '나는 사람들을 통제하려 한다';
		query[4][7] = '나는 친구들이 나에게 의지할 때 기분이 좋다 ';
		query[4][8] = '나는 모든 일에서 안전을 중요하게 생각한다';
		query[4][9] = '나는 사람들에 대한 배려보다는 일의 성취를 더 중요하게 여긴다';	
	
		query[5][0] = '사람들은 나를 그냥 좋아한다';
		query[5][1] = '나는 사람들을 관심있게 대하고 보살피려 한다';
		query[5][2] = '나는 사람들을 지시하고 동기를 부여한다';
		query[5][3] = '나는 규칙을 잘 지키며 엄격하다';
		query[5][4] = '나는 세상에 대해 낙관적인 편이다';
		query[5][5] = '나는 권위를 믿지 않고 규칙을 무시한다';
		query[5][6] = '나는 미래에 대해 항상 열정을 가지고 있다';
		query[5][7] = '나는 강한 자신감으로 사람들을 설득시킨다';
		query[5][8] = '사람들은 내게 때로 용기가 필요하다고 말한다';
		query[5][9] = '나는 다른사람들의 신임을 얻을 수 있다';
		
		query[6][0] = '사람들이 하는 일은 각자의 몫이며, 나와 상관없는 일이다';
		query[6][1] = '나는 사람들과 친해지려고 많이 노력하고 있다';
		query[6][2] = '나는 여러가지 일들을 즐기며 새로운 경험을 갈망한다';
		query[6][3] = '나는 내 행동의 동기와 감정에 대해 회의스런 생각이 들 때가 있다';
		query[6][4] = '나는 정의감이 강하고 근면하다';
		query[6][5] = '나는 성공만이 애정을 획득할 수 있다고 믿는다';
		query[6][6] = '나는 한 가지 일에 정착하기가 어렵다';
		query[6][7] = '나는 지적이고 냉철하게 관찰하는 편이다';
		query[6][8] = '나는 결과에 대한 두려움 때문에 일을 질질 끄는 경우가 있다';
		query[6][9] = '나는 조화로움을 추구하는 평화주의자이다';	
		
		query[7][0] = '나는 실패를 두려워하여 과장하는 경향이 있다';
		query[7][1] = '나는 타인의 만족을 위해 노력한다';
		query[7][2] = '나는 주로 나의 양심과 이성에 따른다';
		query[7][3] = '나는 감동적인 것을 추구하다가 혼자 우울해지기도 한다';
		query[7][4] = '나는 머리로 모든 것을 이해하고 판단한다';
		query[7][5] = '나는 충성할 만한 사랑이라고 판단되면 헌신할 수 있다';
		query[7][6] = '나는 타인의 호감을 얻기 위해 노력한다';
		query[7][7] = '나는 침체에 빠지지 않고 무엇인가를 끊임없이 행한다';
		query[7][8] = '나는 현실에 만족하지 않고 새로운 것을 추구한다';
		query[7][9] = '나는 비현실적이며 몽상가적인 기질을 가지고 있다';
		query[7][10]= '나는 친하게 지내는 사람과 영원한 우정을 유지하도록 노력한다';	
		/* end) 질문 저장  */
		
		/* 페이지가 넘어갈 때 질문을 바꿈 */
		function replace_query() {
			 if(page==7){
				var plusli = document.querySelector('.test ul');
				var li = document.createElement('li');
				li.className = 'testnum';
				li.innerHTML="<h3 class='query'></h3><input type='radio'  name='number' value='1'><input type='radio'  name='number' value='2'><input type='radio'  name='number' value='3'><input type='radio'  name='number' value='4'><input type='radio'  name='number' value='5'>";
				plusli.appendChild(li);
			} 
			var queryAll = document.querySelectorAll('.query');
			for(var i=0; i<11; i++){
				if(query[page][i]!=undefined){
					queryAll[i].textContent = query[page][i];
				}
			}
			document.querySelector('.test2 progress').value=(100/8)*page;
			page++;
		}// replace_query
		replace_query();
		
		/* 문항이 다 체크 되었는지 확인하는 메서드 */
		function aaa(event){
			var dataSet;
			var testnum = document.querySelectorAll('.testnum');
			var flag=0;
			
			/* check가 되어있으면 그 input태그의 value 값을 가져옴 */
			for(var j=0; j<testnum.length ; j++){
				for(var i=0; i <  testnum[j].getElementsByTagName('input').length ; i++){
		            if(testnum[j].getElementsByTagName('input')[i].checked==true){
		                value[j]=testnum[j].getElementsByTagName('input')[i].getAttribute('value'); 
		                flag++;
		            }
		        }
			}	
			console.log(flag);
			console.log(testnum.length);
			console.log(value);
			
			/* 문항이 다 선택되지 않았으면 다음으로 넘어가지 않음  */
			if(flag!=testnum.length){
				alert('문항을 다 선택해 주십시요');
				return false;
				// event.preventDefault();  이벤트가 더이상 진행되는걸 막는듯.. 근데 나는 작동이 안됨..
				// event.preventDefault();   // 오류가 나서 진행이 안되는 그런느낌으로감..
			}else{
				/* 문항을 다 입력했으면 check가 된 라디오박스를 취소해주는 작업  */
				for(var j=0; j<testnum.length ; j++){
					for(var i=0; i <  testnum[j].getElementsByTagName('input').length ; i++){
			            if(testnum[j].getElementsByTagName('input')[i].checked==true){
			               testnum[j].getElementsByTagName('input')[i].checked=false;
			            }
			        }
				}	
				
				/* ajax로 서버에 페이지별로 데이터 보냄 */
				$.ajax({
					type : 'POST', // method
					url : '/test/test_ok?page='+page, // POST 요청은 데이터가 요청 바디에 포함됩니다.
					async : 'true', // true
					data : JSON.stringify(value),
					contentType : 'application/json',
					dataType : 'text', // 명시하지 않을 경우 자동으로 추측
					success : function(data) {
						console.log(data)
					 	if(data!='success'){
							location.href='/test/test_complete';
						}  
					},
					error : function(error) {
						console.log("error", error);
					}
				});
				
				replace_query();
				$('html').scrollTop(0);
			}
			
			
			
			/* 마지막 페이지일 경우*/
			/* $.ajax({
				type : 'POST', // method
				url : '/test/test_ok?page='+page, // POST 요청은 데이터가 요청 바디에 포함됩니다.
				async : 'true', // true
				data : JSON.stringify(value),
				contentType : 'application/json',
				dataType : 'text', // 명시하지 않을 경우 자동으로 추측
				success : function(data) {
					console.log(data)
				 	if(data!='success'){
						location.href='/test/test_complete';
					}  
				},
				error : function(error) {
					console.log("error", error);
				}
			}); */
			
		}//  /aaa()
		
		 /* 
		function check(){
				var dataSet;
				var value=[];
				var testnum = document.querySelectorAll('.testnum');
				for(var j=0; j<testnum.length ; j++){
					for(var i=0; i <  testnum[j].getElementsByTagName('input').length ; i++){
			            if(testnum[j].getElementsByTagName('input')[i].getAttribute('checked')=='checked'){
			                value[i]=testnum[j].getElementsByTagName('input')[i].getAttribute('value')
			            }
			        }
				}	
			
			$.ajax({
				type : 'POST', // method
				url : 'entity_nobody_param', // POST 요청은 데이터가 요청 바디에 포함됩니다.
				async : 'true', // true
				data : JSON.stringify(dataSet),
				contentType : 'application/json',
				dataType : 'json', // 명시하지 않을 경우 자동으로 추측
				success : function(data, status, xhr) {
					responseJson(data);
				},
				error : function(error) {
					console.log("error", error);
					responseError(error);
				}
			});
		} */
		
</script>

 --%>