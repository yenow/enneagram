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
							<h3 class="mb-5">6 Comments</h3>
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


								<!-- <li class="comment">
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
								</li> -->
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
											<input type="text" class="form-control" id="rId" name="rId">
										</div>
										<div class="form-group">
											<label for="password">비밀번호</label>
											<input type="password" class="form-control" id="password" name="password">
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

<script type="text/javascript">

 $(document).ready(function() {
	 
	/* 댓글 넣는 함수*/
	function insertReply(data) {
		for(var i=0; data.length; i++){
			var content = data[i].content;
			var regdate = data[i].regdate;
			var name = data[i].rname;
			
			$li = $('<li class="comment"></li>');
			$img = $('<div class="vcard bio">'
					+'<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">'
					+'</div>');
			$content = $('<div class="comment-body">'
					+'<h3>'+name+'</h3>' 
					+'<div class="meta">'+regdate.year+'.'+regdate.month+'.'+regdate.dayOfMonth+'</div>'
					+'<p>'+content+'</p>'
					+'<p><a href="#" class="reply">Reply</a></p></div>'); 
			$li.append($img);
			$li.append($content); 
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
		console.log('제출');
		console.log('${login}'=='');  
		var bno = ${b.bno};
		console.log(bno);
		
		/* $.ajax({
			url : '${pageContext.request.contextPath}/reply/replyRegist',
			data : {'bno' : bno},
			method : 'POST',
			dataType : 'json',
			success: function (data) {
				console.log(dta);
			}
		}); */
	}); 
});
 
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>



