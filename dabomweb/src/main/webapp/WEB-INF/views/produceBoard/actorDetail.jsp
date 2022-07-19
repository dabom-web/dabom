<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>배우정보상세보기</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">
	<jsp:include page="/WEB-INF/views/modules/css/font.jsp" />
	<style type="text/css">
		img {
		  object-fit: cover;
		  overflow: hidden;
		}
		.box {
		    width: 150px;
		    height: 150px; 
		    border-radius: 70%;
		    overflow: hidden;
		}
		a:link { color:black; }
		a:visited { color:black; }
		a:hover { color:lightgray; }
	
		.b {
			font-size: 9pt;
			font-weight: bolder;
		}
	</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

	<div class="content-body">
		<div class="container-fluid">
			<a class="btn btn-light btn-xs" id="back-btn"  
				    href="javascript:history.back();" style="width: 100px;" > 
					<span class="mr-2"><i class="fa fa-reply"></i></span> 
					Back
				</a><br><br>
			<div class="row">
				<div class="col-lg-12">
					<div class="profile">
						<div class="profile-head">
							<div class="photo-content">
								<div style="background-color: black;">
									<table>
										<tr style="height: 100px;">
										<h1 style="color: white; text-align: center; font-size: 60pt; font-family: 'Lobster', 'Gugi';" ><br>
										${ member.nickName }<h1>
										</tr>
									</table>
								</div>
								<div class="profile-photo" >
									<img src="/dabomweb/resources/upload-files/${ producerAttach.savedFileName }"
										class="box" alt="">
								</div>
							</div>
							<div class="profile-info">
								<div class="row justify-content-center">
									<div class="col-xl-8">
										<div class="row">
											<div class="col-xl-4 col-sm-4 border-right-1 prf-col">
												<div class="profile-name">
													<h4 class="text-primary">${ member.userName }</h4>
													<p>${ produceBoard.type }</p>
												</div>
											</div>
											<div class="col-xl-4 col-sm-4 border-right-1 prf-col">
												<div class="profile-email ">
												
													<a id="support-btn" href="javascript:" class="btn btn-outline-danger b"
														style='display: ${ not empty produceSupport and produceSupport.support == 1 ? "none" : "" }'>
														배우 응원하기 🖤<span>&nbsp;<i style="font-size: 5pt; font-style: normal;">${ produceBoard.supportCnt }</i></span>
													</a> 
													
													<a id="support-btn2" href="javascript:" class="btn btn-danger b"
														style='display: ${ not empty produceSupport and produceSupport.support == 1 ? "" : "none" }'>
														응원하는 배우 🤍<span>&nbsp;<i style="font-size: 5pt; font-style: normal;">${ produceBoard.supportCnt }</i></span>
													</a> <br>
													<c:set var="contact" value="${ produceBoard.contact }"/>
													<c:if test="${ empty contact }"> 
													<p class="small">연락처 비공개 </p>
													</c:if>
													<p>${ produceBoard.contact }</p>
												
												</div> 
											</div>
											
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">Click해서 정보를 확인하세요.</h4>
										</div>
										<div class="card-body">
											<div class="basic-list-group">
												<div class="row">
													<div class="col-lg-6 col-xl-2">
														<div class="list-group mb-4 " id="list-tab" role="tablist">
															<a class="list-group-item list-group-item-action active"
																id="list-home-list" data-toggle="list" href="#list-home"
																role="tab">Channel</a> <a
																class="list-group-item list-group-item-action"
																id="list-profile-list" data-toggle="list"
																href="#list-profile" role="tab">Profile</a> <a
																class="list-group-item list-group-item-action"
																id="list-messages-list" data-toggle="list"
																href="#list-messages" role="tab">SNS</a> <a
																class="list-group-item list-group-item-action"
																id="list-settings-list" data-toggle="list"
																href="#list-settings" role="tab">Information</a>
														</div>
													</div>
													<div class="col-lg-6 col-xl-10">
														<div class="tab-content" id="nav-tabContent">
															<div class="tab-pane fade show active" id="list-home">
																<h4 class="mb-4">Channel</h4>
																<a href="/dabomweb/mychannel/channel?member_Id=${ member.memberId }&subscriber=${ loginuser.memberId }">
																<p style="font-size: 45pt; font-family: 'Lobster', 'Gugi';">📺 ${ member.nickName } CHNNEL</p>
																</a>
																
															</div>
															<div class="tab-pane fade" id="list-profile"
																role="tabpanel">
																<h4 class="mb-4">Profile</h4>
																<p>이 름 &nbsp;${ member.userName }</p>
																<p>생 일 &nbsp;${ member.birth }</p>
																<p>이메일 &nbsp;${ member.email } </p>
															</div>
															<div class="tab-pane fade" id="list-messages">
																<h4 class="mb-4">SNS</h4>
																<c:set var="sns" value="${ produceBoard.sns }" />
																<c:if test="${ empty sns }"> 
																	SNS 정보가 없습니다.
																</c:if>
																<p><a href="${ produceBoard.sns }" target="_blank">${ produceBoard.sns }</a></p>
															</div>
															<div class="tab-pane fade" id="list-settings">
																<h4 class="mb-4">Information</h4>
																<p>
																${fn:replace(produceBoard.infor, replaceChar, "<br/>")}
																</p>
															</div>
														</div>
														</div>
													</div>
												</div>
												<div class="card" >
													<div class="b">댓글</div>
								                        <table class="table table-hover bl">
					                                       <tbody id="comment-list">
					                                        </tbody>
					                                    </table>
							                      <div class="card-header">
								                      <h4 class="card-title b">댓글작성</h4>
	 						                     </div>
						                            <div class="card-body">
						                                <div class="basic-form">
						                                    <form id="comment-form" method="post" action="write-comment">
						                                    <input name="writer" value="${ loginuser.memberId }" type="hidden">
						                                    <input name="boardNo" value="${ produceBoard.boardNo }" type="hidden">
						                                        <div class="form-group">
						                                            <textarea name="content"
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
						</div>
					</div>
				</div>
			</div>




	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

	<script type="text/javascript">
	
	$(function() {
		$('#support-btn').on('click', function(event) {
			event.preventDefault();
			
			$.ajax({
				"url" : "support-producer",
				"method" : "post",
				"async" : true,
				"data" : "produceBoardNo=${produceBoard.boardNo}&memberId=${loginuser.memberId}&support=1&isNew=${ empty produceSupport }",
				"dataType" : "json",
				"success" : function(resp, status, xhr) {
					if (resp.result === "success"){
						//alert('응원하기 성공');							
						$('#support-btn').hide();
						$('#support-btn2').show().find("i").text(resp.count);
						
					} else {
						alert('실패');
					}
				},
				"error" : function(xhr, status, err) {
					alert('다시 시도해 주세요.');
				}
			});
		});
		$('#support-btn2').on('click', function(event) {
			event.preventDefault();
			
			$.ajax({
				"url" : "support-producer",
				"method" : "post",
				"async" : true,
				"data" : "produceBoardNo=${produceBoard.boardNo}&memberId=${loginuser.memberId}&support=0&isNew=false",
				"dataType" : "json",
				"success" : function(resp, status, xhr) {
					if (resp.result === "success"){
						//alert('응원 취소 성공');							
						$('#support-btn').show().find("i").text(resp.count);
						$('#support-btn2').hide();						
					} else {
						alert('실패');
					}
				},
				"error" : function(xhr, status, err) {
					alert('다시 시도해 주세요.');
				}
			});
		});
		
		
	
		$('#comment-list').load('comment-list?boardNo=' + ${ produceBoard.boardNo });
		
		$('#comment-btn').click(function(event) {
			event.preventDefault();
			var formData = $('#comment-form').serialize();
			$.ajax({
				"url" : "write-comment",
				"method" : "post",
				"async" : true,
				"data" : formData,
				"dataType" : "text",
				"success" : function(result, status, xhr) {
					if (result === "success") {
						alert('등록성공');
						$('#comment-list').load('comment-list?boardNo=' + ${ produceBoard.boardNo  });
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