<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용</title>
<script src="../resources/js/jquery.js"></script>

<link rel="stylesheet" href="../../resources/css/bootstrap.css?after">
<link rel="stylesheet" href="../../resources/css/style.css?after">
<link rel="stylesheet" href="../../resources/css/reset.css?after">

<style>
 #modDiv{
 	width:300px;  /* div 폭을 지정*/
 	height:100px; 
 	background-color:gray;
 	position:absolute; top:50%; left:50%; 
 	margin-top:-50px;  /* css주석문 기호, 바깥 위쪽 여백 */
 	margin-left:-150px;
 	padding:10px;
 	z-index:1000;  /* position 속성이 absolute나 fixed로 설정된 곳에서 사용함
 	이 속성은 요소가 겹쳐지는 순서를 제어할 수 있다. 값이 큰 것이 먼저 나온다. */
 	
 }
</style>

</head>
<body>
	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

	<div id="content2">
		<div class="container">
			<div class="content2">
				<form action="boardUpdate" method="post">
					<input type="hidden" name="bno" value="${b.bno }">
					<table border="1">
						<caption>게시판 보기</caption>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="${b.title }"
								readonly></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td><input type="text" name="user_id" value="${b.nickname }"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td><p>${b.cnt}</p></td>
						</tr>
						<tr>
							<td>등록일</td>
							<td><p>${b.regdate}></p></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">내용</td>
						</tr>
						<tr>
							<td colspan="2"><textarea rows="10" cols="20" name="content"
									readonly="readonly">${b.content }</textarea></td>
						</tr>

						<c:if test="${b.user_id eq login.user_id}">
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="submit" value="수정"> <a
									href="boardDelete?bno=${b.bno }"><input type="button"
										value="삭제"></a>
									<button>
										<a href="/board/boardList">목록</a>
									</button></td>
							</tr>
						</c:if>
						<!-- test="${b.user_id ne login.user_id} " 이렇게 뒤에 공간이 있으면 안됨;; -->
						<c:if test="${b.user_id ne login.user_id}">
							<tr>
								<td colspan="2" style="text-align: center;">
									<button>
										<a href="/board/boardList">목록</a>
									</button>
								</td>
							</tr>
						</c:if>
					</table>
				</form>
			</div>
		</div>
	</div>

	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>
	
	<%-- 댓글 수정화면 --%>
<div id="modDiv" style="display:none;">
	<%--display:none; css속성값은 해당 화면을 안보이게함 --%>
	<div class="modal-title"></div>
	<div>
		<textarea rows="3" cols="30" id="replytext"></textarea>
	</div>
	<div>
		<div>
			<button type="button" id="replyModBtn">댓글수정</button>
			<button type="button" id="replyDelBtn">댓글삭제</button>
			<button type="button" id="closeBtn" onclick="modDivClose();">닫기</button>
		</div>
	</div>
</div>

<h2>아작스 연습 페이지</h2>
<div>
	<div>
		댓글작성자:<input type="text" name="replyer" id="newReplyWriter" />
	</div><br>
	<div>
	댓글 내용: <textarea rows="5" cols="30" name="replytext" id="newReplyText"></textarea>
	</div>
	<div><br>
	<button id="replyAddbtn">댓글등록</button>
	</div>
</div>

<br>
<hr>
[댓글개수: <b>${b.rcnt }</b>개]
<br>


<%-- 댓글목록 --%>
<ul id="replies"></ul>

<script>
var bno=${b.bno};  // 게시판 번호 값을 bno 변수에 저장시킴, 자바스크립트에서 EL 즉 표현언어를 사용할수 있다.

getAllList(); // 댓글 목록함수를 호출
function getAllList(){
	$.getJSON("/controller/replies/all/"+bno,function(data){  
		//get방식으로 비동기식 아작스 방법으로 json데이터를 가져와 data매개변수에 저장시킴
		var str="";  //var은 변수 정의 예약어이다
		$(data).each(function(){ // jQuery each()함수로 반복함.
			str += "<li data-rno='"+this.rno+"' class='replyLi'>"
			+ this.rno+ " : <span class='com' style='color:blue;font-weight:bold;'>"+ this.replytext	+ "</span>"
			+" <button>댓글수정</button></li><br/>";
		});
		$('#replies').html(str);  //#replies 아이디 영역에 html()함수를 사용하여 댓글 목록을 변경적용
	});
}  // getAllList() 함수

//댓글추가
$('#replyAddbtn').on('click', function(){
	var replyer = $('#newReplyWriter').val();    // 댓글 작성자를 저장
	var replytext = $('#newReplyText').val();    // 댓글내용
	
	$.ajax({  // get or post 방식을 처리하는 jQuery 비동기식 아작스 함수 => 사용빈도가 가장높다
		// $대신 jQuery를 사용해도된다.
		type:'post',  // 비동기식 아작스로 서버로 데이터를 보내는 방법
		url : '/controller/replies',  // 아작스 서버 매핑주소
		headers : {  // 머리부분에, header에 이러한정보다 알려주는것
			"Content-Type": "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data: JSON.stringify({
			bno:bno,   // 키 값 쌍으로 번호값 전달
			replyer:replyer,   //키 이름은 ReplyVO.java의 변수명과 일치,
			replytext:replytext   // 댓글내용
		}),
		success:function(result){
			// 비동기식 아작스로 가져오는것이 성공시 호출되는 콜백함수. 가져온 자료는 result 매개변수에 저장
			if(result=='success'){
				alert('댓글이 등록되었습니다!');
				location.reload(); // 자바스크립트에서 reload()메서드는 새로코침(F5)
				getAllList();   // 댓글 목록 함수를 호출
			}
		}
		
	});
});

//댓글 수정화면
$('#replies').on('click',".replyLi button", function(){
	//.replyLi는 클래스 선택자 
	var reply=$(this).parent();
	var rno=reply.attr("data-rno");   //data-rno 속성값은 댓글번호
	var replytext=reply.text();  //  댓글내용
	
	$('.modal-title').html(rno);   //댓글번호를 .model-title 클래스 선택자 영역에 문자와 태그를 변경적용
	$('#replytext').val(replytext);  // 댓글 내용을 변경적용 
	$('#modDiv').show('slow');  // 수정화면을 show()함수로 천천히 보이게함
});

//댓글 수정화면 닫기
function modDivClose(){
	$('#modDiv').hide('slow'); //hide()함수로 천천히 닫기
}

//댓글 수정 완료
$('#replyModBtn').on("click",function(){
	var rno=$(".modal-title").html();   // 댓글번호
	var replytext=$('#replytext').val()    // 댓글내용
	
	$.ajax({
		type:'put',
		url : '/controller/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify({
			replytext:replytext  //수정댓글내용이 전달
		}),
		dataType:'text',
		success:function(result){
			if(result == 'success'){
				alert('댓글이 수정되었습니다!');
				$('#modDiv').hide('slow');  //수정화면을 숨김
				getAllList();  // 댓글목록함수를 호출
			}
		}
	});
});
 
 //댓글삭제 완료
 $('#replyDelBtn').on('click',function(){    // 삭제버튼 클릭이벤트 발생시 실행
	 var rno=$('.modal-title').html() // 댓글번호
	 // var은 변수 정의 예약어, $는 jQuery 라는 뜻, model-title은 클래스 선택자, html()
	 // jQuery 함수는 해당영역의 태그와 문자를 가져옴. var자바스크립트 예약어는 생략가능하다
	 
	 $.ajax({
		 type:'delete',
		 url:'/controller/replies/'+rno,
		 headers:{
			 "Content-Type":"application/json",
			 "X-HTTP-Method-Override":"DELETE"
		 },
		 dataType:'text',
		 success:function(result){
			 // 비동기식으로 받아오는 것이 성공시 호출되는 콜백함수
			 if(result == 'success'){
				 alert('댓글이 삭제되었습니다!');
				 $('#modDiv').hide('slow');  // 댓글 수정화면을 천천히 닫는다
				 location.reload();
				 getAllList();
			 }
		 }
	 });
 });
 
</script>
	
</body>
</html>