<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../c_info/header.jsp"></jsp:include>

<%-- <span class="ir_su" id="r_user_id" data-user-id='${login.user_id }'></span>
<span class="ir_su" id="r_nickname" data-nickname='${login.nickname }'></span> --%>

<!-- Main -->
<div id="main">
	<div class="inner">

		<!-- Header -->
		<header id="header">
			<a href="${pageContext.request.contextPath}/board/boardList" class="logo"><strong>게시판</strong></a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
			</ul>
		</header>

		<section>
			<div class="box">
				<h2 id="content">${b.title }</h2>
				<p>${b.nickname}   ${b.s_regdate }</p>
				<hr>
				<p class="board-content">${b.content}
				<p>
				<hr>

				<ul>
					<li class="menu_bar">
					<c:if test="${b.user_id eq login.user_id}">
							<!--  <input type="submit" value="수정">-->
							<a class="button small reply_bar" onclick="replyDisplay(); replyList();">댓글 보기</a>
							<a href="boardUpdate?bno=${b.bno }" class="button small">수정</a>
							<a href="boardDelete?bno=${b.bno }" class="button small" onclick="return del_check();">삭제</a>
							<a href="${pageContext.request.contextPath}/board/boardList" class="button small">목록</a>
					</c:if> 
					<!-- test="${b.user_id ne login.user_id} " 이렇게 뒤에 공간이 있으면 안됨;; --> 
					
					<c:if test="${b.user_id ne login.user_id}">
						<a class="reply_bar button small" onclick="replyDisplay(); replyList();">댓글 보기</a>
						<a href="${pageContext.request.contextPath}/board/boardList" class="button small">목록</a>
					</c:if></li>

					<li class="reply_box">
						<%-- <span>댓글 개수 : ${b.rcnt }</span>  --%> 
						
						 <!-- 댓글 --> 
						 <!-- reply_content -->
						<div class="table-wrapper">
							<table>
								<tbody id="reply_content">

								</tbody>
							</table>
						</div> 
						
						<!-- 댓글 작성란 --> 
						<!-- 로그인중 --> 
						<c:if test="${login != null }">
							<div class="reply_info login_reply">
								<div class="row gtr-uniform">
									<div class="col-12">
										<textarea id="t_content1"></textarea>
									</div>
									<div class="col-12">
										<a onclick="javascript:replyRegster1(); replyList();" class="button small">등록</a>
									</div>
								</div>
								
								<!-- <textarea id="t_content1"></textarea>
								<div>
									<a onclick="replyRegster1(); replyList();" class="button small">등록</a>
									<a onclick="replyList();" class="button small">모르겟다</a>
								</div> -->

							</div>
						</c:if>
						
						<!-- 로그인 안되어 있을시 --> 
						<c:if test="${login == null }">
							<div class="reply_info not_login_reply">
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<input type="text" id="nickname" name="nickname" placeholder="닉네임">
									</div>
									<div class="col-6 col-12-xsmall">
										<input type="password" id="no_user_passwd" name="no_user_passwd" placeholder="비밀번호">
									</div>
									<div class="col-12">
										<textarea id="t_content2"></textarea>
									</div>
									<div class="col-12">
										<a onclick="javascript:replyRegster2(); replyList();" class="button small">등록</a>  <!-- 이거는 왜 이럴까,, javascript: -->
									</div>
								</div>

							</div>
						</c:if> 
					</li>
				</ul>

			</div>

		</section>

	</div>
</div>


<script type="text/javascript">
	/* 댓글 리스트 가져오기 */
	function replyList() {
	
		var bno = ${b.bno};
	
		$.ajax({
			type : 'GET', // method
			url : '/reply/listReply?bno=' + bno, // POST 요청은 데이터가 요청 바디에 포함됩니다.
			async : 'true', // true
			processData : true,
			contentType : 'application/json',
			dataType : 'json', // 명시하지 않을 경우 자동으로 추측
			success : function(data) {
				var str = "";
				
				/* data-rno 값을 이용해서 댓글수정과 댓글 삭제를 구현 -> 백단에서 하는게 더 나을듯? */
				$.each(data,function(i, v) { /* i는  인덱스값, v는 하나의 value의 약자인듯*/
	
					/* str += "<li data-rno='"+v.rno+"'><span class='nickname'>"+i+ v.nickname+"</span>"+"<br><span class='rcontent'>"+v.rcontent+"</span>";
					str += "<button class='update1' onclick='update()'>수정</button> <button class='delete1' onclick='delete()'>삭제</button></li>";  */
						str += "<tr>";
						str += "<td>" + v.nickname+ "</td>";
						str += "<td>" + v.rcontent+ "</td>";
						str += "<td ><a data-kind='"+v.kind+"' onclick='r_update(this,"+v.kind+","+v.rno+","+v.user_id+");' class='button small'>수정</a> <a onclick='r_delete("+v.kind+","+v.rno+");' class='button small'>삭제</a></td>";
						str += "</tr>";
					});
					/* str += "<button onclick='update()'>수정</button> <button onclick='delete()'>삭제</button>" */
					$('#reply_content').html(str);
				},
				error : function(error) {
				console.log("error", error);
				responseError(error);
				}
			});
		}
		//
	
	/* 댓글리스트 보이게하기 */
	function replyDisplay(){
		if (temp == 0) {
			$('.reply_box').css("display", "block");
			temp = 1;
		} else {
			$('.reply_box').css("display", "none");
			temp = 0;
		}
	}

		
	//삭제 확인
	function del_check() {
		if (confirm("정말 삭제하시겠습니까 ?") == true) {
			alert("삭제되었습니다");
		} else {
			return;
		}

	}

	// 여기에는 kind 값이 1가 들어감  login되어있을떄
	function replyRegster1() {
		var dataset = new Object();
		
		dataset.nickname = "${login.nickname}" ; // script에서 el태그를 쓰는건 너무 어렵다
		dataset.user_id ="${login.user_id}";	
		dataset.rcontent = $('#t_content1').val();
		dataset.bno = ${b.bno};
		dataset.kind = 1;

		$.ajax({
			type : 'post', // method
			//url   : 'list',
			url : '/reply/replyinsert', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
			async : 'true', // true
			data : JSON.stringify(dataset), // GET 요청은 지원되지 않습니다.
			contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
			dataType : 'text', // 명시하지 않을 경우 자동으로 추측
			success : function(data, status, xhr) {
				console.log("data", data);
			},
			error : function(error) {
				console.log("error", error);
			}
		});
		
		$('#nickname').val('');
		$('#no_user_passwd').val('');
		$('#t_content1').val('');
		replyList();
		
	}

	//여기에는 kind 값이 2이 들어감, login X
	function replyRegster2() {
		var dataset = new Object();
		dataset.rcontent = $('#t_content2').val();
		dataset.no_user_passwd = $('#no_user_passwd').val();
		dataset.bno = ${b.bno};
		dataset.nickname = $('#nickname').val();
		dataset.kind = 2;

		$.ajax({
			type : 'post', // method
			//url   : 'list',
			url : '/reply/replyinsert', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
			async : 'true', // true
			data : JSON.stringify(dataset), // GET 요청은 지원되지 않습니다.
			contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
			dataType : 'text', // 명시하지 않을 경우 자동으로 추측
			success : function(data, status, xhr) {
				console.log("data", data);
			},
			error : function(error) {
				console.log("error", error);
			}
		});
		
		$('#nickname').val('');
		$('#no_user_passwd').val('');
		$('#t_content1').val('');
		replyList();
		
	}

	var temp = 0;
	
	/* 댓글 업데이트*/
	function r_update(e,kind){
		console.log(e);
		console.log(e.parentNode);
		console.log(e.parentNode.parentNode.parentNode);
		var tr = e.parentNode;
		
		if(kind==1){
			var updateWindow = document.querySelector('.login_reply').cloneNode;
			
		}else{
			var updateWindow = document.querySelector('.not_login_reply').cloneNode;
		}
			
	}
	
		
	/* 댓글 삭제*/
	function r_delete(kind,rno){	
		var dataset = {};
		dataset.kind = kind;
		dataset.rno = rno;

		
		var ok = confirm('삭제하시겠습니까?');
		if(ok==false){
			return false;
		}
		if(kind==2){
			dataset.no_user_passwd = prompt('비밀번호를 입력하세요');
		}else{
			dataset.user_id = "${login.user_id}";
		}
		
		$.ajax({
			type : 'post', // method
			//url   : 'list',
			url : '/reply/deleteReply', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
			async : 'true', // true
			data : JSON.stringify(dataset), // GET 요청은 지원되지 않습니다.
			contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
			dataType : 'text', // 명시하지 않을 경우 자동으로 추측
			success : function(data, status, xhr) {
				console.log("data", data);
				alert(data);
			},
			error : function(error) {
				console.log("error", error);
			}
		});
		
		location.reload(true);
		
	}

	
		
	
</script>

<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>
