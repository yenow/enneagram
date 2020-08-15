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
						<h2 class="col-md-12 row text-center mb-1">${b.title }</h2>
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
								<%-- <li class="comment">
									<div class="vcard bio">
										<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>John Doe</h3>
										<div class="meta">June 27, 2018 at 2:21pm</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
										<p>
											<a href="#" class="reply">Reply</a>
										</p>
									</div>
								</li>

								<li class="comment">
									<div class="vcard bio">
										<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>John Doe</h3>
										<div class="meta">June 27, 2018 at 2:21pm</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
										<p>
											<a href="#" class="reply">Reply</a>
										</p>
									</div>

									<ul class="children">
										<li class="comment">
											<div class="vcard bio">
												<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
											</div>
											<div class="comment-body">
												<h3>John Doe</h3>
												<div class="meta">June 27, 2018 at 2:21pm</div>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
												<p>
													<a href="#" class="reply">Reply</a>
												</p>
											</div>


											<ul class="children">
												<li class="comment">
													<div class="vcard bio">
														<img src="images/person_1.jpg" alt="Image placeholder">
													</div>
													<div class="comment-body">
														<h3>John Doe</h3>
														<div class="meta">June 27, 2018 at 2:21pm</div>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
														<p>
															<a href="#" class="reply">Reply</a>
														</p>
													</div>

													<ul class="children">
														<li class="comment">
															<div class="vcard bio">
																<img src="images/person_1.jpg" alt="Image placeholder">
															</div>
															<div class="comment-body">
																<h3>John Doe</h3>
																<div class="meta">June 27, 2018 at 2:21pm</div>
																<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
																<p>
																	<a href="#" class="reply">Reply</a>
																</p>
															</div>
														</li>
													</ul>
												</li>
											</ul>
										</li>
									</ul>
								</li> --%>


								<li class="comment">
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
											<a  href="#" class="reply reply-delete-button" onclick="replydelete();">삭제</a>
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
								</li>
							</ul>
							<!-- END comment-list -->

							<!-- 댓글 등록 -->
							<div class="comment-form-wrap pt-5">
								<h3 class="mb-5">댓글등록</h3>
								<div class="p-5 bg-light">

									<!-- 비로그인 -->
									<c:if test="${login == null }">
										<div class=" form-group">
											<label for="rId">이름</label>
											<input type="text" class="form-control" id="rname" name="rname">
										</div>
										<div class="form-group">
											<label for="password">비밀번호</label>
											<input type="password" class="form-control" id="rpassword" name="rpassword">
										</div>
									</c:if>
									<!-- 내용 -->
									<div class="form-group">
										<label for="content">내용</label>
										<textarea name="content" id="content" content"" cols="30" rows="10" class="form-control"></textarea>
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

<c:if  test="${login ne null }">
	<div data-mno="${login.mno }" class="d-none login-mno"></div>
</c:if>
	



<div class="alert alert-primary" role="alert">
  A simple primary alert—check it out!
</div>

<script type="text/javascript">

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
			if(tmno===mno){  // 진짜 이부분.. 알다가도 모르겟다... 자바스크립트는 '' 랑 0 이랑 똑같이 보는듯
				
				$replyUpdate = $('<a href="#" class="reply reply-update-button1" data-mno="'+mno+'" data-rno="'+rno+'" onclick="replyUpdateBox();">수정</a>');
				$replyDelete = $('<a href="#" class="reply reply-delete-button1" data-mno="'+mno+'" data-rno="'+rno+'" onclick="replydelete();">삭제</a>');
				$p.append($replyUpdate);
				$p.append($replyDelete);
			}
			if(category==2){
				$replyDelete = $('<a href="#" class="reply reply-delete-button2" data-mno="'+mno+'" data-rno="'+rno+'" onclick="replydelete();">삭제</a>');
				$p.append($replyDelete);
			}
			$identificationButton = '<div class="input-group mb-3 reply-update-box d-none"><div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">비밀번호</span></div><input type="password" class="form-control" placeholder="댓글 비밀번호" aria-label="Username" aria-describedby="basic-addon1"><div class="input-group-append"><button class="btn btn-outline-secondary border rounded reply-button" type="button" id="inputGroupFileAddon04">확인</button></div></div>'
			
			$div.append($rname);
			$div.append($regdate);
			$div.append($content);
			$div.append($p);
			$div.append($identificationButton);
			
			$li.append($img);
			$li.append($div); 
			
			$('.comment-list').append($li);
		}
		
	}
	
	function replyList() {
		var bno = ${b.bno};
		
		$.get("${pageContext.request.contextPath}/reply/listReply", {'bno' : bno }, function(data, textStatus, req) {
			console.log(data);
			console.log(textStatus);
			console.log(req);
			insertReply(data);
		}, 'json');
	};
	
	replyList();
	
	
	$('.reply-regist').click(function() {
		var bno = ${b.bno};
		var rpassword = $('#rpassword').val();
		var rname = $('#rname').val();
		var content = $('#content').val();
		var dataVO;
		var category;
		
		if('${login}'==''){
			category = 2;
			mno = 0;
			dataVO = {'bno':bno,'rpassword':rpassword,'rname':rname,'content':content,'category':category };
		}else{
			var mno = '${login.mno}';
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
	
	
	
	$('.reply-button').click(function () {
		
	});
	
	$('.reply-delete-button2').click(function () {
		if($('.reply-update-button').data('category')==2){
			$('reply-update-box').show();
		}
		
	});
	
	/* 로그인 되어있는 사용자가 수정*/
	$('.reply-update-button1').click(function () {
		var flag = confirm('정말 삭제하시겠습니까?');
		if(flag==true){
			$.get(url, data, function(data, textStatus, req) {
				
			}, dataType)
		}
	});
	
	/* 로그인 되어있는 사용자가 삭제*/
	$('.reply-delete-button1').click(function () {
		var flag = confirm('정말 삭제하시겠습니까?');
		var rno = $(this).data('rno');
		console.log(rno);
		if(flag==true){
			$.post('${pageContext.request.contextPath}/reply/deleteReply', {'rno' : rno}, function(data, textStatus, req) {
				console.log(data);
			}, 'html')
		}
		
	});
	
	
});
 
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>



