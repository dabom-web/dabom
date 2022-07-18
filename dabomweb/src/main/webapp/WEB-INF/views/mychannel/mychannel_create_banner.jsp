<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>채널만들기</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
   
<!--********************************** Content body start ***********************************-->

	<div class="content-body">
		<div class="container-fluid">

			<!-- row -->
			<div class="row justify-content-center">
				<div class="col-lg-11">
					<div class="card">					
						<div class="card-header justify-content-center">
							<h4>
								<br>정보를 입력하세요
							</h4>
						</div>
						<div class="card-body justify-content-center">
							<div class="form-validation">
								<form id="mychannelupdate-banner" action="mychannel_create_banner" 
									  method="post" enctype="multipart/form-data">
									<div class="row">
										<div class="col-xl-9" style="float: none; margin: 0 auto;">
											<div class="form-group row justify-content-center">
												<label class="col-lg-2 col-form-label text-muted" for="val-memberid">
													아이디<span class="text-danger">*</span>
												</label>
												<div class="col-lg-8">
													<input type="hidden"
							 						   	   name="member_Id" id="member_Id" value="${ loginuser.memberId }"> 
		                                            <p class="text-muted">&nbsp;&nbsp; ${ loginuser.memberId }</p>
												</div>
											</div>
											<div class="form-group row justify-content-center">
												<label class="col-lg-2 col-form-label text-muted" for="val-name">
													채널이름<span class="text-danger">*</span>
												</label>
												<div class="col-lg-8">
													<p class="text-muted">&nbsp;&nbsp;${myChannel.channel_Name }</p>														  
												</div>
											</div>
											<div class="form-group row justify-content-center">
												<label class="col-lg-2 col-form-label text-muted"
													   for="val-confirm-password">
													배너 사진 <i class="fa fa-paperclip"></i></label>													
												<div class="col-lg-8">													
			                                        <div class="d-flex flex-column align-items-center justify-content-center">
			                                            <div class="fallback w-100">
			                                                <input name="attach" type="file" class="dropify" data-default-file="" />
			                                            </div>
			                                        </div>													
												</div>
											</div>
											<div class="form-group row">
												<div class="col-lg-7 ml-auto">
													<button class="btn btn-primary"
															id="updatebanner" type="button"
															href="javascript:">등록</button>
													<a href="javascript:history.back()">
													<button class="btn btn-primary" 
															id="cancel" type="button"
															href="javascript:history.back();">취소</button></a>
												</div>
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

	<!--********************************** Content body end ***********************************-->

	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	
	<script type="text/javascript">
		
	$('#updatebanner').on('click',function(event) { 
		event.preventDefault();		
		var ok = confirm('배너사진이 등록 되었습니다!');
		if (ok) {
			$('#mychannelupdate-banner').submit();				
		}					
	})
	
	 
	</script>

</body>
</html>