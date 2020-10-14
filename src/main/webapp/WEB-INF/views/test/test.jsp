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


	<div class="container-sm">
		<div class="row justify-content-center content-margin">
		
			<h2 class="text-center col-12">Enneagram Test</h2>
			
			<div class="row justify-content-center col-12 my-5 text-center">
				<h3 class="col-12 y-notice">주의사항</h3>

				<span class="col-4 py-4">총 검사 시간은 12분 내외입니다</span>
				<span class="col-4 py-4">질문이 기분 나쁘더라도 이해해주세요</span>
				<span class="col-4 py-4">가운데 번호는 웬만하면 기피해주세요</span>
			</div>

			<!-- 테스트 -->
			<div class="col-12 test">
				<ul>
					<c:forEach var="x" begin="1" end="9" step="1">
						<li class="testnum">
							<h3 class="query col-12 query${x }"></h3>
							<div class="col-12 text-center">
								<input type="radio" name="number${x}" value="1">
								<input type="radio" name="number${x}" value="2">
								<input type="radio" name="number${x}" value="3">
								<input type="radio" name="number${x}" value="4">
								<input type="radio" name="number${x}" value="5">
							</div>
							
						</li>
					</c:forEach>
				</ul>

			</div>
			<div class="col-12 test2 my-4">
				<ul>
					<li>
						<progress value="0" max="100"></progress>
					</li>
					<li class="text-center">
						<a onclick="return submit();" class="btn btn-primary btn-lg">다음</a>
					</li>

				</ul>
			</div>
		</div>
	</div>


<script type="text/javascript">
	var pageNum = 1; // 현재 페이지
	var value = []; // ajax를 통해서.. 데이터를 넘김. session을 이용해서 값을 저장
	
	// 아작스로 질문을 가져옴
	function getQuery(page) {
		$.ajax({
			type : 'POST', 
			url : '/enneagram/test/query',  
			async : 'true', 
			data : {'pageNum':page},
			dataType : 'JSON', // 명시하지 않을 경우 자동으로 추측
			success : function(data) {
				pageNum++;
				console.log(data);
				for(var i=1;i<=9; i++){
					console.log(data[i-1].query);
					$('.query'+i).html(data[i-1].query);
				}
				
			},
			error : function(error) {
				console.log("error", error);
			}
		});
	}
	getQuery(1);
	
	function submit() {
		var dataSet;
		var testnum = document.querySelectorAll('.testnum');
		var flag = 0;

		// check가 되어있으면 그 input태그의 value 값을 가져옴 
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

		// 문항이 다 선택되지 않았으면 다음으로 넘어가지 않음  
		if (flag != testnum.length) {
			alert('문항을 다 선택해 주십시요');
			return false;
		} else {
			// 문항을 다 입력했으면 check가 된 라디오박스를 취소해주는 작업  
			for (var j = 0; j < testnum.length; j++) {
				for (var i = 0; i < testnum[j].getElementsByTagName('input').length; i++) {
					if (testnum[j].getElementsByTagName('input')[i].checked == true) {
						testnum[j].getElementsByTagName('input')[i].checked = false;
					}
				}
			}

			// ajax로 서버에 페이지별로 데이터 보냄 
			$.ajax({
				type : 'POST', // method
				url : '/enneagram/test/submit?pageNum=' + pageNum, // POST 요청은 데이터가 요청 바디에 포함됩니다.
				async : 'true', // true
				data : JSON.stringify(value),
				contentType : 'application/json',
				dataType : 'text', // 명시하지 않을 경우 자동으로 추측
				success : function(data) {
					console.log(data)
					// 마지막 페이지 문항 완료시
					if (data != 'success') {
						location.href = '/enneagram/test/test_complete';
					}
				},
				error : function(error) {
					console.log("error", error);
				}
			});

			$('html').scrollTop(0);
			console.log(pageNum);
			getQuery(pageNum);
		
		}
	}
	
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>
	
