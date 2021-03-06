<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>관리자의 메세지</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">
	<jsp:include page="/WEB-INF/views/modules/css/font.jsp" />
	<style type="text/css">
		.f {
			font-family: 'NanumYuNiDdingDdangDdingDdang';
			font-size: 20pt;
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
							<h4>${ loginuser.memberId }님의 문의 메세지함</h4>
						<span class="ml-1">Inquiry Message</span>
					</div>
				</div>

			</div>
			<!-- row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="email-left-box px-0 mb-5">
								<div class="p-0">
									<a href="/dabomweb/contact-message/sendContactListByUser?memberId=${ loginuser.memberId }"
										class="btn btn-primary btn-block">Message</a>
								</div>							
									<div class="mail-list mt-4">
									<a href="/dabomweb/contact-message/sendContactUser" class="list-group-item active"> 
										<i class="fa fa-inbox font-18 align-middle mr-2"></i> 
										메세지 작성하기 
										<span class="badge badge-primary badge-sm float-right"></span>
									</a>
									
									 <a href="/dabomweb/contact-message/sendContactListByUser?memberId=${ loginuser.memberId }" class="list-group-item"> 
										 <i class="fa fa-paper-plane font-18 align-middle mr-2"></i>
										  보낸 메세지함
									 </a> 
									
									<a href="/dabomweb/contact-message/contactMessageToUser?memberId=${ loginuser.memberId }"class="list-group-item">
										<i class="fa fa-star font-18 align-middle mr-2"></i>
										관리자의 메세지
										<span class="badge badge-danger text-white badge-sm float-right"></span>
									</a> 
																		
								</div>

							</div>
							<div class="email-right-box ml-0 ml-sm-4 ml-sm-0"></div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-outline-dark" id="remove-btn"
								href="javascript:" style="width: 100px;"> 
								<span class="mr-2"><i class="fa fa-trash"></i></span> 
								Remove
							</a>
							<div class="col-lg-12">

								<div class="card">

									<div class="card-header d-block">
										제목
										<h4 class="card-title" style="font-weight: bold;">${ contact.title }</h4>
										<p class="mb-0 subtitle">전송일&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ contact.sendDate }"/></p>
									</div>
									<div class="col-xl-6">
										<div class="alert alert-dark notification">
											<p class="notificaiton-title f">
												<strong>${ loginuser.memberId } 회원님</strong> 
												<br>관리자의 메세지입니다.
												</p><br>
											<strong class="f">${fn:replace(contact.content, replaceChar, "<br/>")}</strong>
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
	
	$(function() {
		
		$('#remove-btn').on('click', function(event) {
			event.preventDefault();
			
			var ok = confirm('휴지통으로 이동합니다.');
			if( ok ) {
				location.href = 'removeContactUser?memberId=${ loginuser.memberId }&contactNo=' + ${ contact.contactNo };
			} 
		});
		
	});	
	</script>
</body>
</html>