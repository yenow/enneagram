<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>enneagram</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css">
</head>
<body>
	
	<c:if test="${login eq null }">
		<script type="text/javascript">
			alert('로그인이 필요합니다');
			location.href='${pageContext.request.contextPath}/member/login';
		</script>
	</c:if>
	<!-- nav -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #efbbcf; padding: 2px;">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">Ennegram</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a href="${pageContext.request.contextPath}" class="nav-link">Home</a>
				</li>
				<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/test/test" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">테스트</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/test">테스트</a> 
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/test_complete">결과</a>
						</div>
					</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/enneagram/enneagram?category=enneagram" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">에니어그램</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=enneagram">에니어그램</a> 
							<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=history">역사</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=eclass">분류</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/enneagram/enneagram?category=type">9가지 유형</a>
					</div>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/board/boardList" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList?category=공지사항">공지사항</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList?category=속닥속닥">속닥속닥</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList?category=자료실">자료실</a>
					</div>
				</li>

				<li class="nav-item">
					<a href="contact.html" class="nav-link">실시간 채팅</a>
				</li>
			</ul>
		</div>
	</nav>
	<!-- /nav -->

	<!-- content -->
	<div class="container-fluid">
		<h2 class="text-center my-3">게시판 등록</h2>
		<%-- action="${pageContext.request.contextPath}/board/boardWrite_ok?catetgory=${category} --%>
		<form id="boardWrite-form">
			<input type="hidden" name="mno" value="${login.mno }">
			<input type="hidden" name="id" value="${login.id }">
			<input type="hidden" name="nickname" value="${login.nickname }">
			<input type="hidden" name="category" value="${category }">
			
			<div class="row justify-content-end" style="padding: 0 30px;">
				<!-- 파일첨부 -->
				<c:if test="${category == '자료실' }">
					<div class="input-group">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="customFile" aria-describedby="inputGroupFileAddon04" multiple="multiple">
							<label class="custom-file-label" for="customFile">파일선택</label>
						</div>
						<!-- 등록버튼 -->
						<div class="input-group-append">
							<a href="${pageContext.request.contextPath}/board/boardList?category=${category}" class="btn btn-outline-secondary submit-button" type="submit" id="inputGroupFileAddon04">등록</a>
						</div>
					</div>
				</c:if>
				<c:if test="${category != '자료실' }">
					<div class="input-group-append">
						<a href="${pageContext.request.contextPath}/board/boardList?category=${category}" class="btn btn-outline-secondary submit-button" type="submit" id="inputGroupFileAddon04">등록</a>
					</div>
				</c:if>
			</div>
			<!--  첨부된 파일 표시  -->
			<div class="col-12 attach-div">
				<ul class="list-group" style="margin: 0.5em 0">
					
				</ul>
			</div>
			<!-- 제목 -->
			<div class="input-group col-12">
				<input type="text" class="form-control" name="title" id="title" placeholder="제목" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
			<!-- /제목 -->
			<!-- 내용 -->
			<div class="col-12 mb-2">
				<textarea id="summernote" name="content"></textarea>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : 500, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
			callbacks : { //여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0], this);
				}
			}
		});

		var attachFileList = new Object();
		var AttachFileDTOArray = new Array();
		var AttachFileDTO = new Object();

		/* 이미지 파일 업로드 */
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "${pageContext.request.contextPath}/uploadSummernoteImageFile",
				contentType : false,
				processData : false,
				success : function(data) {
							//항상 업로드된 파일의 url이 있어야 한다.
					console.log(data);
					AttachFileDTOArray.push(data.attachFileDTO);
					console.log(AttachFileDTOArray);
					$(editor).summernote('insertImage',
					data.attachFileDTO.mappingURL);
					}
				});
		}


	    $(document).ready(function () {
	    	
	    	// 제출될때 이벤트 발생
	        $('.submit-button').click(function () {
	        		// 제목 유효성 검증
	        		if($('#title').val()==''){
	        			alert('제목을 입력해주세요');
	        			return false;
	        		}

	        	
	                //폼 태그도 ajax로 보내야함;; 그리고 다 되었으면 다시 ajax로 보내고,, 그리고 location.href로 이동
	                var data = {};
	                //serialize() 활용하기
	                var str = $("form").serialize();
	                console.log(str);
	                var category = '${category}';
	                data.str = str;
	                // data.AttachFileDTOArray = AttachFileDTOArray;
	                // data.category = category;
	                console.log(data);

	                $.ajax({
	                    data: str,
	                    type: 'POST',
	                    dataType: 'html',
	                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	                    url: "${pageContext.request.contextPath}/board/boardWriteAjax",
	                    success: function (data) {

	                        console.log(data);
	                        data *= 1; // bno 숫자타입으로 만들기
	                        console.log(typeof bno);
	                        AttachFileDTOArray[0].bno = data;
	                        console.log(AttachFileDTOArray[0]);

	                        for (var i = 0; i < AttachFileDTOArray.length; i++) {
	                            AttachFileDTOArray[i].bno = data;
	                            AttachFileDTOArray[i].mno = null;
	                            
	                        }
	                        console.log(AttachFileDTOArray);

	                        $.ajax({
	                                data: JSON.stringify(AttachFileDTOArray),
	                                type: 'POST',
	                                dataType: 'html',
	                                contentType: 'application/json; charset=UTF-8',
	                                url: "${pageContext.request.contextPath}/board/boardAttachFileDTO",
	                                success: function (data) {
	                                    console.log(data);
	                                    if (data == "success") {
	                                    	
	                                    	window.location.replace='${pageContext.request.contextPath}/board/boardList?category=${category}';
	                                    } else {
	                                        alert('등록이 되지 않았습니다');
	                                       
	                                    }
	                                }
	                            }); // end ajax
	                            
	                            
	                    	$.ajax({
	                    		
	                    	});

	                    } // end success function
	                }); // end ajax	  	
	                // window.location.replace='${pageContext.request.contextPath}/board/boardList?category=${category}';
	            }); // end  $('#boardWrite-form').submit(function()
	            	
	        //summersnote Imagefile 보내기
	        
	            		
	        // 파일 선택시 호출됨 -> upload폴더에 파일 저장 및 파일HTML태그 추가
	    	$('#customFile').change(function() {
				// console.log('change');  //// console.log(this.files); //// console.log(this.files[0]); //
				
				var files= this.files;
				var formdata = new FormData();
				for(var i=0; i<files.length ; i++){
					formdata.append('file',files[i]);   // name은 키값인가?
				}
				// console.log(formdata);  //// console.log(formdata.get('file'));  //
				$.ajax({
					url: '${pageContext.request.contextPath}/fileupload', // 클라이언트가 요청을 보낼 서버의 URL 주소
					processData : false,   // 이 두개를 반드시 false로 해야한다고함.. 이유는 모름
					contentType : false, 
					data: formdata,        // HTTP 요청과 함께 서버로 보낼 데이터
					type: 'POST',          // HTTP 요청 방식(GET, POST)
					dataType: 'json',      // 호출 했을 때 결과타입
					success : function(AttachFileDTOList) {
						
						for(var i=0; i<AttachFileDTOList.length; i++){
							AttachFileDTOArray.push(AttachFileDTOList[i]);
						}
						// AttachFileDTO 객체를 받으면
						if(AttachFileDTOList!=null){
							attachFileAppend(AttachFileDTOList);
						} 
					}
				});
			});
	            
	       	function fileSizeCheck(file) {
				if(file.size>20971520){ // 20MB
					alert('20MB이상 첨부 불가능');
					return false; 
				}  
			}
	       	
	       	function attachFileAppend(attachFile) {
				
	       		for(var i=0; i<attachFile.length; i++){
	       			console.log(attachFile);
	       			$('.attach-div ul').append($('<li class="list-group-item" style="font-size: 15px; padding: 0.25rem 0.5rem;">'+attachFile[i].originalFileName+' <a data-realName="'+attachFile[i].realName+'" data-uploadPath="'+attachFile[i].uploadPath+'" onclick="deleteAttachtFile(this);"><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-x float-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/><path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/></svg></a></li>'));   
	       		}
			}
	    }); // end $(document).ready
		
		// x표시 클릭할시, 태그와 upload폴더의 파일 삭제
		function deleteAttachtFile(data) {
			$aTag = data;
			var dataSet = new Object(); 
			dataSet.realName = $(data).data('realname');
			dataSet.uploadPath = $(data).data('uploadpath');
			$.ajax({
				url: '${pageContext.request.contextPath}/fileDelete', // 클라이언트가 요청을 보낼 서버의 URL 주소
				data: dataSet,        // HTTP 요청과 함께 서버로 보낼 데이터
				type: 'GET',          // HTTP 요청 방식(GET, POST)
				dataType: 'html',      // 호출 했을 때 결과타입
				success : function(data) {
					console.log(data);
					if(data=='success'){
						$parent = $aTag.parentNode;
						$parent.remove();
					}
				}	
			});
		}
	    
	</script>



</body>
</html>
