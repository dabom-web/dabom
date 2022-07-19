<%@page import="com.dabom.dto.VideoUpload"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                    <table class="table student-data-table table-hover m-t-20">
                                        <thead style="text-align:center">
                                            <tr>
                                                <th><input type="checkbox" name="checkAll" id="checkAll"></th>
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
                                            	<td style="text-align:center"><input type="checkbox" name="videoCheck" value="${ vUpload.videoNo }" /></td>
                                            
                                            	<td style="text-align:center">${ vUpload.open }</td>
                                            	<td style="text-align:center">${ vUpload.videoType }</td>
                                            	<td style="text-align:center"><a href="/dabomweb/video/update?videoNo=${ vUpload.videoNo }"><img src='/dabomweb/resources/upload-files/${ vUpload.thumbnailSavedName }' width="100" height="50"></a></td>
                                            	<td><a href="/dabomweb/video/update?videoNo=${ vUpload.videoNo }">${ vUpload.videoTitle }</a></td>
                                            	<td style="text-align:center">${ vUpload.uploadTime }</td>
                                            	<td style="text-align:center">${ vUpload.updateTime }</td>
                                            </tr>
                                            
                                            </c:forEach>
                                        	
                                            
                                            
                                        </tbody>
                                        
                                    </table>
                                    <div class="p-0">
                                        <button type="button" id="to-delete-list-btn" class="btn btn-primary">선택한 동영상 삭제</button>
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
                                                <!-- <button class="btn btn-dark" type="button"><i class="fa fa-angle-left"></i>
                                                </button>
                                                <button class="btn btn-dark" type="button"><i class="fa fa-angle-right"></i>
                                                </button> -->
                                                <ul class="pagination pagination-sm m-0">
					                            	${ uPager }
				                            	</ul>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
											
            </div>
        </div>


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	
	
	
	<script type="text/javascript">
	$(function() {		
	
		$('#to-delete-list-btn').click(function(event){
			event.preventDefault();
			
			var videoCheck = "";
			$("input[name='videoCheck']:checked").each(function(){	// videoCheck라는 이름을 가진 모든 체크박스 일괄 제거
				videoCheck = videoCheck + $(this).val()+",";
			});
			videoCheck = videoCheck.substring(0, videoCheck.lastIndexOf( ","));	// 맨끝 콤마 지우기
			
			if(videoCheck == ''){	// 아무것도 선택된게 없을 때
				alert("삭제할 영상을 선택하세요.");
				return false;
			}			
			
			var ok = confirm('삭제한 영상은 복구가 불가능합니다. 정말 선택된 영상들을 삭제하시겠습니까?');
			if (ok){
				location.href = 'deleteChecked?videoNos=' + videoCheck;
			}
		});
	
	

});

	
	</script>
</body>
</html>