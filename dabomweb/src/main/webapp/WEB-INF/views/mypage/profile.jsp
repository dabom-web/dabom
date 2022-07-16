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
	

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
	<div class="content-body">
		<div class="container-fluid">
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
                                                	업로드회원
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
												<p class="bl">프로필수정하기</p>
											</div>
											<div class="tab-pane fade show" id="list-channel">
												<h4 class="mb-4">채널</h4>
												<p class="bl">채널 보여주기 없으면 없습니다.</p>
											</div>
											<div class="tab-pane fade" id="list-edit-usertype">
												<h4 class="mb-4">회원 타입 변경하기</h4>
												<p class="bl">회원타입변경하기 드롭다운가져오자</p>
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
				                                        <c:forEach var="pointPurchase" items="${ pointPurchaseList }">
				                                            <div class="col">
				                                                <h3 class="m-b-0">
				                                                <fmt:formatNumber value="${ pointPurchase.price }" pattern="#,###" />
				                                               won</h3><span>구매 금액</span>
				                                            </div>
				                                            <div class="col">
				                                                <h3 class="m-b-0">
				                                                <fmt:formatNumber value="${ pointPurchase.amount }" pattern="#,###" />
				                                                P</h3><span>보유 포인트</span>
				                                            </div>
				                                            <div class="col">
				                                                <h3 class="m-b-0">
				                                               <fmt:formatNumber value="${ pointPurchase.amount }" pattern="#,###" />
				                                                P</h3><span>사용 포인트</span>
				                                            </div>
				                                         </c:forEach>
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
								                                        <div id="with-icon_collapseOne" class="collapse accordion__body" data-parent="#accordion-six">
								                                            <div class="accordion__body--text bl">
								                                               구매내역 구매일 구매금액 포인트 누적포인트
								                                            </div>
								                                             <div class="accordion__body--text bl">
								                                               사용내역 사용일 포인트 누적포인트
								                                            </div>
								                                             <div class="accordion__body--text bl">
								                                               취소내역 취소일 취소금액 누적포인트
								                                            </div>
								                                        </div>
			                                    					</div>
							                                    </div>
							                                </div>
													</div>
												</div>
											</div>
												<div class="tab-pane fade" id="list-leave">
														<h4 class="mb-4">회원 탈퇴</h4>
														<p class="bl">지금 까지 작성한 내용은 삭제되지 않습니다. 탈퇴한 회원은 영구 탈퇴처리 됩니다.</p>
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
</body>
</html>