<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

	<div class="content-body">
		<div class="container-fluid">

			<div class="row">
				<div class="col-lg-12">
					<div class="profile">
						<div class="profile-head">
							<div class="photo-content">
								<div style="background-color: black;"><table><tr style=" height: 100px;">
								<h1 style="color: white; text-align: center;" ><br><br><br>
								${ member.nickName }<h1></tr></table></div>
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
												<div class="profile-email">
													<button type="button" class="btn btn-dark">응원하기 <span
					                                        class="btn-icon-right"><i class="fa fa-heart"></i></span>
					                                </button><br>													
													<c:set var="contact" value="${ produceBoard.contact }"/>
													<p><c:if test="${ empty contact }"> 
														연락처 비공개
													</c:if><p>
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
																<p>운영하는 채널</p>
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
																<p>${ produceBoard.sns }</p>
															</div>
															<div class="tab-pane fade" id="list-settings">
																<h4 class="mb-4">Information</h4>
																<p>${ produceBoard.infor }</p>
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




	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>