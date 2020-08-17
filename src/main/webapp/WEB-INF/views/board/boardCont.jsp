<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
			<div class="container">
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<!-- 제목 -->
						<h2 class="col-md-12 row text-center mb-1"">${b.title }</h2>
						<!-- 서브정보 -->
						<table class="row col-md-12 my-2 ">
							<tbody class="col-md-12" style="padding: 0 !important;">
								<tr class="float-left">
									<td class="align-middle border-0 px-2">[${b.type }번유형]</td>
									<td class="align-middle border-0 px-2">조회수: ${b.cnt }</td>
									<td class="align-middle border-0 px-2">${b.moddate }</td>

								</tr>
								<tr class="float-right">

									<td class="align-middle border-0 px-2">
										<img src="../resources/images/person_1.jpg" alt="Image placeholder" class="img-fluid my-img float-right">
									</td>
									<td class="align-middle border-0 px-2">${b.nickname }</td>
								</tr>
							</tbody>
						</table>

						<!-- 내용 -->
						<div class="col-md-12 row mt-1 pt-2 border-top" style="min-height: 500px;">내용</div>

						<!--  태그 -->
						<div class="col-md-12 tag-widget post-tag-container mb-5 mt-5 ">
							<div class="tagcloud">
								<span class="float-left"> <a href="#" class="tag-cloud-link">Life</a> <a href="#" class="tag-cloud-link">Sport</a> <a href="#" class="tag-cloud-link">Tech</a> <a href="#" class="tag-cloud-link">Travel</a>

								</span> <span class="float-right"> <c:if test="${login.mno == b.mno }">
										<a href="${pageContext.request.contextPath}/board/boardUpdate?bno=${b.bno}" class="btn btn-primary btn-lg">수정</a>
										<a href="${pageContext.request.contextPath}/board/boardDelete?bno=${b.bno}" class="btn btn-primary btn-lg">삭제</a>
									</c:if> <a href="${pageContext.request.contextPath}/board/boardList?category=${pageDTO.cri.category}&pageNum=${pageDTO.cri.pageNum}&maxLine=${pageDTO.cri.maxLine}" class="btn btn-primary btn-lg">목록</a>
								</span>
							</div>
						</div>

						<!-- 댓글 -->
						<div class="pt-2 mt-5 border-top">
							<h3 class="mb-5">${b.rcnt } Comments</h3>
							<ul class="comment-list">
								<!-- <li class="comment" onclick="replyUpdate1(1);">
									<div class="vcard bio">
										<img src="images/person_1.jpg" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>John Doe</h3>
										<div class="meta">June 27, 2018 at 2:21pm</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
										<p>
											<a href="#" class="reply">Reply</a>
											<a href="#" class="reply reply-update-button" onclick="replyUpdate();">수정</a>
											<a href="#" class="reply reply-delete-button" onclick="replydelete();">삭제</a>
										</p>

										<div class="input-group mb-3 reply-update-box none">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1">비밀번호</span>
											</div>
											<input type="password" class="form-control" placeholder="댓글 비밀번호" aria-label="Username" aria-describedby="basic-addon1">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary border rounded reply-button" type="button" id="inputGroupFileAddon04">확인</button>
											</div>
										</div>
									</div>
								</li> -->
							</ul>
							<!-- END comment-list -->

							<!-- 댓글 등록 -->
							<div class="comment-form-wrap pt-2">
								<h4 class="">댓글등록</h4>
								<div class="p-2 bg-light">

									<!-- 비로그인 -->
									<c:if test="${login == null }">
			
										<div class="input-group mb-3">
											<!-- 이름 -->
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1">이름</span>
											</div>
											<input type="text" class="form-control" id="rname" name="rname" placeholder="이름" aria-label="Username" aria-describedby="basic-addon1">
											<!-- 비밀번호 -->
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1">비밀번호</span>
											</div>
											<input type="password" class="form-control" id="rpassword" name="rpassword" placeholder="비밀번호" aria-label="Username" aria-describedby="basic-addon1">
										</div>
									</c:if>
									<!-- 내용 -->
									<div class="form-group">
										<label for="content">내용</label>
										<textarea name="content" id="content"  cols="30" rows="5" class="form-control"></textarea>
									</div>


									<!-- 제출버튼 -->
									<div class="form-group">
										<input type="submit" value="등록" class="btn py-3 px-4 btn-primary reply-regist">
									</div>
								</div>

							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<c:if test="${login ne null }">
	<div data-mno="${login.mno }" class="d-none login-mno"></div>
</c:if>




<div class="alert alert-primary" role="alert">A simple primary alert—check it out!</div>

<script type="text/javascript">


/* 로그인 되어있는 사용자가 수정*/
function replyUpdate1(rno) {
	 console.log($('.reply-update'+rno));
	 var content =  $('.reply-update'+rno).val();
	 console.log(content);
	 $.ajax({
		 url : '${pageContext.request.contextPath}/reply/updateReply',
		 method : 'POST',
		 contentType : 'application/json',
		 data : JSON.stringify({'content':content,'rno':rno}),
		 dataType : 'html',
		 success : function (data) {
				 console.log(data);
				 if(data!='success'){
					 alert('댓글 수정 실패');
				 }else{
					 alert('댓글 수정 성공');
					 var update = document.querySelector('.reply-update'+rno).parentNode.parentNode;
					 update.style.display = 'none';
					 location.reload();
				}
		 }
	 });
}

/* 로그인 되어있는 사용자가 삭제*/
function replyDelete1(rno) {
	var flag = confirm('정말 삭제하시겠습니까?');
	console.log(this);
	//var rno = $(this).data('rno');
	console.log(rno);
	console.log(flag);
	if(flag==true){
		/* $.ajax({
			url : '${pageContext.request.contextPath}/reply/deleteReply' ,
			method : 'POST',
			dataType : 'html',
			data : JSON.stringify({'rno' : rno}),
			contentType: 'application/json',
			success : function (data) {
				 if(data!='success'){
					 alert('댓글 삭제 실패');
				 }else{
					 alert('댓글 삭제 성공');
					 var update = document.querySelector('.reply-update'+rno).parentNode.parentNode;
					 update.style.display = 'none';
					 location.reload();
				}
			}
		}); */
		
		 $.post('${pageContext.request.contextPath}/reply/deleteReply', {'rno': rno} , function(data, textStatus, req) {
			 if(data!='success'){
				 alert('댓글 삭제 실패');
			 }else{
				 alert('댓글 삭제 성공');
				 var update = document.querySelector('.reply-update'+rno).parentNode.parentNode;
				 update.style.display = 'none';
				 location.reload();
			}
		}, 'html') 
	}else{
		return false;
	}
}

/* 비로그인 댓글 삭제 , onclick 함수에 등록됨*/
function replyDelete2(rno) {
	console.log(rno);
	var ps = $('.replyDeleteBox'+rno).val();
	console.log(ps);
	var dataVO = {'rno':rno,'ps':ps};
	console.log(dataVO);
	
	$.ajax({
		url : '${pageContext.request.contextPath}/reply/deleteReply2' ,
		method : 'POST',
		dataType : 'html',
		data : JSON.stringify(dataVO),
		contentType: 'application/json',
		success : function (data) {
			if(data=='passwordNotEquals'){
				alert('비밀번호가 같지 않습니다');
			}else{
				alert('삭제되었습니다');
				location.reload();
			}
		}
	});
	console.log($('.reply-update-box'));
}

 $(document).ready(function() {
	 
	/* 댓글 넣는 함수*/
	function insertReply(data) {
		var tmno = $('.login-mno').data('mno');  // html 태그를 이용해서 값을 받았다.
		for(var i=0; data.length; i++){
			var content = data[i].content;
			var regdate = data[i].regdate;
			var rname = data[i].rname;
			var category = data[i].category;
			var mno = data[i].mno;
			var rno = data[i].rno;
			var nickname = data[i].nickname;
			
			$li = $('<li class="comment"></li>');
			$img = $('<div class="vcard bio">'
					+'<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">'
					+'</div>');
			$div = $('<div class="comment-body"></div>');
			
			if(rname!=null){
				$rname = $('<h3>'+rname+'</h3>');
			}else{
				$rname = $('<h3>'+nickname+'</h3>');
			}
			
			$regdate = $('<div class="meta">'+regdate.year+'.'+regdate.month+'.'+regdate.dayOfMonth+'</div>');
			$content = $('<p>'+content+'</p>');
			$p = $('<p></p>');
			$reply = $('<a href="#" class="reply">Reply</a> ');
			
			$p.append($reply);  // p태그에 reply버튼 추가
			
			/* 내가 작성한 댓글일 경우 */
			if(tmno===mno){  // 진짜 이부분.. 알다가도 모르겟다... 자바스크립트는 '' 랑 0 이랑 똑같이 보는듯
				
				$replyUpdate = $('<a class="reply reply-update-button1" data-mno="'+mno+'" data-rno="'+rno+'">수정</a>');
				$replyDelete = $('<a class="reply reply-delete-button1" data-mno="'+mno+'" data-rno="'+rno+'" onclick="replyDelete1('+rno+');">삭제</a>');
				var flag = true;
				/* 수정버튼에 클릭 이벤트 추가,, 수정박스추가  */
				$replyUpdate.on('click', function() {
					var updateBox = this.parentNode.nextSibling.nextSibling;
					$(updateBox).toggle();
				});
				
				$p.append($replyUpdate);
				$p.append($replyDelete);
			}
			
			/* 비로그인 댓글 */
			if(category==2){
				$replyDelete = $('<a disabled="disabled" class="reply reply-delete-button2" data-mno="'+mno+'" data-rno="'+rno+'" >삭제</a>');  //onclick="replyDelete2('+rno+');
				$replyDelete.on('click', function() {
					console.log(this);
					var mother = this.parentNode;
					var two = this.parentNode.nextSibling;
					console.log(two);
					console.log($(two));
					// two.style.display='flex';
					$(two).toggle();
				});
				$p.append($replyDelete);
			}
			$identificationButton = '<div class="input-group mb-3 reply-update-box" style="display : none">'
				+'<div class="input-group-prepend">'
				+'<span class="input-group-text" id="basic-addon1">비밀번호</span>'
				+'</div>'
				+'<input type="password" class="form-control replyDeleteBox'+rno+'" placeholder="댓글 비밀번호" aria-label="Username" aria-describedby="basic-addon1">'
				+'<div class="input-group-append">'
				+'<button class="btn btn-outline-secondary border rounded reply-button" data-rno="'+rno+'" type="button" id="inputGroupFileAddon04" onclick="replyDelete2('+rno+');">확인</button>'
				+'</div>'
				+'</div>';
			$update = $('<div class="comment-form-wrap" style="display : none"><h3>댓글수정</h3><div class="form-group"><label for="content">내용</label><textarea name="content" id="content" cols="30" rows="5" class="form-control reply-update'+rno+'"></textarea></div><div class="form-group"><input type="submit" value="수정" onclick="replyUpdate1('+rno+');" class="btn py-3 px-4 btn-primary"></div></div>');
			
			$div.append($rname);
			$div.append($regdate);
			$div.append($content);
			$div.append($p);
			$div.append($identificationButton);
			$div.append($update);
			$li.append($img);
			$li.append($div); 
			
			$('.comment-list').append($li);
		}
	}
	
	/* 댓글 리스트 출력 */
	function replyList() {
		var bno = ${b.bno};
		
		$.get("${pageContext.request.contextPath}/reply/listReply", {'bno' : bno }, function(data, textStatus, req) {
			console.log(data);
			insertReply(data);
			showPassword();
			
		}, 'json');
	};
	
	replyList();
	
	/* 댓 글 등 록*/
	$('.reply-regist').click(function() {
		var bno = ${b.bno};
		var rpassword = $('#rpassword').val();
		var rname = $('#rname').val();
		var content = $('#content').val();
		var mno = $('.login-mno').data('mno');
		var dataVO;
		var category;
		
		if(mno == null){
			category = 2;
			mno = 0;
			dataVO = {'bno':bno,'rpassword':rpassword,'rname':rname,'content':content,'category':category };
		}else{
			var mno = mno;
			category = 1;
			dataVO = {'bno':bno,'rpassword':rpassword,'rname':rname,'content':content ,'mno':mno ,'category':category };
		}
		console.log(bno+" "+rpassword+" "+rname+" "+content+" "+mno+" "+category);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/reply/replyRegist',
			data : JSON.stringify(dataVO),
			contentType: 'application/json',
			method : 'POST',
			dataType : 'html',
			success: function (data) {
				console.log(data);
				alert('댓글이 등록되었습니다');
			}
			});  
		
		$('.comment-list').html('');  // 댓글 리스트 비우기
		replyList();    // 댓글 리스트 호출
		$('html').scrollTop(0);  // 스크롤을 맨 위로
		/* input태그 초기화 */
		$('#rpassword').val('');
		$('#rname').val('');
		$('#content').val('');
	}); 
	
	
	function showPassword() {
		var list = document.querySelector('.reply-delete-button2');
		for(var i=0; list.length; i++){
			list[i].addEventListener('click', function(e) {
				console.log(this);
				var mother = this.parentNode;
				var two = one.nextSibling;
				two.style.display='block';
			});
		}
	}
	
	
});
 
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>



