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
<title>사이트 수익관리</title>
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
	
	.text-success {
    color: #97cef5;
	}
	.border-success {
    border-color: #97cef5;
    }
   
    body {
    	font-weight: bolder;
    }
    
    h2 {
  	  font-weight: bolder;
    }
    
    h4 {
  	  font-weight: bolder;
    }
     h6 {
  	  font-weight: bolder;
    }
    
    .blue {
    	color: #97cef5;
    }
    
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
						<h4>REVENUE</h4>
						<span class="ml-1">다봄 사이트 수익</span>
					</div>
				</div>
				<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<a href="#">DA:BOM REVENUE</a>				
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">REVENUE</h4>
						</div>
						<div class="card-body">
							<div class="basic-list-group">
								<div class="row">
									<div class="col-lg-6 col-xl-2">
										<div class="list-group mb-4 " id="list-tab" role="tablist">
											<a class="list-group-item list-group-item-action active"
												id="list-home-list" data-toggle="list"
												href="#list-profile" role="tab">
												총 수익률
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-edit-profile-list" data-toggle="list"
												href="#list-edit-profile" role="tab">
												월별 수익률
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-channel-list" data-toggle="list"
												href="#list-channel" role="tab">
												채널별 수익
											</a>
											<a class="list-group-item list-group-item-action"
												id="list-edit-usertype-list" data-toggle="list"
												href="#list-edit-usertype" role="tab">
												웹툰별 수익
											</a>  
											<a class="list-group-item list-group-item-action"
												id="list-messages-list" data-toggle="list"
												href="#list-messages" role="tab">
												광고 수익
											</a> 
											<a class="list-group-item list-group-item-action"
												id="list-payment-list" data-toggle="list"
												href="#list-payment" role="tab">
												이익 분포도
											</a>
										</div>
									</div>						
									<div class="col-xl-10">
										<div class="tab-content" id="nav-tabContent">
											<div class="tab-pane fade show active" id="list-profile">
												<h4 class="mb-4">총 수익율</h4>
												 <div class="row">
														<div class="col-lg-3 col-sm-6">
									                        <div class="card">
									                            <div class="stat-widget-two card-body">
									                                <div class="stat-content">
									                                    <div class="stat-text blue">수익</div>
									                                    <div class="stat-digit"> <i class="fa fa-usd"></i> 80,041,687 원</div>
									                                </div>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-3 col-sm-6">
									                        <div class="card">
									                            <div class="stat-widget-two card-body">
									                                <div class="stat-content">
									                                    <div class="stat-text blue">순수익</div>
									                                    <div class="stat-digit"> <i class="fa fa-usd"></i> 48,647,544 원</div>
									                                </div>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-3 col-sm-6">
									                        <div class="card">
									                            <div class="stat-widget-two card-body">
									                                <div class="stat-content">
									                                    <div class="stat-text blue">미사용 포인트 금액환산</div>
									                                    <div class="stat-digit"> <i class="fa fa-usd"></i>13,554,941</div>
									                                </div>
									                            </div>
									                        </div>
									                    </div>
													</div>
											</div>
										
											<div class="tab-pane fade" id="list-edit-profile">
												<h4 class="mb-4">월별 수익률</h4>
														<div class="row">
															<div class="col-lg-3 col-sm-6">
										                        <div class="card">
										                            <div class="stat-widget-two card-body">
										                                <div class="stat-content">
										                                    <div class="stat-text blue">당월 수익금</div>
										                                    <div class="stat-digit"> <i class="fa fa-usd"></i> 1,547,971</div>
										                                </div>
										                            </div>
										                        </div>
										                    </div>
										                    <div class="col-lg-3 col-sm-6">
										                        <div class="card">
										                            <div class="stat-widget-two card-body">
										                                <div class="stat-content">
										                                    <div class="stat-text blue">월별 최고 수익금</div>
										                                    <div class="stat-digit"> <i class="fa fa-usd"></i> 3,441,248</div>
										                                </div>
										                            </div>
										                        </div>
										                    </div>
														</div>            
											      		 <div class="col-lg-6 col-sm-6">
							                                <div class="card">
							                                    <div class="card-header">
							                                        <h4 class="card-title">Chart</h4>
							                                    </div>
							                                    <div class="card-body">
							                                        <canvas id="barChart_1"></canvas>
							                                    </div>
							                                </div>
							                            </div>	
							              		  </div>
										
											
											<div class="tab-pane fade show" id="list-channel">
												<h4 class="mb-4">채널별 수익</h4>
												<h6> 월별 채널 수익</h6>
												<table class="table table-hover bl">
			                                        <tbody>
			                                        
			                                            <tr>
			                                                <td width="15%;">채널명</td>
			                                                <td>계정 ID</td>
			                                                <td>개 설 일</td>
			                                                <td>구독 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                            <tr>
			                                                <td width="15%;">채널명</td>
			                                                <td>계정 ID</td>
			                                                <td>개 설 일</td>
			                                                <td>구독 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                        </tbody>
			                                    </table>
			                                   	<h6>총 채널 수익</h6>
			                                    <table class="table table-hover bl">
			                                        <tbody>
			                                        
			                                            <tr>
			                                                <td width="15%;">채널명</td>
			                                                <td>계정 ID</td>
			                                                <td>개 설 일</td>
			                                                <td>구독 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                            <tr>
			                                                <td width="15%;">채널명</td>
			                                                <td>계정 ID</td>
			                                                <td>개 설 일</td>
			                                                <td>구독 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                        </tbody>
			                                    </table>
												
											</div>
											
											<div class="tab-pane fade" id="list-edit-usertype">
												<h4 class="mb-4">웹툰별 수익</h4>
													<h6> 월별 웹툰 수익</h6>
												<table class="table table-hover bl">
			                                        <tbody>
			                                        
			                                            <tr>
			                                                <td width="15%;">웹툰명</td>
			                                                <td>작가 ID</td>
			                                                <td>연재 시작일</td>
			                                                <td>열람 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                            <tr>
			                                                <td width="15%;">웹툰명</td>
			                                                <td>작가 ID</td>
			                                                <td>연재 시작일</td>
			                                                <td>열람 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                        </tbody>
			                                    </table>
			                                   	<h6>총 웹툰 수익</h6>
			                                    <table class="table table-hover bl">
			                                        <tbody>
			                                        
			                                            <tr>
			                                                <td width="15%;">웹툰명</td>
			                                                <td>작가 ID</td>
			                                                <td>연재 시작일</td>
			                                                <td>열람 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                            <tr>
			                                                <td width="15%;">웹툰명</td>
			                                                <td>작가 ID</td>
			                                                <td>연재 시작일</td>
			                                                <td>열람 수익</td>
			                                                <td>광고 수익</td>
			                                                <td>총 수 익</td>
			                                                <td>수익 배당</td>
			                                            </tr>
			                                            
			                                        </tbody>
			                                    </table>
											</div>
											
											<div class="tab-pane fade" id="list-messages">
												<h4 class="mb-4">광고 수익</h4>
													<div class="row">
														<div class="col-lg-3 col-sm-6">
									                        <div class="card">
									                            <div class="stat-widget-two card-body">
									                                <div class="stat-content">
									                                    <div class="stat-text blue">지정 광고 수익</div>
									                                    <div class="stat-digit"> <i class="fa fa-usd"></i> 23,014,548</div>
									                                </div>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-3 col-sm-6">
									                        <div class="card">
									                            <div class="stat-widget-two card-body">
									                                <div class="stat-content">
									                                    <div class="stat-text blue">재생 광고 수익</div>
									                                    <div class="stat-digit"> <i class="fa fa-usd"></i> 14,585,677</div>
									                                </div>
									                            </div>
									                        </div>
									                    </div>
													</div>
												 <div class="col-lg-6 col-sm-6">
					                                <div class="card">
					                                    <div class="card-header">
					                                        <h4 class="card-title">Chart</h4>
					                                    </div>
					                                    <div class="card-body">
					                                        <canvas id="barChart_2"></canvas>
					                                    </div>
					                                </div>
					                            </div>
											</div>
											
											<div class="tab-pane fade" id="list-payment">
												<h4 class="mb-4">사이트 이익 분포도</h4>
														<div class="row">
															<div class="col-lg-3 col-sm-6">
										                        <div class="card">
										                            <div class="stat-widget-two card-body">
										                                <div class="stat-content">
										                                    <div class="stat-text blue">최고 분포율</div>
										                                    <div class="stat-digit"> <i class="fa fa-usd"></i> 1,547,971</div>
										                                    <h6>채널 구독료 58%</h6>
										                                </div>
										                            </div>
										                        </div>
										                    </div>
										                    <div class="col-lg-3 col-sm-6">
										                        <div class="card">
										                            <div class="stat-widget-two card-body">
										                                <div class="stat-content">
										                                    <div class="stat-text blue">최저 분포율</div>
										                                      <div class="stat-digit"> <i class="fa fa-usd"></i> 1,547,971</div>
										                                     <h6>웹툰 구독료 14%</h6>
										                                </div>
										                            </div>
										                        </div>
										                    </div>
														</div>
													<div class="row">
									                    <div class="col-lg-4">
									                        <div class="card">
									                            <div class="card-header">
									                                <h4 class="card-title" style="font-weight: bold;">이익분포율</h4>
									                            </div>
									                            <div class="card-body">
									                                <div class="current-progress">
									                                    <div class="progress-content py-2">
									                                        <div class="row">
									                                            <div class="col-lg-4">
									                                                <div class="progress-text" >채널 구독료</div>
									                                            </div>
									                                            <div class="col-lg-8">
									                                                <div class="current-progressbar">
									                                                    <div class="progress">
									                                                        <div class="progress-bar progress-bar-primary w-60"
									                                                        	  role="progressbar" aria-valuenow="60" aria-valuemin="" aria-valuemax="100">
									                                                            58%
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                            </div>
									                                        </div>
									                                    </div>
									                                    <div class="progress-content py-2">
									                                        <div class="row">
									                                            <div class="col-lg-4">
									                                                <div class="progress-text">웹툰 구독료</div>
									                                            </div>
									                                            <div class="col-lg-8">
									                                                <div class="current-progressbar">
									                                                    <div class="progress">
									                                                        <div class="progress-bar progress-bar-primary w-20" 
									                                                        	role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
									                                                            14%
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                            </div>
									                                        </div>
									                                    </div>
									                                    <div class="progress-content py-2">
									                                        <div class="row">
									                                            <div class="col-lg-4">
									                                                <div class="progress-text">광고료</div>
									                                            </div>
									                                            <div class="col-lg-8">
									                                                <div class="current-progressbar">
									                                                    <div class="progress">
									                                                        <div class="progress-bar progress-bar-primary w-30" 
									                                                        	 role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
									                                                            32%
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		

	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	
	<script src="/dabomweb/resources/vendor/chart.js/Chart.bundle.min.js"></script>
		
	<script type="text/javascript">

		$(function () {
			
			
			///////////////////////////월별수익/////////////////////////
			const barChart_1 = $("#barChart_1")[0].getContext('2d');
		    
		    barChart_1.height = 100;

		    new Chart(barChart_1, {
		        type: 'bar',
		        data: {
		            defaultFontFamily: 'Poppins',
		            labels: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
		            datasets: [
		                {
		                    label: "월별 수익",
		                    data: [65, 59, 80, 81, 56, 55, 40, 23, 23, 23, 23, 45],
		                    borderColor: 'rgba(255, 162, 181, 1)',
		                    borderWidth: "10",
		                    backgroundColor: 'rgba(155, 210, 249, 0.5)'
		                }
		            ]
		        },
		        options: {
		            legend: false, 
		            scales: {
		                yAxes: [{
		                    ticks: {
		                        beginAtZero: true
		                    }
		                }],
		                xAxes: [{
		                    // Change here
		                    barPercentage: 0.5
		                }]
		            }
		        }
		    });
			///////////////////////////광고수익/////////////////////////
			
			const barChart_2 = $("#barChart_2")[0].getContext('2d');
		    //generate gradient
		    const barChart_2gradientStroke = barChart_2.createLinearGradient(0, 0, 0, 250);
		    barChart_2gradientStroke.addColorStop(0, 'rgba(255, 162, 181, 1)');
		    barChart_2gradientStroke.addColorStop(1, 'rgba(255, 162, 181, 0.5)');
		
		    barChart_2.height = 100;
		
		    new Chart(barChart_2, {
		        type: 'bar',
		        data: {
		            defaultFontFamily: 'Poppins',
		            labels: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
		            datasets: [
		                {
		                    label: "월별 광고 수익",
		                    data: [65, 59, 80, 81, 56, 55, 40, 23, 23, 23, 23, 45],
		                    borderColor: barChart_2gradientStroke,
		                    borderWidth: "0",
		                    backgroundColor: barChart_2gradientStroke, 
		                    hoverBackgroundColor: barChart_2gradientStroke
		                }
		            ]
		        },
		        options: {
		            legend: false, 
		            scales: {
		                yAxes: [{
		                    ticks: {
		                        beginAtZero: true
		                    }
		                }],
		                xAxes: [{
		                    // Change here
		                    barPercentage: 0.5
		                }]
		            }
		        }
		    });
			
			////////////////////////////////////////////////////
			
			
			
			
			
			
			
			
			
							
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
						// "dataType" : "json",
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
						// "dataType" : "json",
						"success" : function(result, status, xhr) {
							if(result === "success") {
								alert('비활성화 성공');
								location.href = "/dabomweb/disabledMemberHome";	
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