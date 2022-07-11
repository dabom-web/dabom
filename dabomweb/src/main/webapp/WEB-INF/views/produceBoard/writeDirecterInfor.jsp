<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>Write Directer Infor</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
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
						<h4>감독 소개 정보를 입력해주세요</h4>
						<br>
					</div>
				</div>
				<div
					class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">수정제안하기</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">정보를 입력해주세요.</h4>
						</div>
						<div class="card-body">
							<div class="form-validation">
								<form id="write-form"
									class="form-valide" 
									action="writeDirecterInfor" 
									method="post"
									enctype="multipart/form-data">
																	
									<input type="hidden" name="type" value="directer">
									<input type="hidden" name="writer" value="na0stone">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Name <span
													class="text-danger">*</span>
												</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="directer-name"
														name="memberId" value="나영석" placeholder="(업로더회원정보)">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Email <span
													class="text-danger">*</span>
												</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="email"
														name="email" value="na0stone@pd.com" placeholder="(회원정보에서)">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">SNS <span
													class="text-danger"></span>
												</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="sns" name="sns"
														placeholder="sns주소가 있나요?">
												</div>
											</div>

											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Information <span
													class="text-danger">*</span>
												</label>
												<div class="col-lg-6">
													<textarea class="form-control" id="infor" name="infor"
														rows="10" placeholder="짧게 소개해 주세요"></textarea>
												</div>
											</div>
										</div>
										<div class="col-xl-6">

											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Phone<span
													class="text-danger"></span>
												</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="contact"
														name="contact" placeholder="연락처를 공개 하시려면 입력해주세요.">
												</div>
											</div>
											<div class="basic-form custom_file_input">
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">Upload</span>
													</div>
													<div class="custom-file">
														<input type="file" name="producerAttach" class="custom-file-input"> <label
															class="custom-file-label">Choose file</label>
													</div>
												</div>
											</div>
											<br><br><br><br>
											<h3 style="text-align: center;">입력하신 정보는 관리자가 승인하면 업데이트 됩니다.</h3>
											<div class="col-lg-8 ml-auto"><br><br><br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												 <a id="write" href="javascript:">
												 <button class="btn btn-primary">Submit</button></a>
												  <a id="cancel" href="#">
												  <button class="btn btn-primary">Cancel</button></a>
												 
											</div>
										</div>
									</div>
								</form>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript">
	
	$(function () {
		$('#write').on('click', function (event) {
			event.preventDefault();
			$('#write-form').submit();			
		});		
	});

	</script>



	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>