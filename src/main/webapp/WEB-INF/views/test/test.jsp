<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">

<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="../../resources/js/jquery.js"></script>
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
				<div class="test-notice">
					<div class="test-notice-position">
						<div class="notice1">
							<p> 총 검사 시간은 12분 내외입니다</p>
						</div>
						<div class="notice2">
							<p> 질문이 기분 나쁘더라도 이해해주세요</p>
						</div>
						<div class="notice3">
							<p> 보통은 웬만하면 기피해주세요</p>
						</div>
						</div>
					</div>
				</div>
			<div class="test">
					<ul>
					
					<c:forEach var="x" begin="1" end="10" step="1" >
						<li class="testnum">
							<h3 class="query"></h3>
							<input type="radio"  name="number${x}" value="1">
							<input type="radio"  name="number${x}" value="2">
							<input type="radio"  name="number${x}" value="3">
							<input type="radio"  name="number${x}" value="4">
							<input type="radio"  name="number${x}" value="5">
						</li>
					</c:forEach>
						
					</ul>
					
			</div>
			<div class='test2'>
				<ul>
					<li><button onclick="aaa(); replace_query();">다음</button></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>

	<script type="text/javascript">
		var page = 0;	// 현재 페이지
		var value=[];   // ajax를 통해서.. 데이터를 넘김. session을 이용해서 값을 저장
		
		/* 질문 저장 */
		var query = new Array(8);
		for(var i=0; i<8 ; i++){
		    query[i] = new Array(11);
		}
		query[0][0] = '질문1';
		query[0][1] = '질문2';
		query[0][2] = '질문3';
		query[0][3] = '질문4';
		query[0][4] = '질문5';
		query[0][5] = '질문6';
		query[0][6] = '질문7';
		query[0][7] = '질문8';
		query[0][8] = '질문9';
		query[0][9] = '질문10';	
	
		query[1][0] = '질문11';
		query[1][1] = '질문12';
		query[1][2] = '질문13';
		query[1][3] = '질문14';
		query[1][4] = '질문15';
		query[1][5] = '질문16';
		query[1][6] = '질문17';
		query[1][7] = '질문18';
		query[1][8] = '질문19';
		query[1][9] = '질문20';
		
		query[2][0] = '질문21';
		query[2][1] = '질문22';
		query[2][2] = '질문23';
		query[2][3] = '질문24';
		query[2][4] = '질문25';
		query[2][5] = '질문26';
		query[2][6] = '질문27';
		query[2][7] = '질문28';
		query[2][8] = '질문29';
		query[2][9] = '질문30';	
	
		query[3][0] = '질문31';
		query[3][1] = '질문32';
		query[3][2] = '질문33';
		query[3][3] = '질문34';
		query[3][4] = '질문35';
		query[3][5] = '질문36';
		query[3][6] = '질문37';
		query[3][7] = '질문38';
		query[3][8] = '질문39';
		query[3][9] = '질문40';
		
		query[4][0] = '질문41';
		query[4][1] = '질문42';
		query[4][2] = '질문43';
		query[4][3] = '질문44';
		query[4][4] = '질문45';
		query[4][5] = '질문46';
		query[4][6] = '질문47';
		query[4][7] = '질문48';
		query[4][8] = '질문49';
		query[4][9] = '질문50';	
	
		query[5][0] = '질문51';
		query[5][1] = '질문52';
		query[5][2] = '질문53';
		query[5][3] = '질문54';
		query[5][4] = '질문55';
		query[5][5] = '질문56';
		query[5][6] = '질문57';
		query[5][7] = '질문58';
		query[5][8] = '질문59';
		query[5][9] = '질문60';
		
		query[6][0] = '질문61';
		query[6][1] = '질문62';
		query[6][2] = '질문63';
		query[6][3] = '질문64';
		query[6][4] = '질문65';
		query[6][5] = '질문66';
		query[6][6] = '질문67';
		query[6][7] = '질문68';
		query[6][8] = '질문69';
		query[6][9] = '질문70';	
		
		query[7][0] = '질문71';
		query[7][1] = '질문72';
		query[7][2] = '질문73';
		query[7][3] = '질문74';
		query[7][4] = '질문75';
		query[7][5] = '질문76';
		query[7][6] = '질문77';
		query[7][7] = '질문78';
		query[7][8] = '질문79';
		query[7][9] = '질문80';
		query[7][10]= '질문81';	
		/* end) 질문 저장  */
		console.log(query);
		console.log(page);
		
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
				// event.preventDefault();  이벤트가 더이상 진행되는걸 막는듯.. 근데 나는 작동이 안됨..
				 event.preventDefault();   // 오류가 나서 진행이 안되는 그런느낌으로감..
			}else{
				/* 문항을 다 입력했으면 check가 된 라디오박스를 취소해주는 작업  */
				for(var j=0; j<testnum.length ; j++){
					for(var i=0; i <  testnum[j].getElementsByTagName('input').length ; i++){
			            if(testnum[j].getElementsByTagName('input')[i].checked==true){
			               testnum[j].getElementsByTagName('input')[i].checked=false;
			            }
			        }
				}	
			}
			
			/* 마지막 페이지일 경우*/
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
</body>
</html>


<!-- 
					<ul>
						<li>
							<h3>질문1</h3>
							<input type="radio"  name="number1" value="1">
							<input type="radio"  name="number1" value="2">
							<input type="radio"  name="number1" value="3">
							<input type="radio"  name="number1" value="4">
							<input type="radio"  name="number1" value="5">
							</li>
						<li>
							<h3>질문2</h3>
							<input type="radio" name="number2" value="1">
							<input type="radio" name="number2" value="2">
							<input type="radio" name="number2" value="3">
							<input type="radio" name="number2" value="4">
							<input type="radio" name="number2" value="5">
						</li>
						<li>
							<h3>질문3</h3>
							<input type="radio" name="number3" value="1">
							<input type="radio" name="number3" value="2">
							<input type="radio" name="number3" value="3">
							<input type="radio" name="number3" value="4">
							<input type="radio" name="number3" value="5">
						</li>
						<li>
							<h3>질문4</h3>
							<input type="radio" name="number4" value="1">
							<input type="radio" name="number4" value="2">
							<input type="radio" name="number4" value="3">
							<input type="radio" name="number4" value="4">
							<input type="radio" name="number4" value="5">
						</li>
					    <li>
					    <h3>질문5</h3>	
							<input type="radio" name="number5" value="1">
							<input type="radio" name="number5" value="2">
							<input type="radio" name="number5" value="3">
							<input type="radio" name="number5" value="4">
							<input type="radio" name="number5" value="5">
						</li>
						<li>
							<h3>질문6</h3>
							<input type="radio" name="number6" value="1">
							<input type="radio" name="number6" value="2">
							<input type="radio" name="number6" value="3">
							<input type="radio" name="number6" value="4">
							<input type="radio" name="number6" value="5">
						</li>
						<li>
							<h3>질문7</h3>
							<input type="radio" name="number7" value="1">
							<input type="radio" name="number7" value="2">
							<input type="radio" name="number7" value="3">
							<input type="radio" name="number7" value="4">
							<input type="radio" name="number7" value="5">
						</li>
						<li>
							<h3>질문8</h3>
							<input type="radio" name="number8" value="1">
							<input type="radio" name="number8" value="2">
							<input type="radio" name="number8" value="3">
							<input type="radio" name="number8" value="4">
							<input type="radio" name="number8" value="5">
						</li>
						<li>
							<h3>질문9</h3>
							<input type="radio" name="number9" value="1">
							<input type="radio" name="number9" value="2">
							<input type="radio" name="number9" value="3">
							<input type="radio" name="number9" value="4">
							<input type="radio" name="number9" value="5">
						</li>
						<li>
							<h3>질문10</h3>
							<input type="radio" name="number10" value="1">
							<input type="radio" name="number10" value="2">
							<input type="radio" name="number10" value="3">
							<input type="radio" name="number10" value="4">
							<input type="radio" name="number10" value="5">
						</li>
						<li><input type="submit" value="다음" onclick=""></li>
					</ul>
					 -->
				