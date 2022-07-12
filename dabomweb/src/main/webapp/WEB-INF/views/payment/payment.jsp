<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>결제하기</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

	<div class="content-body">
		<div class="container-fluid">
			<div class="row page-titles mx-0">
				<div class="col-sm-6 p-md-0">
					<div class="welcome-text">
						<h4>결제하기</h4><br>
						<span class="ml-1">유료결제서비스</span>
					</div>
				</div>
			
			</div>
			<!-- row -->

			<!-- row -->
			<div class="row">
				<div class="col-xl-4 col-xxl-6 col-lg-6 col-md-6">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">결제1</h4>							
						</div>
						<div class="card-body">
						
						<!-- 내용채우기 -->
						
							<div class="basic-list-group" style="text-align:  center;">
								<button type="button" class="btn btn-rounded btn-primary" ><span
                                        class="btn-icon-left text-primary"><i class="fa fa-plus"></i>
                                    </span>Buy</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-xxl-6 col-lg-6 col-md-6">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">결제2</h4>
						</div>
						<div class="card-body">
						
						<!-- 내용채우기 -->
						
							<div class="basic-list-group" style="text-align:  center;">
								<button type="button" class="btn btn-rounded btn-primary" ><span
                                        class="btn-icon-left text-primary"><i class="fa fa-plus"></i>
                                    </span>Buy</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-xxl-6 col-lg-6 col-md-6">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">결제3</h4>
						</div>
						<div class="card-body">
						
						<!-- 내용채우기 -->
						
						<div class="basic-list-group" style="text-align:  center;">
								<button type="button" class="btn btn-rounded btn-primary" ><span
                                        class="btn-icon-left text-primary"><i class="fa fa-plus"></i>
                                    </span>Buy</button>
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