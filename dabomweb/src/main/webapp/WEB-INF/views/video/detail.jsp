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
                                                    <hr><!-- 댓글표시영역 시작 -->
                                                    <br>
                                                    		<div class="card" >
													<div class="b">댓글</div>
								                        <table class="table table-hover bl">
					                                       <tbody id="videoComment-list">
					                                        </tbody>
					                                    </table>
							                      <div class="card-header">
								                      <h4 class="card-title b">댓글작성</h4>
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
																댓글등록
															</a>
															 <a class="btn btn-light btn-xs b" id="comment-cancel-btn"  
															   style="width: 100px;" > 
																입력취소
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
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-update-btn" type="button">수정</button>
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-delete-btn" type="button">삭제</button>
                        	 <button class="btn btn-primary btn-sl-sm mb-5" id="to-uploadList-btn" type="button">업로드 목록</button>
                        	</c:if>
                        	<!-- <button class="btn btn-primary btn-sl-sm mb-5" type="button">목록</button> -->
                        	<button class="btn btn-primary btn-sl-sm mb-5" id="to-list-btn" type="button">채널목록</button>
                           
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
		var ok = confirm('삭제한 글은 복구가 불가능합니다. 정말 삭제하시겠습니까?');
		if (ok){
			location.href = 'delete?videoNo=${vUpload.videoNo}';
		}
		});
	
		$('#to-update-btn').on('click',function(event){
			event.preventDefault();
			location.href='update?videoNo=${vUpload.videoNo}';
		});
		
		////////////////////////////////////////////////////////
		
		// 댓글 목록 가져오기
		//$('#comment-list').load('comment-list?videoNo=' + ${vUpload.videoNo});
		
		// 댓글 쓰기
		/* $('#submit-comment').on('click', function(event){
			/* var content = $('#write-comment').val;
			if(content.leng == 0){
				alert('내용을 작성하세요');
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
						alert('댓글 작성에 실패하였습니다.');
					}
				},
				"error" : function(xhr, status, err){
					alert('댓글 작성 중 오류 발생');
				}
			}); */
		/* });
		
		$('#comment-list').on('click', '.delete-comment', function(event){
			var commentNo = $(this).attr("data-commentno");
			var ok = confirm(commentNo + "삭제한 댓글은 복구가 불가능합니다. 정말로 삭제하시겠습니까?");
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
					alert('삭제에 실패하였습니다.');
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
							alert('등록성공');
							$('#videoComment-list').load('videoComment-list?movieNo=' + ${ vUpload.videoNo  });
							//location.href = "/dabomweb/produceBoard/actorDetail?boardNo=${produceBoard.boardNo}";
							$('#comment-form')[0].reset();
							return;
						} else {
							alert('입력 실패');
						}
					},
					"error" : function(xhr, status, err) {
						alert('등록 실패하였습니다.');
					}
				});
			});
			
				
			$('#comment-cancel-btn').on('click', function(event) {
				event.preventDefault();
				var ok = confirm('입력을 취소합니다');
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