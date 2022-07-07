<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>Directer</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">
</head>
<body>   
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <div id="main-wrapper">
      <jsp:include page="/WEB-INF/views/modules/header.jsp"></jsp:include>
      <jsp:include page="/WEB-INF/views/modules/sidebar.jsp"></jsp:include>
    </div>

	<div class="content-body">
		<div class="container-fluid">
			<div class="row page-titles mx-0">
				<div class="col-sm-6 p-md-0">
					<div class="welcome-text">
						<h4>영상 제작자 정보</h4>
					</div>
				</div>
				<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
						<a href="/dabomweb/produceBoard/writeDirecterInfor">감독 정보 업데이트 신청</a></li>						
					</ol>
				</div>

			</div>
			<!-- row -->


			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">감독 정보 보기</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="display" style="min-width: 845px">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>61</td>
											<td>2011/04/25</td>
											<td>$320,800</td>
										</tr>
										<tr>
											<td>Garrett Winters</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>63</td>
											<td>2011/07/25</td>
											<td>$170,750</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script src="/dabomweb/resources/vendor/global/global.min.js"></script>
		<script src="/dabomweb/resources/js/quixnav-init.js"></script>
		<script src="/dabomweb/resources/js/custom.min.js"></script>


		<!-- Vectormap -->
		<script src="/dabomweb/resources/vendor/raphael/raphael.min.js"></script>
		<script src="/dabomweb/resources/vendor/morris/morris.min.js"></script>


		<script
			src="/dabomweb/resources/vendor/circle-progress/circle-progress.min.js"></script>
		<script
			src="/dabomweb/resources/vendor/chart.js/Chart.bundle.min.js"></script>

		<script src="/dabomweb/resources/vendor/gaugeJS/dist/gauge.min.js"></script>

		<!--  flot-chart js -->
		<script src="/dabomweb/resources/vendor/flot/jquery.flot.js"></script>
		<script src="/dabomweb/resources/vendor/flot/jquery.flot.resize.js"></script>

		<!-- Owl Carousel -->
		<script
			src="/dabomweb/resources/vendor/owl-carousel/js/owl.carousel.min.js"></script>

		<!-- Counter Up -->
		<script
			src="/dabomweb/resources/vendor/jqvmap/js/jquery.vmap.min.js"></script>
		<script
			src="/dabomweb/resources/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
		<script
			src="/dabomweb/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>


		<script src="/dabomweb/resources/js/dashboard/dashboard-1.js"></script>
</body>
</html>