<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 로그인 유효성 검증 코드 해야함 -> 서버에서 하는게 맞는듯 -->

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
		<div class="row my-5">
			<div class="col-md-9 order-md-1 border rounded py-3 px-3 ">
				<!-- 내 프로필 -->
				<h4 class="mb-5 h2">나의 프로필</h4>
				<div class="d-flex justify-content-start align-items-center my-image">
					<img src="../resources/images/normal.png" width="90" height="90" alt="Image placeholder" class="img-fluid my-img float-right"> <span class="ml-5"><strong>별명 </strong> <span> ${login.nickname }</span> </span>
				</div>
				<!-- 프로필 사진 변경 -->
				<div class="input-group my-4">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary rounded" type="button" id="inputGroupFileAddon03">프로필 사진 등록</button>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03">
						<label class="custom-file-label" for="inputGroupFile03" id="inputGroupFile03label"></label>
					</div>
				</div>
				<div class="text-center">
					<!-- 수정버튼 -->
					<a href="#" id="profileSubmit" class="btn btn-primary">등록</a> <a href="#" id="profiledelete" class="btn btn-primary">삭제</a>
				</div>
				<hr />
				<!-- 비밀번호 -->
				<h4 class="mb-3 h2">개인정보수정</h4>
				<p>로그인 시 사용하는 비밀번호를 변경하거나 별명과, 전화번호, 이메일 주소등을 변경할수 있습니다. 주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</p>
				<div class="text-center">
					<a href="${pageContext.request.contextPath}/member/is_member" class="btn btn-primary">개인정보 수정하기</a>
				</div>
			</div>
			<!-- sidebar -->
			<div class="col-md-3 sidebar ftco-animate order-first fadeInUp ftco-animated">
				<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
					<div class="categories">
						<h3>마이페이지</h3>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/member/mytype"> 내 유형 </a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/myProfile"> 나의 프로필 </a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>

$(document).ready(function() {
	
	// 수정버튼 클릭시 사진 등록
	$('#profileSubmit').click(function() {
		// 파일첨부가 안됬을 시
		if($('#inputGroupFile03')[0].files.length==0){ 
		
			alert('사진을 첨부해주세요');
			return false;
		}
		
		var formData = new FormData(); 
		var files = $('#inputGroupFile03')[0].files;
		console.log(files);
		if(!checkExtension(files[0].name, files[0].size)){
			return false;
		}
		formData.append("files", files[0]);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/myProfileUpload",
			method : "POST",
			processData : false,   // 이 두개를 반드시 false로 해야한다고함.. 이유는 모름
			contentType : false, 
			dataType : 'html',
			data : formData,
			success : function (data) {
				console.log(data);
				alert('수정성공');
			},
			error : function () {
				
			}
		});
		
		$('#inputGroupFile03')[0].files = null; // 파일태그 초기화
		$('#inputGroupFile03label').html(''); // 파일첨부가 끝나면, 파일 이름 지우기
		getProfile();  //  서버로부터 URL 가져옴
		//window.location.reload();
	});
	
	// 클릭시 프로필 사진 정보 삭제
	$('#profiledelete').click(function() {
	
		$.ajax({
			url : "${pageContext.request.contextPath}/myProfileDelete",
			method : "GET",
			dataType : 'html',
			success : function (data) {
				console.log(data);
				alert('삭제성공');
			},
			error : function () {
				
			}
		});
		
		$('.my-image img').attr('src','${pageContext.request.contextPath}/resources/images/normal.png');
		// window.location.reload();
	});
	
	// 파일첨부에 사진 올렸을때, label에도 파일의 이름이 보이도록
	$('#inputGroupFile03').change(function() {
		$('#inputGroupFile03label').html(this.files[0].name);
		console.log(this.files[0].name);
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");   // 파일 확장자 제외,,  정규식
	var maxSize = 5242880; //5MB
	
	/* 파일의 사이즈랑, 확장자를 통해서 이미지인지 아닌지를 확인하는 함수 */
	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	// 내 프로필 사진과 별명 정보를 가져오는 함수,  ajax 사용
	function getProfile() {
		var id = '${login.id}';
		var data = { 'id' : id};
		$.ajax({
			url : '${pageContext.request.contextPath}/member/getProfile',
			method : 'POST',
			data : data,
			dataType : 'json',
			success : function(data) {
				console.log(data);
				$('.my-image img').attr('src','${pageContext.request.contextPath}'+data.uuidpath);
			},
		});
	}
	
	getProfile();
});

</script>

<jsp:include page="../info/footer.jsp"></jsp:include>
