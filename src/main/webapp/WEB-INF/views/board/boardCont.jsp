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

	<script type="text/javascript">
		replyList();
	</script>

	<div id="header">
		<jsp:include page="../info/header.jsp"></jsp:include>
	</div>

	<div id="banner">
		<jsp:include page="../info/banner.jsp"></jsp:include>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="content">
					
					<div class="boardCont">
						<h1 class="ir_su">게시판 내용</h1>
						
							<ul>
								<li>${b.title }</li>
								<li class="nickname_bar"><span>작성자 : ${b.nickname}</span> <span>등록 날짜 : ${b.regdate }</span></li>
								<li class="content_box"><span>${b.content}</span></li>
								
								<li class="menu_bar">
									<c:if test="${b.user_id eq login.user_id}">
										<!--  	<input type="submit" value="수정">-->
										<button class="reply_bar">댓글 보기</button>
										<button><a href="boardUpdate?bno=${b.bno }">수정</a></button>
										<button><a href="boardDelete?bno=${b.bno }">삭제</a></button>
										<button><a href="/board/boardList">목록</a></button>

									</c:if> <!-- test="${b.user_id ne login.user_id} " 이렇게 뒤에 공간이 있으면 안됨;; -->
									<c:if test="${b.user_id ne login.user_id}">
										<button class="reply_bar" onclick="replyList();"> 댓글 보기 </button>
										<button><a href="/board/boardList">목록</a></button>
									</c:if>
								</li>
								
								<li class="reply_box">
									<span>댓글 개수 : ${b.rcnt }</span>
									<!-- 댓글 -->
									<ul id="reply_content">
										
									</ul>
									<!-- 댓글 작성란 -->
								
										<!-- 로그인 안되어 있을시 -->
										<c:if test="${login == null }">
											<div class="reply_info">
												<h5><input type="type" id="nickname" name="nickname" placeholder="닉네임">&#32;&#32;
												<input type="type" id="no_user_passwd" name="no_user_passwd" placeholder="비밀번호"> </h5>	
												<textarea id="t_content1"></textarea>
												<div><button onclick="replyRegster1(); replyList();">등록${ysy }</button></div>
											</div>
										</c:if>
										<!-- 로그인중 -->
										<c:if test="${login != null }">	
											<div class="reply_info">
												<textarea id="t_content2"></textarea>
												<div><button onclick="replyRegster2(); replyList();">등록${ysy }</button>
													<button  onclick="replyList();">모르겟다${ysy }</button>
												</div>
												
											</div>
										</c:if>
 
								</li> <!-- 댓글 /li  -->
							</ul>
							
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div>
	
	</div>
	
	<div id="tail">
		<jsp:include page="../info/tail.jsp"></jsp:include>
	</div>
	
	

<script type="text/javascript">
var ysy=2;

// 여기에는 kind 값이 1가 들어감
function replyRegster1(){
	var dataset = new Object();	
	dataset.nickname = $('#nickname').val();
	dataset.no_user_passwd = $('#no_user_passwd').val();
	dataset.rcontent = $('#t_content1').val();
	dataset.bno = ${b.bno};
	dataset.kind = 1;
	
	$.ajax({
		type : 'post', // method
		//url   : 'list',
		url : '/reply/replyinsert', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
		async : 'true', // true
		data  : JSON.stringify(dataset), // GET 요청은 지원되지 않습니다.
		contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
		dataType : 'json', // 명시하지 않을 경우 자동으로 추측
		success : function(data, status, xhr) {
			console.log("data", data);
		},
		error : function(error) {
			console.log("error", error);
		}
	});
	

}

//여기에는 kind 값이 2이 들어감
function replyRegster2(){
	var dataset = new Object();	
	dataset.user_id = "${login.user_id}";
	dataset.rcontent = $('#t_content2').val();
	dataset.bno = ${b.bno};
	dataset.nickname = "${login.nickname}";
	dataset.kind = 2;
	
	$.ajax({
			type : 'post', // method
			//url   : 'list',
			url : '/reply/replyinsert', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
			async : 'true', // true
			data  : JSON.stringify(dataset), // GET 요청은 지원되지 않습니다.
			contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
			dataType : 'json', // 명시하지 않을 경우 자동으로 추측
			success : function(data, status, xhr) {
				console.log("data", data);
			},
			error : function(error) {
				console.log("error", error);
			}
		});
}


/* 댓글 리스트 가져오기 */
function replyList(){
  	var bno = ${b.bno};
  	
 	 $.ajax({
         type    : 'GET', // method
         url     : '/reply/listReply?bno='+bno, // POST 요청은 데이터가 요청 바디에 포함됩니다.
         async   : 'true', // true
         processData : true,
         contentType : 'application/json',
         dataType  :'json', // 명시하지 않을 경우 자동으로 추측
         success : function(data){
         	var str="";
         	/* data-rno 값을 이용해서 댓글수정과 댓글 삭제를 구현 -> 백단에서 하는게 더 나을듯? */
         	$.each(data,function(i,v){
         	 	if(v.kind==2){
         	 		str += "<li data-rno='"+v.rno+"'><span class='nickname'>"+ v.nickname+"</span>"+"<br><span class='rcontent'>"+v.rcontent+"</span>";
         	 		str += "<button class='update2' onclick='update()'>수정</button> <button class='delete2' onclick='delete()'>삭제</button></li>";
         	 	}else if(v.kind==1){
         	 		str += "<li data-rno='"+v.rno+"'><span class='nickname'>"+ v.nickname+"</span>"+"<br><span class='rcontent'>"+v.rcontent+"</span>";
         	 		str += "<button class='update1' onclick='update()'>수정</button> <button class='delete1' onclick='delete()'>삭제</button></li>";
         	 	}
         			
         	 });
         	/* str += "<button onclick='update()'>수정</button> <button onclick='delete()'>삭제</button>" */
         	$('#reply_content').html(str);
         	 
         },
         error   : function(error){
             console.log("error", error);
             responseError(error);
         }
     });
}

$.('#reply_content .update').click(function(){
	
});

function update(){
	var
	
	$('#reply_content li[data-rno='++']').css("display", "block");
}

</script>	
	
	<!-- 
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
-->
</body>
</html>