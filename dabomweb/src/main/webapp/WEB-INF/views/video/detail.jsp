<%@page import="com.dabom.dto.VideoUpload"%>
<%@page import="com.dabom.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <div class="col-lg-10">
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
                                                            <h5 class="text-primary">[${ vUpload.videoType }] ${ vUpload.videoTitle }<button type="button" class="btn btn-danger float-right">Like it<span
						                                        class="btn-icon-right"><i class="fa fa-heart"></i></span>
						                                </button></h5>
                                                            <p class="mb-0"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${ vUpload.uploadTime }"/></p>
                                                        </div>
                                                    <hr>
                                                    <div class="media mb-4 mt-5">
                                                        <p>${ vUpload.content }</p>
                                                        <hr>
                                                    </div>
                                                    <hr><!-- ?????????????????? ?????? -->
                                                    <br>
                                                    		<div class="card" >
													<div class="b">??????</div>
								                        <table class="table table-hover bl">
					                                       <tbody id="videoComment-list">
					                                        </tbody>
					                                    </table>
							                      <div class="card-header">
								                      <h4 class="card-title b">????????????</h4>
	 						                     </div>
						                            <div class="card-body">
						                                <div class="basic-form">
						                                    <form id="comment-form" method="post" action="videoComment-write">
						                                    <input name="memberId" value="${ loginuser.memberId }" type="hidden">
						                                    <input name="movieNo" value="${ vUpload.videoNo }" type="hidden">
						                                        <div class="form-group">
						                                            <textarea name="comment"
						                                            class="form-control" rows="6" 
						                                            id="comment" style="resize: none;"></textarea>
						                                        </div>
						                                    </form>
						                                </div>
						                                <div>
							                                <a class="btn btn-light btn-xs b" id="comment-btn"  
															   style="width: 100px;" > 
																????????????
															</a>
															 <a class="btn btn-light btn-xs b" id="comment-cancel-btn"  
															   style="width: 100px;" > 
																????????????
															</a>
														</div>
							                            </div>
						                        	</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-right">
                        	<c:if test="${ loginuser.memberId eq vUpload.memberId }">
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-update-btn" type="button">??????</button>
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-delete-btn" type="button">??????</button>
                        	 <button class="btn btn-primary btn-sl-sm mb-5" id="to-uploadList-btn" type="button">????????? ??????</button>
                        	</c:if>
                        	<!-- <button class="btn btn-primary btn-sl-sm mb-5" type="button">??????</button> -->
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-list-btn" type="button">????????????</button>
                           
                        </div>
                    </div>
                </div>
            </div>
        





	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

	<script type="text/javascript">
	
		$('#to-list-btn').on('click',function(event){
			event.preventDefault();
			location.href='list';
		});
		
		$('#to-uploadList-btn').on('click',function(event){
			event.preventDefault();
			location.href='uploadList';
		});
	
		$('#to-delete-btn').click(function(event){
		event.preventDefault();
		var ok = confirm('????????? ?????? ????????? ??????????????????. ?????? ?????????????????????????');
		if (ok){
			location.href = 'delete?videoNo=${vUpload.videoNo}';
		}
		});
	
		$('#to-update-btn').on('click',function(event){
			event.preventDefault();
			location.href='update?videoNo=${vUpload.videoNo}';
		});
		
		////////////////////////////////////////////////////////
		
		// ?????? ?????? ????????????
		//$('#comment-list').load('comment-list?videoNo=' + ${vUpload.videoNo});
		
		// ?????? ??????
		/* $('#submit-comment').on('click', function(event){
			/* var content = $('#write-comment').val;
			if(content.leng == 0){
				alert('????????? ???????????????');
				return;
			}
			
			var formData = $('#comment-form').serialize();
			
			$.ajax({
				"url" : $('#comment-form').attr('action'),
				"method" : "post",
				"async" : true,
				"data" : formData,
				"dataType" : "text"
				"success" : function(data, status, xhr){
					if(data === "success"){
						$('#comment-list').load('comment-list?videoNo=' + ${vUpload.videoNo});
					}else{
						alert('?????? ????????? ?????????????????????.');
					}
				},
				"error" : function(xhr, status, err){
					alert('?????? ?????? ??? ?????? ??????');
				}
			}); */
		/* });
		
		$('#comment-list').on('click', '.delete-comment', function(event){
			var commentNo = $(this).attr("data-commentno");
			var ok = confirm(commentNo + "????????? ????????? ????????? ??????????????????. ????????? ?????????????????????????");
			if (!ok){
				return;
			}
			
			$.ajax({
				"url" : "comment-delete",
				"method" : "get",
				"async" : true,
				"data" : "commentno=" + commentNo,
				"dataType" : "text",
				"success" : function(data, status, xhr){
					$('#comment-list').load('comment-list?videoNo=' + ${vUpload.videoNo});
				},
				"error" : function(xhr, status, err){
					alert('????????? ?????????????????????.');
				}
			}); */
			
		/* }); */ 
		
		$(function() {
		
			$('#videoComment-list').load('videoComment-list?movieNo=' + ${ vUpload.videoNo });
			
			$('#comment-btn').click(function(event) {
				event.preventDefault();
				var formData = $('#comment-form').serialize();
				$.ajax({
					"url" : "videoComment-write",
					"method" : "post",
					"async" : true,
					"data" : formData,
					"dataType" : "text",
					"success" : function(result, status, xhr) {
						if (result === "success") {
							alert('????????????');
							$('#videoComment-list').load('videoComment-list?movieNo=' + ${ vUpload.videoNo  });
							//location.href = "/dabomweb/produceBoard/actorDetail?boardNo=${produceBoard.boardNo}";
							$('#comment-form')[0].reset();
							return;
						} else {
							alert('?????? ??????');
						}
					},
					"error" : function(xhr, status, err) {
						alert('?????? ?????????????????????.');
					}
				});
			});
			
				
			$('#comment-cancel-btn').on('click', function(event) {
				event.preventDefault();
				var ok = confirm('????????? ???????????????');
				if( ok ) {
					//location.href = "/dabomweb/produceBoard/actorDetail?boardno=${produceBoard.boardNo}";
					$('#comment-form')[0].reset();
					return;
				}
			});
			
		
		});
		
		
	</script>
</body>
</html>