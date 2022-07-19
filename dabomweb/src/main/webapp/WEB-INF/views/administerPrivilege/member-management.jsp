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
<title>회원관리</title>
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
	
	body {
		font-weight: bold;
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
						<h4>Member Management</h4>
						<span class="ml-1"></span>
					</div>
				</div>
				<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<a href="#">DA:BOM Member Management</a>				
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Memeber Manaement</h4>
						</div>
						<div class="card-body">
							<div class="basic-list-group">
								<div class="row">
									<div class="col-lg-6 col-xl-2">
										<div class="list-group mb-4 " id="list-tab" role="tablist">
											<a class="list-group-item list-group-item-action active"
												id="list-home-list" data-toggle="list"
												href="#list-profile" role="tab">
												회원조회목록
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-edit-profile-list" data-toggle="list"
												href="#list-edit-profile" role="tab">
												차단회원목록
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-channel-list" data-toggle="list"
												href="#list-channel" role="tab">
												비활성화회원목록
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-edit-usertype-list" data-toggle="list"
												href="#list-edit-usertype" role="tab">
												탈퇴회원목록
											</a>  
											<a class="list-group-item list-group-item-action"
												id="list-messages-list" data-toggle="list"
												href="#list-messages" role="tab">
												수익활동회원
											</a> 
											<a class="list-group-item list-group-item-action"
												id="list-payment-list" data-toggle="list"
												href="#list-payment" role="tab">
												회원타입별목록
											</a>
										</div>
									</div>						
									<div class="col-xl-10">
										<div class="tab-content" id="nav-tabContent">
											<div class="tab-pane fade show active" id="list-profile">
												<h4 class="mb-4 bl">회원조회목록</h4>
												 <table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">계정 ID</td>
			                                                <td>이 름</td>
			                                                <td>생년월일</td>
			                                                <td>닉네임</td>
			                                                <td>연락처</td>
			                                                <td>회원타입</td>
			                                                <td>보유포인트</td>
			                                            </tr>
			                                             
			                                             <c:forEach var="member" items="${ memberList }">
			                                             <tr>
			                                                <td width="15%;">${ member.memberId }</td>
			                                                <td>${ member.userName }</td>
			                                                <td>${ member.birth }</td>
			                                                <td>${ member.nickName }</td>
			                                                <td>0${ member.phone }</td>
			                                                <td>${ member.type }</td>
			                                                <td><fmt:formatNumber value="${ member.point }" pattern="#,###" /></td>
			                                            </tr>
			                                            </c:forEach>
			                                        </tbody>
			                                    </table>
											</div>
										
											<div class="tab-pane fade" id="list-edit-profile">
												<h4 class="mb-4 bl">차단회원목록</h4>
													<table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">계정 ID</td>
			                                                <td>이 름</td>
			                                                <td>생년월일</td>
			                                                <td>닉네임</td>
			                                                <td>연락처</td>
			                                                <td>회원타입</td>
			                                                <td>보유포인트</td>
			                                            </tr>
			                                             <c:forEach var="member" items="${ memberList }">
			                                             <c:if test="${ member.block eq true }">
			                                             <tr>
			                                                <td width="15%;">${ member.memberId }</td>
			                                                <td>${ member.userName }</td>
			                                                <td>${ member.birth }</td>
			                                                <td>${ member.nickName }</td>
			                                                <td>0${ member.phone }</td>
			                                                <td>${ member.type }</td>
			                                                <td><fmt:formatNumber value="${ member.point }" pattern="#,###" /></td>
			                                            </tr>
			                                            </c:if>
			                                            </c:forEach>
			                                        </tbody>
			                                   	 </table>
							              		  </div>
										
											
											<div class="tab-pane fade show" id="list-channel">
												<h4 class="mb-4 bl">비활성화회원목록</h4>
												<table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">계정 ID</td>
			                                                <td>이 름</td>
			                                                <td>생년월일</td>
			                                                <td>닉네임</td>
			                                                <td>연락처</td>
			                                                <td>회원타입</td>
			                                                <td>보유포인트</td>
			                                            </tr>
			                                             <c:forEach var="member" items="${ memberList }">
			                                             <c:if test="${ member.active eq false }">
			                                             <tr>
			                                                <td width="15%;">${ member.memberId }</td>
			                                                <td>${ member.userName }</td>
			                                                <td>${ member.birth }</td>
			                                                <td>${ member.nickName }</td>
			                                                <td>0${ member.phone }</td>
			                                                <td>${ member.type }</td>
			                                                <td><fmt:formatNumber value="${ member.point }" pattern="#,###" /></td>
			                                            </tr>
			                                            </c:if>
			                                            </c:forEach>
			                                        </tbody>
			                                   	 </table>
											</div>
											
											<div class="tab-pane fade" id="list-edit-usertype">
												<h4 class="mb-4 bl">탈퇴회원목록</h4>
													<table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">계정 ID</td>
			                                                <td>이 름</td>
			                                                <td>생년월일</td>
			                                                <td>닉네임</td>
			                                                <td>연락처</td>
			                                                <td>회원타입</td>
			                                                <td>보유포인트</td>
			                                            </tr>
			                                             <c:forEach var="member" items="${ memberList }">
			                                             <c:if test="${ member.leved eq true }">
			                                             <tr>
			                                                <td width="15%;">${ member.memberId }</td>
			                                                <td>${ member.userName }</td>
			                                                <td>${ member.birth }</td>
			                                                <td>${ member.nickName }</td>
			                                                <td>0${ member.phone }</td>
			                                                <td>${ member.type }</td>
			                                                <td><fmt:formatNumber value="${ member.point }" pattern="#,###" /></td>
			                                            </tr>
			                                            </c:if>
			                                            </c:forEach>
			                                        </tbody>
			                                   	 </table>
											</div>
											
											<div class="tab-pane fade" id="list-messages">
												<h4 class="mb-4 bl">수익활동회원</h4>
													<table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">NO</td>
			                                                <td>계정 ID</td>
			                                                <td>개 설 일</td>
			                                                <td>수익활동</td>
			                                                <td>당월수익금</td>
			                                                <td>미정산금액</td>
			                                            </tr>
			                                             <tr>
			                                                <td width="15%;">NO</td>
			                                                <td>계정 ID</td>
			                                                <td>개 설 일</td>
			                                                <td>수익활동</td>
			                                                <td>당월수익금</td>
			                                                <td>미정산금액</td>
			                                            </tr>
			                                        </tbody>
			                                    </table>
												
											</div>
											
											<div class="tab-pane fade" id="list-payment">
												<h4 class="mb-4 bl">회원타입별목록</h4>
												<h4 class="mb-4 bl">💛 일반회원</h4>
													<table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">계정 ID</td>
			                                                <td>이 름</td>
			                                                <td>생년월일</td>
			                                                <td>닉네임</td>
			                                                <td>연락처</td>
			                                                <td>회원타입</td>
			                                                <td>보유포인트</td>
			                                            </tr>
			                                             <c:forEach var="member" items="${ memberList }">
			                                             <c:if test="${ member.type eq '일반회원' }">
			                                             <tr>
			                                                <td width="15%;">${ member.memberId }</td>
			                                                <td>${ member.userName }</td>
			                                                <td>${ member.birth }</td>
			                                                <td>${ member.nickName }</td>
			                                                <td>0${ member.phone }</td>
			                                                <td>${ member.type }</td>
			                                                <td><fmt:formatNumber value="${ member.point }" pattern="#,###" /></td>
			                                            </tr>
			                                            </c:if>
			                                            </c:forEach>
			                                        </tbody>
			                                   	 </table>
			                                   	 <h4 class="mb-4 bl">🧡 웹툰업로더</h4>
			                                   	 <table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">계정 ID</td>
			                                                <td>이 름</td>
			                                                <td>생년월일</td>
			                                                <td>닉네임</td>
			                                                <td>연락처</td>
			                                                <td>회원타입</td>
			                                                <td>보유포인트</td>
			                                            </tr>
			                                             <c:forEach var="member" items="${ memberList }">
			                                             <c:if test="${ member.type eq '웹툰업로더' }">
			                                             <tr>
			                                                <td width="15%;">${ member.memberId }</td>
			                                                <td>${ member.userName }</td>
			                                                <td>${ member.birth }</td>
			                                                <td>${ member.nickName }</td>
			                                                <td>0${ member.phone }</td>
			                                                <td>${ member.type }</td>
			                                                <td><fmt:formatNumber value="${ member.point }" pattern="#,###" /></td>
			                                            </tr>
			                                            </c:if>
			                                            </c:forEach>
			                                        </tbody>
			                                   	 </table>
			                                   	 <h4 class="mb-4 bl">❤️ 영상업로더</h4>
			                                   	 <table class="table table-hover bl">
			                                        <tbody>
			                                            <tr>
			                                                <td width="15%;">계정 ID</td>
			                                                <td>이 름</td>
			                                                <td>생년월일</td>
			                                                <td>닉네임</td>
			                                                <td>연락처</td>
			                                                <td>회원타입</td>
			                                                <td>보유포인트</td>
			                                            </tr>
			                                             <c:forEach var="member" items="${ memberList }">
			                                             <c:if test="${ member.type eq '영상업로더' }">
			                                             <tr>
			                                                <td width="15%;">${ member.memberId }</td>
			                                                <td>${ member.userName }</td>
			                                                <td>${ member.birth }</td>
			                                                <td>${ member.nickName }</td>
			                                                <td>0${ member.phone }</td>
			                                                <td>${ member.type }</td>
			                                                <td><fmt:formatNumber value="${ member.point }" pattern="#,###" /></td>
			                                            </tr>
			                                            </c:if>
			                                            </c:forEach>
			                                        </tbody>
			                                   	 </table>
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
	</script>
</body>
</html>