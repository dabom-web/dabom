<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                
                                <div class="email-left-box ml-0 ml-sm-4 ml-sm-0">
                                    <select class="form-control" name="selectType">
                                            <option>무비</option>
                                            <option>커버</option>
                                            <option>창작</option>
                                    </select>
                                    <select class="form-control" name="selectSeries">
                                            <option>Option 1</option>
                                            <option>Option 2</option>
                                            <option>Option 3</option>
                                    </select>
                                    <div class="compose-content">
                                        <form action="#">
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder="제목을 입력하세요">
                                            </div>
                                            <div class="form-group">
                                                <textarea id="email-compose-editor" class="textarea_editor form-control bg-transparent" rows="15" placeholder="Enter text ..."></textarea>
                                            </div>
                                        </form>
                                        <h5 class="mb-4"><i class="fa fa-paperclip"></i> 영상 첨부</h5>
                                        <form action="#" class="d-flex flex-column align-items-center justify-content-center">
                                            <div class="fallback w-100">
                                                <input type="file" class="dropify" data-default-file="" />
                                            </div>
                                        </form>
                                        <h5 class="mb-4"><i class="fa fa-paperclip"></i> 썸네일 첨부</h5>
                                        <form action="#" class="d-flex flex-column align-items-center justify-content-center">
                                            <div class="fallback w-100">
                                                <input type="file" class="dropify" data-default-file="" />
                                            </div>
                                        </form>
                                    </div>
                                    <div class="text-left mt-4 mb-5">
                                        <button class="btn btn-primary btn-sl-sm mr-3" type="button"><span
                                                class="mr-2"><i class="fa fa-paper-plane"></i></span> 업로드</button>
                                        <button class="btn btn-dark btn-sl-sm" type="button"><span class="mr-2"><i
                                                    class="fa fa-times" aria-hidden="true"></i></span> 취소</button>
                                    </div>
                                </div>
                                <div class="email-right-box px-0 mb-5">
                                    <div class="p-0">
                                        <a href="email-compose.html" class="btn btn-primary btn-block">Compose</a>
                                    </div>
                                    <div class="mail-list mt-4">
                                        <a href="email-inbox.html" class="list-group-item active"><i
                                                class="fa fa-inbox font-18 align-middle mr-2"></i> Inbox <span
                                                class="badge badge-primary badge-sm float-right">198</span> </a>
                                        <a href="javascript:void()" class="list-group-item"><i
                                                class="fa fa-paper-plane font-18 align-middle mr-2"></i>Sent</a> <a href="javascript:void()" class="list-group-item"><i
                                                class="fa fa-star-o font-18 align-middle mr-2"></i>Important <span
                                                class="badge badge-danger text-white badge-sm float-right">47</span>
                                        </a>
                                        <a href="javascript:void()" class="list-group-item"><i
                                                class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>Draft</a><a href="javascript:void()" class="list-group-item"><i
                                                class="fa fa-trash font-18 align-middle mr-2"></i>Trash</a>
                                    </div>
                                    <div class="intro-title d-flex justify-content-between">
                                        <h5>Categories</h5>
                                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                    </div>
                                    <div class="mail-list mt-4">
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-warning"><i
                                                    class="fa fa-circle" aria-hidden="true"></i></span>
                                            Work </a>
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-primary"><i
                                                    class="fa fa-circle" aria-hidden="true"></i></span>
                                            Private </a>
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-success"><i
                                                    class="fa fa-circle" aria-hidden="true"></i></span>
                                            Support </a>
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-dpink"><i
                                                    class="fa fa-circle" aria-hidden="true"></i></span>
                                            Social </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>