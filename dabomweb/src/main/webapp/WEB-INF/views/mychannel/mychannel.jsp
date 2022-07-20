<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>내채널</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

<style type="text/css">

	.photo-content {
  position: relative; }
  .photo-content .cover-photo {
    background: url();
    background-size: cover;
    background-position: center;
    min-height: 100%;
    width: 100%; 
    object-fit: contain;
    }
  .photo-content .profile-photo {
   	bottom: -75px;
    left: 100px;
    max-width: 150px;
    position: absolute; }
    
   .container {
	 width: 100%;
	 height: 100%;
	 overflow: hidden;
}
	
</style>

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

	<!--********************************** Content body start ***********************************-->

	<div class="content-body">
		<div class="container-fluid">

			<!-- row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="profile">
						<div class="profile-head">
							<div class="photo-content">
								<div class="cover-photo">
									<c:choose>
										<c:when test="${ empty myChannelBanner.savedFileName }">
											<img src="/dabomweb/resources/images/avatar/기본배너2.png"
												style="min-height: 100px; width: 100%;">
										</c:when>
										<c:otherwise>
											<img
												src="/dabomweb/resources/upload-files/${ myChannelBanner.savedFileName }"
												style="max-height: 400px; width: 100%;">

										</c:otherwise>
									</c:choose>
								</div>
								<div class="profile-photo">
									<c:choose>
										<c:when test="${ empty myChannelProfile.savedFileName }">
											<img src="/dabomweb/resources/images/avatar/기본.jpg"
												class="img-fluid rounded-circle" alt="">
										</c:when>
										<c:otherwise>
											<img
												src="/dabomweb/resources/upload-files/${ myChannelProfile.savedFileName }"
												id="box" class="img-fluid rounded-circle" alt="">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="profile-info">
								<div class="row justify-content-center">
									<div class="col-xl-12">
										<div class="row">
											<div class="col-2"></div>
											<div class="col-8 border-right-1 prf-col">
												<c:choose>
													<c:when test="${ !empty myChannel.channel_Name }">
														<div class="profile-name"
															style="width: 500px; float: left; heigh: 100%">
															<h3 class="text-primary">&nbsp;${ myChannel.channel_Name }</h3>
															<p>구독자 : ${ myChannel.subscribe }명</p>
														</div>
													</c:when>
													<c:otherwise>
														<div class="profile-name"
															style="width: 500px; float: left; heigh: 100%">
															<a
																href="mychannel_create?member_id=${ loginuser.memberId }">
																<h3 class="text-primary">여기를 클릭해서 채널을 등록해주세요</h3>
															</a>
															<p>구독자가 없습니다</p>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="card">
								<div class="card-body">
									<div class="profile-statistics">
										<div class="text-center mt-4 border-bottom-1 pb-3">
											<div class="row">
												<div class="col">
													<h3 class="m-b-0">${subCount}</h3>
													<span>구독한채널</span>
												</div>
												<div class="col">
													<c:choose>
														<c:when test="${ empty myChannel.channel_Name }">
															<h3 class="m-b-0">0</h3>
														</c:when>
														<c:otherwise>
															<h3 class="m-b-0">${ myChannel.subscribe }</h3>
														</c:otherwise>
													</c:choose>
													<span>구독자</span>
												</div>

												<div class="col">
													<c:choose>
														<c:when test="${ empty upload  }">
															<h3 class="m-b-0">0</h3>
														</c:when>
														<c:otherwise>
															<h3 class="m-b-0">${ upload }</h3>
														</c:otherwise>
													</c:choose>
													<span>영상</span>
												</div>
											</div>
											<div class="mt-4">
												<a href="javascript:void()"
													class="btn btn-primary pl-5 pr-5 mr-3 mb-4"
													id="send-messege">메세지</a> <a
													href="/dabomweb/video/mylist?memberId=${ myChannel.member_Id }"
													class="btn btn-primary pl-5 pr-5 mr-3 mb-4">동영상</a> <a
													href="/dabomweb/video/uploadList"
													class="btn btn-secondary pl-5 pr-5 mb-4"> 동영상 업로드</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card">
								<div class="card-body">
									<div class="profile-tab">
										<div class="custom-tab-1">
											<ul class="nav nav-tabs">
												<li class="nav-item"><a href="#my-posts"
													data-toggle="tab" class="nav-link active show">커뮤니티</a></li>
												<li class="nav-item"><a href="#about-me"
													data-toggle="tab" class="nav-link">채널정보</a></li>
												<li class="nav-item"><a href="#subscribe"
													data-toggle="tab" class="nav-link">구독중인 채널</a></li>
												<li class="nav-item"><a href="#profile-settings"
													data-toggle="tab" class="nav-link">채널정보 수정</a></li>
											</ul>
											<div class="tab-content">
												<div id="my-posts" class="tab-pane fade active show">
													<div class="my-post-content pt-3">
														<div class="profile-uoloaded-post border-bottom-1 pb-2">
															<div class="row col-12">
																<p>🔔지금 바로 채널의 정보를 확인하세요🔔
																<p>
																<div class="btn-group float-right">
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	<button class="btn btn-dark" type="button">
																		<i class="fa fa-angle-left"></i>
																	</button>
																	<button class="btn btn-dark " type="button">
																		<i class="fa fa-angle-right"></i>
																	</button>
																</div>
																<table id="community-list"
																	style="width: 100%; margin: 0 auto">
																</table>
															</div>
														</div>

														<div class="post-input">
															<form id="community-form" method="post"
																action="community-write">
																<input type="hidden" name="member_Id"
																	value="${ loginuser.memberId }">
																<textarea name="content" id="content" cols="30" rows="5"
																	class="form-control bg-transparent"
																	placeholder="소식을 입력해주세요...."></textarea>
															</form>
															<a id="uploadBtn" href="javascript:void()"
																class="btn btn-primary">등록</a>
														</div>
													</div>
												</div>
												<div id="about-me" class="tab-pane fade">
													<div class="profile-about-me">
														<div class="pt-4 border-bottom-1 pb-4">
															<c:choose>
																<c:when test="${ empty myChannel.channel_Info }">
																	<p>정보를 등록해주세요</p>
																</c:when>
																<c:otherwise>
																	<div id="info-list" style="text-align: center">
																		<h6>
																			<% String enter2 = "\r\n"; %>
																			<c:set var="enter" value="
" />
																			${ fn:replace(myChannel.channel_Info, enter, '<br>') }
																		</h6>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</div>
												<div id="subscribe" class="tab-pane fade">
													<div class="profile-about-me">
														<div class="pt-4 border-bottom-1 pb-4">
															<c:choose>
																<c:when test="${ empty channelSubscribeList }">
																	<p style="text-align: center;">구독 내역이 없습니다.</p>
																</c:when>
																<c:otherwise>
																	<c:forEach var="channelSubscribeList"
																		items="${ channelSubscribeList }">
																		<a
																			href="channel?member_Id=${ channelSubscribeList.member_Id }&subscriber=${loginuser.memberId}">
																			<h5 style="text-align: center">
																				${ channelSubscribeList.member_Id }의 채널로 이동
																				</h>
																		</a>
																		<hr>
																	</c:forEach>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</div>
												<div id="profile-settings" class="tab-pane fade">
													<div class="pt-3">
														<div class="mt-4">
														<div class="row justify-content-center">
															<a href="mychannel_create_banner?member_Id=${ loginuser.memberId }"
																class="btn btn-primary pl-5 pr-5 mr-3 mb-4"
																id="send-messege">배너등록하기</a> <a
																href="mychannel_update?member_Id=${ loginuser.memberId }"
																class="btn btn-primary pl-5 pr-5 mr-3 mb-4">
																정보수정하기</a> 
														</div>	
															<hr><br>	
																<h4 style="text-align: center;">채널삭제시 이전에 구독내용도 함께 사라집니다. 삭제하시겠습니까?<br></h4><br>		
																	<div class="row justify-content-center">														
																<a href="/dabomweb/video/uploadList"
																	class="btn btn-danger pl-5 pr-5 mb-4"
																	id="delelte-btn" href="javascript:"> 
																	채널삭제하기</a>
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
		</div>
	</div>




	<!--********************************** Content body end ***********************************-->





			<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
			
			<script type="text/javascript">	
			
			$(function() {
				var sendMessege = document.querySelector('#send-messege');
				sendMessege.addEventListener('click', function (event) {
				event.preventDefault();									
					location.href = 'message_direct?member_Id=${myChannel.member_Id}';				
				});			
			
				
				var deleteBtn = document.querySelector('#delelte-btn');
				deleteBtn.addEventListener('click', function (event) {
				event.preventDefault();		
				var ok = confirm('채널을 삭제하시겠습니까?');				
				if (ok) {					
					location.href = 'delete?member_Id=${ loginuser.memberId }';				
				}			
			});
			
		//////////////////////////////////////////////////////////
				///////////////////

					// comment 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
					$('#community-list').load(
							'community-list?member_Id=${ loginuser.memberId }');

					$('#uploadBtn')
							.click(
									function(event) {
										event.preventDefault();
										var formData = $('#community-form')
												.serialize();
										$
												.ajax({
													"url" : "community-write",
													"method" : "post",
													"async" : true,
													"data" : formData,
													"dataType" : "text",
													"success" : function(
															result, status, xhr) {
														if (result === "success") {
															alert('등록성공');
															$('#community-list')
																	.load(
																			'community-list?member_Id=${ loginuser.memberId }');
															location.href = "/dabomweb/mychannel/mychannel?member_Id=${ loginuser.memberId }";
															return;
														} else {
															alert('입력 실패');
														}
													},
													"error" : function(xhr,
															status, err) {
														alert('등록 실패하였습니다.');
													}
												});
									});

				});

				//       $('#comment-cancel-btn').on('click', function(event) {
				//          event.preventDefault();
				//          var ok = confirm('입력을 취소합니다');
				//          if( ok ) {
				//             location.href = "/dabomweb/produceBoard/actorDetail?boardno=${produceBoard.boardNo}";
				//             return;
				//          }
				//       });
			</script>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
</body>
</html>