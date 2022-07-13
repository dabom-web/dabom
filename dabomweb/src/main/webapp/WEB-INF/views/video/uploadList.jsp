<%@page import="com.dabom.dto.VideoUpload"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="email-box col-lg-12">
                                   
                    
                  <div class="card">
                            <div class="card-header">
                                <h4 class="card-title"><b>업로드한 동영상</b></h4>
                                <div class="p-0">
                                        <a href="/dabomweb/video/upload" class="btn btn-primary float-right">새 동영상 업로드</a>
                                    	</div>
                            </div>
                             <div role="toolbar" class="toolbar ml-4 ml-sm-0">
                                        
                                    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table student-data-table m-t-20">
                                        <thead style="text-align:center">
                                            <tr>
                                                <th><input type="checkbox" id="checkAll"></th>
                                                <th>공개</th>
                                                <th>분류</th>
                                                <th>썸네일</th>
                                                <th>제목</th>
                                                <th>업로드 날짜</th>
                                                <th>수정된 날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="vUpload" items="${ vUploadList }">
                                            <tr>
                                            	<td style="text-align:center"><input type="checkbox" /></td>
                                            	<td style="text-align:center">${ vUpload.open }</td>
                                            	<td style="text-align:center">${ vUpload.videoType }</td>
                                            	<td style="text-align:center"><img src='/dabomweb/resources/upload-files/${ vUpload.thumbnailSavedName }' width="100" height="50"></td>
                                            	<td>${ vUpload.videoTitle }</td>
                                            	<td style="text-align:center">${ vUpload.uploadTime }</td>
                                            	<td style="text-align:center">${ vUpload.updateTime }</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="p-0">
                                        <a href="" class="btn btn-primary ">선택한 동영상 삭제</a>
                                    	</div>
                                </div>
                            </div>
                        </div>
                                    <!-- panel -->
                                    <div class="row mt-4 m-4 mx-sm-4">
                                        <div class="col-7">
                                            <div class="text-left"></div>
                                        </div>
                                        <div class="col-5">
                                            <div class="btn-group float-right">
                                                <button class="btn btn-dark" type="button"><i class="fa fa-angle-left"></i>
                                                </button>
                                                <button class="btn btn-dark" type="button"><i class="fa fa-angle-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
											<div class="p-0">
                                        <a href="/dabomweb/video/detail" class="btn btn-primary float-right">상세정보 (작업중/미완성/추후 게시판에 적용 예정)</a>
                                    	</div>
            </div>
        </div>


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	
	$("#checkAll").change(function(){

  if (! $('input:checkbox').is('checked')) {
      $('input:checkbox').prop('checked',true);
  } else {
      $('input:checkbox').prop('checked', false);
  }       
});

</body>
</html>