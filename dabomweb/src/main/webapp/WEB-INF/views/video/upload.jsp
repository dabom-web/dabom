<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>DABOM | 동영상 업로드</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
   
	<div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>동영상 업로드</h4>
                            <span class="ml-1">무비, 커버, 창작 등 여러분의 작품을 자유롭게 올려주세요</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Channel</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">영상업로드</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                <form id="uploadform" action="upload" method="post" enctype="multipart/form-data">
                <div class="email-box col-lg-12"><!-- 이걸 right를 지워 말어... right 해서 left에다가 영상 미리보기를 집어넣을까? -->
                                    <div class="toolbar mb-4" role="toolbar">
                                        <div class="form-group col-lg-2">
                                        <b>공개</b>
                                                <select id="inputState" class="form-control" name="open">
                                                    <option value="일반공개" selected>일반공개</option>
                                                    <option value="유료공개">유료공개</option>
                                                    <option value="비공개">비공개</option>
                                                </select>
						                   <b>분류</b>
                                                <select id="inputState" class="form-control" name="videoType">
                                                    <option value="MOVIE" selected>MOVIE</option>
                                                    <option value="DANCE">DANCE</option>
                                                    <option value="SONG">SONG</option>
                                                </select>
						                  <b>시리즈</b>
						                  <select id="inputState" class="form-control">
						                    <option selected>새 시리즈</option>
						                  </select>
						                </div>
                                    </div>
                                    <div class="compose-content">
                                        
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" name="videoTitle" placeholder=" 제목을 입력하세요">
                                            </div>
                                            <div class="form-group">
                                            <input type="hidden" name="memberId" value="${ vUpload.memberId }" >
                                            </div>
                                            <div class="form-group">
                                                <textarea id="email-compose-editor" class="textarea_editor form-control bg-transparent" name="content" rows="15" placeholder="내용을 소개해보세요" style="resize:none"></textarea>
                                            </div>
                                        
                                        <h5 class="mb-4"><i class="fa fa-paperclip"></i> 동영상 업로드</h5>
                                        
                                            <div class="fallback w-100">
                                                <input type="file" class="dropify" name="video" data-default-file="" accept="video/*" />
                                            </div>
                                        
                                        <br>
                                         <h5 class="mb-4"><i class="fa fa-paperclip"></i> 썸네일 업로드</h5>
                                        
                                            <div class="fallback w-100">
                                                <input type="file" class="dropify" name="thumbnail" data-default-file="" accept="image/*" onchange="readURL(this);" />
                                                <img id="preview" width="500" height="250" >
                                            </div>
                                        
                                    </div>
                                    <div class="text-left mt-4 mb-5">
                                        <button class="btn btn-primary btn-sl-sm mr-3" id="upload-btn" type="button"><span
                                                class="mr-2"><i class="fa fa-paper-plane"></i></span> 등록</button>
                                        <button class="btn btn-dark btn-sl-sm" id="cancel-btn" type="button"><span class="mr-2"><i
                                                    class="fa fa-times" aria-hidden="true"></i></span> 취소</button>
                                    </div>
                                </div>
                         </form>

            </div>
        </div>


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	
	<script type="text/javascript">
		$(function(){
			$('#upload-btn').on('click', function(event){
				event.preventDefault();
				$('#uploadform').submit();
			});
		});
		$(function(){
			$('#cancel-btn').on('click', function(event){
				event.preventDefault();
				location.href='uploadList';
			});
		});
		
		function setThumbnail(event) {
	        var reader = new FileReader();

	        reader.onload = function(event) {
	          var img = document.createElement("img");
	          img.setAttribute("src", event.target.result);
	          document.querySelector("div#image_container").appendChild(img);
	        };

	        reader.readAsDataURL(event.target.files[0]);
	      }
	
		function readURL(input) {
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			    };
			    reader.readAsDataURL(input.files[0]);
			  } else {
			    document.getElementById('preview').src = "";
			  }
			}
		
	</script>

</body>
</html>