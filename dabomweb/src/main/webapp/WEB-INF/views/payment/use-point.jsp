<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>포인트사용테스트</title>
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
										포인트 사용 테스트 화면<h1>
										</tr>
									</table>
								</div>
								<div class="profile-photo" >
									<img src="/dabomweb/resources/images/dabom.jpg"
										class="box" alt="">
								</div>
							</div>
							<div class="profile-info">
								<div class="row justify-content-center">
									<div class="col-xl-8">
										<div class="row">
											<div class="col-xl-4 col-sm-4 border-right-1 prf-col">
												<div class="profile-name">
													<h4 class="text-primary">테스트화면</h4>
													<p>테스트화면</p>
												</div>
											</div>
											<div class="col-xl-4 col-sm-4 border-right-1 prf-col">
											   <form id="usePointForm" action="use-point-dropdown" method="post">											
												 <select name='usePoint' id="point-box" class="transition-all bg-gray-50 border-2 border-gray-200 text-gray-900 rounded-lg focus:bg-gray-150 focus:border-blue-200 block w-full p-2.5">
		                                            <option id="use-option1" selected value="300" data-price="300" data-point="300">300 point 결제</option>
		                                            <option id="use-option2" value="2100"  data-price="2100" data-point="2100">2,100 point 결제</option>
		                                            <option id="use-option3" value="4900" data-price="4900" data-point="4900">4,900 point 결제</option>
		                                         </select>
		                                         <br><br>                                     
												 <a id="use-point-dropdown-btn" class="btn btn-outline-danger b btn-xs" href="javascript:">
												 결제하기
												 </a>
												</form>
												
												<p>--------------------------------------</p>
												<div class="profile-email ">
													<a id="use-point-btn" href="javascript:" class="btn btn-outline-danger b">
													결제하기</a> 
													<p class="small">500 point</p>
													<p class="small" id="have-point" value="${ loginuser.point }">보유하신 포인트는 ${ loginuser.point } point입니다.</p>
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
											<h4 class="card-title">테스트화면</h4>
										</div>
										<div class="card-body">
											<div class="basic-list-group">
												<div class="row">
													<div class="col-lg-6 col-xl-2">
														<div class="list-group mb-4 " id="list-tab" role="tablist">
															<a class="list-group-item list-group-item-action active"
																id="list-home-list" data-toggle="list" href="#list-home"
																role="tab">테스트화면</a> <a
																class="list-group-item list-group-item-action"
																id="list-profile-list" data-toggle="list"
																href="#list-profile" role="tab">테스트화면</a> <a
																class="list-group-item list-group-item-action"
																id="list-messages-list" data-toggle="list"
																href="#list-messages" role="tab">테스트화면</a> <a
																class="list-group-item list-group-item-action"
																id="list-settings-list" data-toggle="list"
																href="#list-settings" role="tab">테스트화면</a>
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
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript">
	
			$(function () {
				
				$('#use-point-dropdown-btn').on('click', function (event) {
					event.preventDefault();
					var selectedPointAmount = $('#point-box').val();
					var havePoint = $('#have-point');
					var formData = $('#usePointForm').serialize();
					
					if (havePoint < selectedPointAmount ) {
						alret('보유포인트가 부족합니다.')
						location.href = "/dabomweb/payment/purchase-point";
					}
					
					$.ajax({
						"url" : "use-point-dropdown",
						"method" : "post",
						"async" : true,
						"data" : formData,
						"dataType" : "text",
						"success" : function(result, status, xhr) {
							if (result === "success") {
								alert('결제완료');
							} else {
								alert('결제실패');
							}
						},
						"error" : function(xhr, status, err) {
							alert('결제 실패하였습니다.');
						}
					});
				});
		
				
				$('#use-point-btn').on('click', function (event) {
						event.preventDefault();
						var havePoint = $('#have-point');
						if (havePoint < 500) {
							alret('보유포인트가 부족합니다.')
							location.href = "/dabomweb/payment/purchase-point";
						}
						
						$.ajax({
							"url" : "use-point",
							"method" : "post",
							"async" : true,
							"data" : "memberId=&{loginuser.memberId}",
							//"dataType" : "json",
							"success" : function(result, status, xhr) {
								if (result === "success") {
									alert('결제완료');
								} else {
									alert('결제실패');
								}
							},
							"error" : function(xhr, status, err) {
								alert('결제 실패하였습니다.');
							}
						});
					});
				
				});	

	</script>

</body>
</html>