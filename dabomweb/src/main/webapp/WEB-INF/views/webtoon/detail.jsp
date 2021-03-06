<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>${ webtoonListByTitle.title }</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">
    

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

	 <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
		
	               <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="profile-tab">
                                    <div class="custom-tab-1">
                                       
                                        <div class="tab-content">
                                            <div id="my-posts" class="tab-pane fade active show">
                                                <div class="my-post-content pt-3">
                                                    <div class="post-input">
                                                       
                                                    </div>
                                                    <div class="profile-uoloaded-post border-bottom-1 pb-5">
                                                        <img src="images/profile/8.jpg" alt="" class="img-fluid">
                                                       	<div>
                                                            <h4>${webtoonListByTitle.title }</h4>
                                                            <br>
                                                            <br>
                                                    	</div>
                                                    	<div>
                                        			 	
                                                    	<img src="/dabomweb/resources/upload-files/${ webtoonListByTitleattach[1].savedFileName }"/>
                                                  
                                                    	</div> 
                                                    
                                                        <p>????????? ???</p>
                                                        <button class="btn btn-primary mr-3"><span class="mr-3"><i
                                                                    class="fa fa-heart"></i></span>Like</button>
                                                   
                                                   		 <button class="btn btn-primary mr-3" id="add-comment-btn"><span class="mr-3"><i
                                                                    class="fa fa-heart"></i></span>????????????</button>
                                              
                                              				<br><br><br>
                                              				<c:if test="${ loginuser.memberId eq webtoonListByTitle.memberId}">
                               								<a id='delete-btn' href="#">????????????</a>
                               								<a id="edit-btn" href="#">????????????</a>
                                                    		</c:if>
                                                             
                                    
                                                     
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                      
    
                                          
                                        </div>
                                    </div>
                                </div>
        
                            </div>
                        </div>
               <!-- comment ?????? ?????? -->
                     <br>
		        <hr style="width:800px;margin:0 auto">
		        <br>
		        <table id="comment-list" style="width:800px;margin:0 auto">
		        
		        </table>
		        
                    </div>
				</div>
			</div>
		</div>	
		
		  <!-- comment ?????? ?????? -->
      
		
		<!-- modal -->
		
			<!-- Modal -->
	<div id="comment-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="comment-modal-label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="comment-modal-label">?????? ??????</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
            			<span aria-hidden="true">??</span>
          			</button>					
				</div>
				<div class="modal-body">
				<form id="comment-form">
					<div class="form-group">
						<label>??????</label>
						<textarea class="form-control" 
								  name='content' id='modal-content'></textarea>
					</div>
					<input type="hidden" name='writer' value='${ loginuser.memberId }'>
					<input type="hidden" name='number' value='${ webtoonListByTitle.number }'>
					<input type="hidden" name='commentNo' value="0">
					<input type="hidden" name='action'><!-- ?????? or ????????? ?????? -->
				</form>
				</div>
				<div class="modal-footer">
					<button id='modalRegisterBtn' type="button" class="btn btn-success btn-sm">????????????</button>
					<button id='modalCloseBtn' type="button" class="btn btn-success btn-sm">??????</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
		
	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

	<script type="text/javascript">
	$(function(){
		$('#delete-btn').click(function(event){
			event.preventDefault();
			var ok = confirm('?????????????????????????');
			if(ok){
				location.href='delete?boardno=${webtoonListByTitle.boardNo}&number=${webtoonListByTitle.number}&pageNo=${param.pageNo}'
			}
		})	
	});
	
	$(function(){
		$('#edit-btn').click(function(event){
			event.preventDefault();
			var ok = confirm('?????????????????????????')
			if(ok){
				location.href='edit?boardno=${webtoonListByTitle.boardNo}&pageNo=${param.pageNo}&number=${webtoonListByTitle.number}'
			}
		})
	})
	
	////////////////////////////////////////////////////////
	
	$('#comment-list').load('comment-list?number=' + ${ webtoonListByTitle.number });
		
		$('#add-comment-btn').on('click', function(event) {
			$('#modal-content').val("");
			$('#comment-form input[name=commentNo]').val(0);
			$('#comment-form').attr('action', "comment-write");
			$('#comment-modal').modal('show'); // show modal
		});
		
		$('#modalCloseBtn').on('click', function(event) {
			$('#comment-modal').modal('hide'); // hide modal
		});
	
		$('#modalRegisterBtn').on('click', function(event) {
			event.preventDefault();
			
			var content = $('#modal-content').val(); // val() == value ??????
			if (content.length == 0) {
				alert('????????? ???????????????');
				return;
			}
			
			var formData = $('#comment-form').serialize();
			// var formData = $('#comment-form').serializeArray();
			// alert(formData);		
			// return;
			
			$.ajax({
				"url" : $('#comment-form').attr('action'),
				"method" : "post",
				"async" : true,
				"data" : formData, // boardno=1&writer=imauser1&content=test
				"dataType" : "text",
				"success" : function(data, status, xhr) {
					if (data === "success") {
						$('#comment-modal').modal('hide');
						
						// ????????? ?????? ?????? ( load : ????????? ?????? ?????? HTML??? ????????? ????????? ??????)
						$('#comment-list').load('comment-list?number=' + ${ webtoonListByTitle.number });
					} else {
						alert('?????? ?????? ??????');
					}
				},
				"error" : function(xhr, status, err) {
					alert('?????? ?????? ??? ?????? ??????');
				}
			});
		});
		
	   // $('.deletecomment').on('click', function(event) { // ?????? ???????????? .deletecomment
	    	$('#comment-list').on('click', '.deletecomment', function(event) { // ?????? + ????????? ???????????? .deletecomment
	    	var commentNo = $(this).attr("data-commentno");
	    	
	    	var ok = confirm(commentNo + "??? ????????? ????????????????");
			if (!ok) {
				return;
			}
	    
	    	$.ajax({
				"url": "comment-delete",
				"method" : "get",
				"async" : true,
				"data" : "commentno=" + commentNo,
				"dataType" : "text",
				"success" : function(data, status, xhr) {					
					// ????????? ?????? ?????? ( load : ????????? ?????? ?????? HTML??? ????????? ????????? ??????)
					$('#comment-list').load('comment-list?number=' + ${ webtoonListByTitle.number });
				},
				"error" : function(xhr, status, err) {
					alert('?????? ??????');
				}
			});
		});
	</script>

</body>
</html>