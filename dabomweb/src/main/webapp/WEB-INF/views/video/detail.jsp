<%@page import="com.dabom.dto.VideoUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>${ vUpload.videoTitle }</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
   
			
			<div class="content-body">

                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-box ml-0 ml-sm-4 ml-sm-0">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="right-box-padding">
                                                <div class="read-content">
                                                    <div class="media pt-3">
                                                        <video src="/dabomweb/resources/upload-files/${ vUpload.videoSavedName }" width="1280" height="748" poster="/dabomweb/resources/upload-files/${ vUpload.thumbnailSavedName }" controls></video>
                                                    </div>
                                                    <div class="media-body">
                                                    		<br>
                                                            <h5 class="text-primary">[${ vUpload.videoType }] ${ vUpload.videoTitle }</h5>
                                                            <p class="mb-0">${ vUpload.uploadTime }</p>
                                                            <a href="javascript:void()" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="fa fa-long-arrow-right"></i> </a>
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="fa fa-trash"></i></a>
                                                        </div>
                                                    <hr>
                                                    <div class="media mb-4 mt-5">
                                                        <p>${ vUpload.content }</p>
                                                        <hr>
                                                    </div>
                                                    <hr>
                                                    <div class="form-group pt-3">
                                                        <textarea class="w-100" name="write-email" id="write-email" cols="30" rows="5" placeholder="댓글을 입력하세요"></textarea>
                                                    </div>
                                                </div>
                                                <div class="text-right">
                                                    <button class="btn btn-primary btn-sl-sm mb-5" type="button">댓글작성</button>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-right">
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-update-btn" type="button">수정</button>
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-delete-btn" type="button">삭제</button>
                        	<!-- <button class="btn btn-primary btn-sl-sm mb-5" type="button">목록</button> -->
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-list-btn" type="button">채널목록</button>
                            <button class="btn btn-primary btn-sl-sm mb-5" id="to-uploadList-btn" type="button">업로드 목록</button>
                        </div>
                    </div>
                </div>
            </div>
        





	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

	<script type="text/javascript">
	
		$('#to-delete-btn').click(function(event){
		event.preventDefault();
		var ok = confirm('삭제한 글은 복구가 불가능합니다. 정말 삭제하시겠습니까?');
		if (ok){
			location.href = 'delete?videoNo=${vUpload.videoNo}';
		}
		});
	
		$('#to-update-btn').on('click',function(event){
			event.preventDefault();
			location.href='update?videoNo=${vUpload.videoNo}';
		});
		
	</script>
</body>
</html>