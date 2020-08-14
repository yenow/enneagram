<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div class="hero-wrap js-fullheight">
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>

<section class="">
	<div class="container">
		<div class="row justify-content-center content-margin text-center">
			<h2 class="col-12 mb-2">${pageDTO.cri.category }</h2>
			<div class="col-12 input-group mb-3">
				<c:if test="${pageDTO.cri.category eq '속닥속닥' }">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">유형</label>
					</div>

					<select class="custom-select" id="inputGroupSelect01" name="type" onchange="">
						<option value="" disabled="disabled" onchange="">선택...</option>
						<option value="0">전체보기</option>
						<option value="1">1유형</option>
						<option value="2">2유형</option>
						<option value="3">3유형</option>
						<option value="4">4유형</option>
						<option value="5">5유형</option>
						<option value="6">6유형</option>
						<option value="7">7유형</option>
						<option value="8">8유형</option>
						<option value="9">9유형</option>
					</select>
				</c:if>

				<!-- 게시물 개수 기능 -->
				<label class="input-group-text" for="inputGroupSelect02">개수</label>
				<select class="custom-select" id="inputGroupSelect02" name="maxLine" onchange="maxLineSelect();">
					<option value="10" disabled="disabled" selected="selected">개수선택</option>
					<option value="10">10개</option>
					<option value="30">30개</option>
					<option value="50">50개</option>
				</select>
			</div>

			<div class="table col-12 board-list ">
				<c:forEach var="b" items="${blist }">
					<ul>
						<li class="text-left align-middle">
							<a href="${pageContext.request.contextPath}/board/boardCont?bno=${b.bno}&category=${pageDTO.cri.category}&pageNum=${pageDTO.cri.pageNum}&maxLine=${pageDTO.cri.maxLine}">
								<span>[1번유형]</span>${b.title}
							</a>
						</li>
						<li>
							<span>${b.nickname }</span> <span>${b.cnt }</span> <span>${b.regdate }</span> <span>${b.likey }</span>
						</li>

					</ul>
				</c:forEach>
			</div>

			<!-- 검색기능 -->
			<form action="${pageContext.request.contextPath}/board/boardboardList?category=${pageDTO.cri.category}&maxLine=${pageDTO.cri.maxLine}">
				<div class="col-12 my-3 input-group">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-radius: 0;">검색</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">제목</a>
							<a class="dropdown-item" href="#">내용</a>
							<a class="dropdown-item" href="#">작성자</a>
						</div>
					</div>
					<input type="text" class="form-control" name="search" aria-label="Text input with dropdown button">
					<button type="submit" class="btn btn-primary rounded">검색</button>
					<button class="btn btn-primary rounded ml-3" onclick="goBoardWrite();">글쓰기</button>
				</div>
			</form>

			<!-- 페이징 기능 -->
			<div class="col-12 text-center">
				<div class="block-27">

					<ul>
						<!-- 이전 10개 페이지 버튼 -->
						<c:if test="${pageDTO.prev eq true }">
							<li><a onclick="prevButton();">&lt;</a></li>
						</c:if>
						<c:if test="${pageDTO.prev eq false }">
							<li><a>&lt;</a></li>
						</c:if>
						
						<c:forEach var="page" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
							<li class="active">
								<a href="${pageContext.request.contextPath}/board/boardboardList?pageNum=${page }&maxLine=${maxLine}$category=${pageDTO.cri.category}">${page }</a>
							</li>
						</c:forEach>
						
						<!-- 다음  10개 페이지 버튼 -->
						<c:if test="${pageDTO.prev eq true }">
							<li><a onclick="nextButton();">&gt;</a></li>
						</c:if>
						<c:if test="${pageDTO.prev eq false }">
							<li><a>&gt;</a></li>
						</c:if>
						

					</ul>

				</div>
			</div>

		</div>
	</div>
</section>

<script>

function goBoardWrite() {
	location.href='${pageContext.request.contextPath}/board/boardWrite';
};

console.log($('#inputGroupSelect02 option:selected'));

function maxLineSelect() {
    var maxLinevalue = $('#inputGroupSelect02 option:selected').val();
    console.log(maxLinevalue);
    location.href='${pageContext.request.contextPath}/board/boardList?category=${pageDTO.cri.category}&maxLine='+maxLinevalue;
};

function prevButton() {
	location.href='${pageContext.request.contextPath}/board/boardList?category=${pageDTO.cri.category}&maxLine=${pageDTO.cri.maxLine}&pageNum=${pageDTO.startPage-10}';
};

function nextButton() {
	location.href='${pageContext.request.contextPath}/board/boardList?category=${pageDTO.cri.category}&maxLine=${pageDTO.cri.maxLine}&pageNum=${pageDTO.startPage+10}';
};

</script>

<jsp:include page="../info/footer.jsp"></jsp:include>

