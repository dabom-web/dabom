<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Profile</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/dabom.jpg">
<link rel="stylesheet"
	href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css"
	rel="stylesheet">
<link href="/dabomweb/resources/css/style.css" rel="stylesheet">
<style type="text/css">
	.bl {
		color: black;
		font-size: 9pt;
		font-weight: bolder;
	}
	
	.xl {
		font-size: 30pt;
	}
	
	.s {
		font-size: 4pt;
	    color: red;
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
			<div class="row page-titles mx-0">
				<div class="col-sm-6 p-md-0">
					<div class="welcome-text">
						<h4>MYPAGE</h4>
						<span class="ml-1">마이페이지</span>
					</div>
				</div>
				<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<a href="#">PROFILE</a>				
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">MY PROFILE</h4>
						</div>
						<div class="card-body">
							<div class="basic-list-group">
								<div class="row">
									<div class="col-lg-6 col-xl-2">
										<div class="list-group mb-4 " id="list-tab" role="tablist">
											<a class="list-group-item list-group-item-action active"
												id="list-home-list" data-toggle="list"
												href="#list-profile" role="tab">
												Profile
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-edit-profile-list" data-toggle="list"
												href="#list-edit-profile" role="tab">
												Changing Profile
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-channel-list" data-toggle="list"
												href="#list-channel" role="tab">
												Channel
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-edit-usertype-list" data-toggle="list"
												href="#list-edit-usertype" role="tab">
												Change User Type
											</a>  
											<a class="list-group-item list-group-item-action"
												id="list-messages-list" data-toggle="list"
												href="#list-messages" role="tab">
												Messages
											</a> 
											<a class="list-group-item list-group-item-action"
												id="list-payment-list" data-toggle="list"
												href="#list-payment" role="tab">
												Payment Service
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-leave-list" data-toggle="list"
												href="#list-leave" role="tab">
												Delete Account
											</a>
										</div>
									</div>
									<div class="col-xl-10">
										<div class="tab-content" id="nav-tabContent">
											<div class="tab-pane fade show active" id="list-profile">
												<h4 class="mb-4">프 로 필</h4>
												 <table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">아이디</td>
			                                                <td>${ loginuser.memberId }</td>
			                                            </tr>
			                                             <tr>
			                                                <td>이름</td>
			                                                <td>${ loginuser.userName }</td>
			                                            </tr>
			                                             <tr>
			                                                <td>닉네임</td>
			                                                <td>${ loginuser.nickName }</td>
			                                            </tr>
			                                             <tr>
			                                                <td>생일</td>
			                                                <td>${ loginuser.birth }</td>
			                                            </tr>
			                                             <tr>
			                                                <td>이메일</td>
			                                                <td>${ loginuser.email }</td>
			                                            </tr>
			                                             <tr>
			                                                <td>연락처</td>
			                                                <c:choose>
			                                                <c:when test="${ empty loginuser.phone }">
			                                                	정보가 없습니다.
			                                                  </c:when>
			                                                <c:otherwise>
			                                                <td>0${ loginuser.phone }</td>
			                                                 </c:otherwise>
			                                                </c:choose>
			                                            </tr>
			                                             <tr>
			                                                <td>회원타입</td>
			                                                <c:choose>
			                                                <c:when test="${ loginuser.type eq 'AL' }">
			                                                	<td>업로드회원</td>
			                                                </c:when>
			                                                <c:otherwise>
			                                                	<td>${ loginuser.type }</td>
			                                                </c:otherwise>
			                                                </c:choose>
			                                            </tr>
			                                        </tbody>
			                                    </table>
											</div>
										<div class="tab-pane fade" id="list-edit-profile">
											<h4 class="mb-4">프로필 수정하기</h4>
											<form id="update-form" method="post"
												  action="updateMemberInfor">
											<table class="table table bl">
		                                        <tbody>
		                                            <tr>
		                                                <td width="15%;">아이디<input type="hidden" value="${ loginuser.memberId }" name="memberId"></td>
		                                                <td width="50%;">${ loginuser.memberId }</td>
		                                                <td class="s" >* Id는 변경할 수 없습니다.</td>
		                                            </tr>
		                                             <tr>
		                                                <td>이름</td>
		                                                <td><input type="text" name="userName" class="bl form-control input-default " 
		                                                value="${ loginuser.userName }"></td>
		                                                <td></td>
		                                            </tr>
		                                             <tr>
		                                                <td>닉네임</td>
		                                                <td><input type="text" name="nickName" class="bl form-control input-default " 
		                                                value="${ loginuser.nickName }"></td>
		                                                <td></td>
		                                            </tr>
		                                             <tr>
		                                                <td>생일</td>
		                                                <td><input type="text" name="birth" class="bl form-control input-default " 
		                                                value="${ loginuser.birth }"></td>
		                                                <td></td>
		                                            </tr>
		                                             <tr>
		                                                <td>이메일</td>
		                                               <td><input type="text" name="email" class="bl form-control input-default " 
		                                                value="${ loginuser.email }"></td>
		                                                <td></td>
		                                            </tr>
		                                             <tr>
		                                                <td>연락처</td>
		                                                <td><input type="text" name="phone" class="bl form-control input-default " 
		                                                value="0${ loginuser.phone }"></td>
		                                                <td></td>
		                                            </tr>
		                                             <tr>
		                                                <td>회원타입</td>
		                                                <td>
		                                                <div class="bl form-group" value="${ loginuser.type }">
				                                            <select class="bl form-control" name="type">
				                                                <option value="일반회원">일반회원</option>
				                                                <option value="영상업로더">영상업로더</option>
				                                                <option value="웹툰업로더">웹툰업로더</option>
				                                            </select>
				                                        </div>
				                                        </td>
		                                                 <td></td>
		                                            </tr>
		                                        </tbody>
		                                    </table>
		                                    </form>
		                                    <div class="text-right" style="text-align: center;">
												<a class="btn btn-outline-dark btn-xs"
												   id="send-btn" href="javascript:" >
													<span class="mr-2"><i class="fa fa-paper-plane"></i></span>
													Send
												</a>
												<a class="btn btn-outline-dark btn-xs" id="cancel-btn" href="javascript:">
													<span class="mr-2"><i class="fa fa-times" aria-hidden="true"></i></span>
													Cancel
												</a>
											</div> 
		                                    
										</div>
										<div class="tab-pane fade show" id="list-channel">
											<h4 class="mb-4">채널</h4>
											<table class="table table-hover bl">
		                                        <tbody>
		                                            <tr>
		                                                <td width="15%;">📺</td>
		                                                <td>${ loginuser.userName }회원님의 채널정보</td>
		                                            </tr>
		                                             <tr>
		                                                <td>채널명</td>
		                                                <td>채널명 받아오기</td>
		                                            </tr>
		                                             <tr>
		                                                <td>채널개설일</td>
		                                                <td>개설일자 받아오기</td>
		                                            </tr>
		                                             <tr>
		                                                <td>구독자수</td>
		                                                <td>구독자 카운트 받아오기</td>
		                                            </tr>
		                                        </tbody>
		                                    </table>
		                                      <div style="text-align: right;">
		                                    	<a class="btn btn-light btn-xs bl"  
												    href="/dabomweb/mychannel/mychannel_main?member_Id=${loginuser.memberId}" > 
													채널수정
												</a>
		                                    	<a class="btn btn-light btn-xs bl" id="delete-channel"  
												    href="#" > 
													채널삭제
												</a>
												</div>
												
												<!-- 채널 없을때 보여줄 화면 -->
												<h4 class="mb-4 bl">${ loginuser.userName }회원님!! 채널이 없습니다.</h4>
		                                      <div>
		                                    	<a class="btn btn-light btn-xs bl"  
												    href="/dabomweb/mychannel/mychannel_main?member_Id=${loginuser.memberId}" > 
													채널생성 📺
												</a>
											  </div>
										</div>
										<div class="tab-pane fade" id="list-edit-usertype">
											<h4 class="mb-4">회원 타입 변경하기</h4>
											<div class="card">
						                            <div class="card-header d-block">
						                                <h4 class="card-title">${ loginuser.nickName }</h4>
						                                <p class="m-0 subtitle bl">회원님의 현재 타입은 ${ loginuser.type }입니다.</p>
						                            </div>
						                            <div class="card-body">
						                            	<form id="change-type-form" >	
						                            	<input type="hidden" name="memberId" value="${ loginuser.memberId }" />		                             
						                                <div class="bl form-group" value="${ loginuser.type }">
				                                            <select class="bl form-control" name="type">
				                                                <option value="일반회원">일반회원</option>
				                                                <option value="영상업로더">영상업로더</option>
				                                                <option value="웹툰업로더">웹툰업로더</option>
				                                            </select>
				                                        </div>
				                                        </form>	
					                                        <div style="text-align: right;">
					                                        <a class="btn btn-light btn-xs bl" id="change-type-btn"  
															    href="javascript:"> 
																회원타입변경
															</a>
														   </div>
						                            </div>
						                        </div>
										</div>
										<div class="tab-pane fade" id="list-messages">
											<h4 class="mb-4">메세지</h4>
						                        <div class="card text-white bg-dark">
						                            <div class="card-header">
						                                <h5 class="card-title text-white">메세지쓰기 💌</h5>
						                            </div>
						                            <div class="card-body mb-0">
						                                <p class="card-text">관리자에게 문의하시려면 "👻" 버튼을 클릭하시고,</p>
						                                <p class="card-text">다른 회원에게 메세지를 전송하려면 "🍨"버튼을 클릭하세요.</p>
						                                <a href="/dabomweb/contact-message/sendContactUser" 
						                                class="btn btn-light btn-card text-dark xl">
						                                👻
						                                </a>
						                                 <a href="/dabomweb/message/message_write" 
						                                class="btn btn-light btn-card text-dark xl">
						                                🍨
						                                </a>
						                            </div>
						                            <div class="card-footer bg-transparent border-0 text-white small">
						                            읽지않은 new 메세지가 ${ count } 개 있습니다. 💬 
						                            </div>
						                        </div>
											</div>
										<div class="tab-pane fade" id="list-payment">
											<h4 class="mb-4">결제 정보 확인하기</h4>	
											<a class="bl btn-xs" >💰 ${ loginuser.userName }님 결제 정보입니다. 💰</a>											
													 <div class="profile-statistics">
						                                    <div class="text-center mt-4 border-bottom-1 pb-3">
						                                    <br><br>
						                                        <div class="row">
						                                            <div class="col">
						                                                <h3 class="m-b-0">
						                                                <fmt:formatNumber value="${ totalPrice }" pattern="#,###" />
						                                               won</h3><span>구매 금액</span>
						                                            </div>
						                                            <div class="col">
						                                                <h3 class="m-b-0">
						                                                <fmt:formatNumber value="${ totalAmount }" pattern="#,###" />
						                                                P</h3><span>보유 포인트</span>
						                                            </div>
						                                            <div class="col">
						                                                <h3 class="m-b-0">
						                                               <fmt:formatNumber value="${ totalUsePoint }" pattern="#,###" />
						                                                P</h3><span>사용 포인트</span>
						                                            </div>
						                                        </div><br><br>
						                                        <div class="mt-4">
						                                        <a href="/dabomweb/payment/purchase-point" class="btn btn-outline-dark pl-5 pr-5 mr-3 mb-4 bl">충전하기</a> 
						                                        <a href="/dabomweb/contact-message/sendContactUser" class="btn btn-outline-dark pl-5 pr-5 mb-4 bl">문의하기</a>
						                                        </div>
						                                          <div class="card-header d-block">
									                              </div>
										                            <div class="card-body">
									                                	<div id="accordion-six" class="accordion accordion-with-icon">
									                                        <div class="accordion__item">
										                                        <div class="accordion__header" data-toggle="collapse" data-target="#with-icon_collapseOne">
										                                            <span class="accordion__header--text bl small">구매이력 펼쳐 보기</span>
										                                            <span class="accordion__header--indicator indicator_bordered"></span>
										                                        </div>
										                                         <c:forEach var="point" items="${ pointList }">
										                                        <div id="with-icon_collapseOne" class="collapse accordion__body" data-parent="#accordion-six" style="text-align: center;">
											                                             <c:choose>
											                                             <c:when test="${ !empty point.price && !empty point.amount && !empty point.purchaseDate }">
											                                               <div class="accordion__body--text bl">
											                                               	💳 구매 내역 [ 구매일 | <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ point.purchaseDate }"/>
											                                               	| 구매 금액 | <fmt:formatNumber value="${ point.price }" pattern="#,###" />
											                                               	| 구매포인트 | <fmt:formatNumber value="${ point.amount }" pattern="#,###" />
											                                               	| 누적포인트 | <fmt:formatNumber value="${ point.totalPoint }" pattern="#,###" /> ] <a>결제완료</a>
										                                            		</div>
											                                             </c:when>
											                                             <c:otherwise>
											                                             	<c:if test="${ empty point.amount || empty point.usePoint || empty point.amount }">
											                                             	</c:if>
									                                            	 		<div class="accordion__body--text bl" id="use-point-value">
											                                            	💸 사용 내역 [ 사용일 | <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ point.useDate }"/>
											                                               	| 사용포인트 | <fmt:formatNumber value="${ point.usePoint }" pattern="#,###" />
											                                               	| 누적포인트 | <fmt:formatNumber value="${ point.totalPoint }" pattern="#,###" /> ]
										                                               		</div>
											                                             </c:otherwise>
											                                             </c:choose>
											                                             
											                                             	
											                                             
											                                             
											                                            
										                                            	 	
										                                           
									                     
										                                         <%--    <c:choose>
										                                            <c:when test="${ !empty point.purchaseDate && empty point.cancelDate }">
									                                            		<div class="accordion__body--text bl">
										                                               	💳 구매 내역 [ 구매일 | <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ point.purchaseDate }"/>
										                                               	| 구매 금액 | <fmt:formatNumber value="${ point.price }" pattern="#,###" />
										                                               	| 구매포인트 | <fmt:formatNumber value="${ point.amount }" pattern="#,###" />
										                                               	| 누적포인트 | <fmt:formatNumber value="${ point.totalPoint }" pattern="#,###" /> ] <a>결제완료</a>
										                                            	</div>
										                                            </c:when>
										                                            <c:otherwise>
										                                            	<c:when test="${ !empty point.cancelDate }">
										                                            	✔️ 취소 내역 [ 취소일 | <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ point.cancelDate }"/>
										                                               	| 취소 금액 | <fmt:formatNumber value="${ point.price }" pattern="#,###" />
										                                               	| 취소포인트 | <fmt:formatNumber value="${ point.amount }" pattern="#,###" />
										                                               	| 누적포인트 | <fmt:formatNumber value="${ point.totalPoint }" pattern="#,###" /> ]
										                                            	</c:when>
										                                            	<c:otherwise>
										                                            	💸 사용 내역 [ 사용일 | <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ point.useDate }"/>
										                                               	| 사용포인트 | <fmt:formatNumber value="${ point.point }" pattern="#,###" />
										                                               	| 누적포인트 | <fmt:formatNumber value="${ point.totalPoint }" pattern="#,###" /> ]
										                                            	</c:otherwise>
										                                            </c:otherwise>
										                                            </c:choose>			 --%>					                                            								                                            
										                                        </div>
										                                        </c:forEach>
					                                    					</div>
									                                    </div>
									                                </div>
																</div>
															</div>
														</div>
												
											<div class="tab-pane fade" id="list-leave">
													<h4 class="mb-4">회원 탈퇴</h4>
													<p class="bl">지금 까지 작성한 내용은 삭제되지 않습니다. 탈퇴한 회원은 영구 탈퇴처리 됩니다.</p>
														<a class="btn btn-light btn-xs bl" id="disabled-btn"  
														    href="javascript:" > 
															계정비활성화
														</a>
														<a class="btn btn-light btn-xs bl" id="leved-btn"  
														    href="javascript:" > 
															계정탈퇴
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

		<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
		<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
		<script type="text/javascript">
	
			$(function () {
								
				$('#send-btn').on('click', function (event) {
						event.preventDefault();
						var ok = confirm("회원 정보를 수정합니다.");
						if (ok) {
							$('#update-form').submit();			
						} else {
							location.href = "/dabomweb/mypage/profile?memberId=${ loginuser.memberId }";
						}			
					});
				
				
					$('#cancel-btn').click(function (event) {
						event.preventDefault();
						var ok = confirm("정말 취소하시겠습니까?");
						if (ok) {
							location.href = "/dabomweb/mypage/profile?memberId=${ loginuser.memberId }";	
						}
					});
					
					$('#change-type-btn').click(function(event) {
						event.preventDefault();
						var formData = $('#change-type-form').serialize();
						$.ajax({
							"url" : "change-type",
							"method" : "post",
							"async" : true,
							"data" : formData,
							"dataType" : "text",
							"success" : function(result, status, xhr) {
								if (result === "success") {
									alert('변경되었습니다..');
								} else {
									alert('변경 실패');
								}
							},
							"error" : function(xhr, status, err) {
								alert('변경 실패하였습니다.');
							}
						});
					});
					
					$('#leved-btn').click(function (event) {
						event.preventDefault();
						var ok = confirm("계정을 삭제하시겠습니까? 한번 탈퇴하면 영구 삭제 됩니다.");
						if (ok) {
							$.ajax({
								"url" : "delete-account",
								"method" : "post",
								"async" : true,
								"data" : "memberId=${loginuser.memberId}",
								"dataType" : "json",
								"success" : function(result, status, xhr) {
									if(result === "success"){
										alert('계정 삭제 성공');
										location.href = "/dabomweb/account/logout";	
									}
								},
								"error" : function(xhr, status, err) {
									alert('계정 삭제 실패');
								}
							});
						}
					});
					
					$('#disabled-btn').click(function (event) {
						event.preventDefault();
						var ok = confirm("계정을 비활성화합니다.");
						if (ok) {
							$.ajax({
								"url" : "disabled-account",
								"method" : "post",
								"async" : true,
								"data" : "memberId=${loginuser.memberId}",
								"dataType" : "json",
								"success" : function(result, status, xhr) {
									if(result === "success") {
										alert('비활성화 성공');
										location.href = "/dabomweb/account/logout";	
									}
								},
								"error" :function(xhr, status, err) {
									alert('비활성화 실패하였습니다.');
								}
							});
						}
					});
				
					
				});	

	</script>
</body>
</html>