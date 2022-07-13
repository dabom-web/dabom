<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>제목 표시란(작업중) ${ vUpload.videoTitle }</title>
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
                                                        <video class="mr-4 rounded-circle" src="/dabomweb/resources/upload-files/${ vUpload.videoSavedName }" ></video>
                                                        <div class="media-body">
                                                            <h5 class="text-primary">제목 및 시간 표시란(작업중) ${ vUpload.videoTitle }</h5>
                                                            <p class="mb-0">${ vUpload.uploadTime }</p>
                                                        </div>
                                                        <a href="javascript:void()" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="fa fa-long-arrow-right"></i> </a>
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="fa fa-trash"></i></a>
                                                    </div>
                                                    <hr>
                                                    <div class="media mb-4 mt-5">
                                                    <p>내용 표시란(작업중)</p>
                                                        <p>${ vUpload.content }</p>
                                                        <hr>
                                                    </div>
                                                    <hr>
                                                    <div class="form-group pt-3">
                                                        <textarea class="w-100" name="write-email" id="write-email" cols="30" rows="5" placeholder="It's really an amazing.I want to know more about it..!"></textarea>
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
                        	<button class="btn btn-primary btn-sl-sm mb-5" type="button">목록</button>
                        	<button class="btn btn-primary btn-sl-sm mb-5" type="button">채널목록</button>
                            <button class="btn btn-primary btn-sl-sm mb-5" type="button">업로드 목록</button>
                        </div>
                    </div>
                </div>
            </div>
        





	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>