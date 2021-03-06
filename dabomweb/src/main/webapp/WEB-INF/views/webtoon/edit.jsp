<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>수정</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

		
		 <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text" align="center">
                            <h4>회차별 웹툰 올리기</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                  
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
  \
                                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0" >
                                    <div class="toolbar mb-4" role="toolbar">
                                    
                                    </div>
                                    <form id="editForm" action="edit" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="boardNo" value="${ param.boardno }">
                                    <input type="hidden" name="number" value="${ param.number }">
                                    <input type="hidden" name="pageNo" value="${ param.pageNo }">
                                    <input type="hidden" name="thumbnailAttachNo" value="${ thumbnailAttachNo }">
                                    <input type="hidden" name="webtoonAttachNo" value="${ webtoonAttachNo}">
                                    
                                    <div class="compose-content">
                                            <div class="form-group">
                                            	
	                                                <input type="text" name="title" class="form-control bg-transparent" value="${webtoonListByTitle.title }">
	                                            </div>
	                                          	 <div class="form-group">
	                                               ${ loginuser.memberId}
	                                            </div>
	                                     
		                                        <h5 class="mb-4"><i class="fa fa-paperclip"></i> 썸네일</h5>
		                                        <div class="d-flex flex-column align-items-center justify-content-center">
		                                            <div class="fallback w-100">
		                                                <input name="attach" type="file" class="dropify" data-default-file="" />
		                                            </div>
		                                        </div>
		                                        <br>
		                                          <h5 class="mb-4"><i class="fa fa-paperclip"></i> 웹툰파일</h5>
		                                        <div class="d-flex flex-column align-items-center justify-content-center">
		                                            <div class="fallback w-100">
		                                                <input name="attach" type="file" class="dropify" data-default-file="" />
		                                            </div>
		                                        </div>
	                                          
	                                        <br>
	                                       
	                                    </div>
	                                    <div class="text-left mt-4 mb-5">
	                                        <a href="javascript:" name="edit" id="edit" class="btn btn-primary btn-sl-sm mr-3" ><span
	                                                class="mr-2"><i class="fa fa-paper-plane"></i></span> 등록</a>
	                                        <a href="javascript:history.back()" class="btn btn-dark btn-sl-sm" ><span class="mr-2"><i
	                                                    class="fa fa-times" aria-hidden="true"></i></span> 취소</a>
	                                    </div>
                                     </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
		

	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

	
	<script type="text/javascript">
	
	$(function(){
		
		$('#edit').on('click',function(event){ //on : jquery의 이벤트 연결 함수 (addEventListener)
			event.preventDefault();
			$('#editForm').submit();
		
		});
	})
	
		
	</script>

</body>
</html>