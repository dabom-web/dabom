<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>문의메시지</title>
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
						<h4>문의 메시지함 📬</h4>
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
									<a href="/dabomweb/contact-message/contactMessage"
										class="btn btn-primary btn-block">Message</a>
								</div>
								<div class="mail-list mt-4">
									<a href="/dabomweb/contact-message/sendContact" class="list-group-item active"> 
										<i class="fa fa-inbox font-18 align-middle mr-2"></i> 
										메세지 작성하기 
										<span class="badge badge-primary badge-sm float-right"></span>
									</a>
									
									 <a href="/dabomweb/contact-message/sendContactList" class="list-group-item"> 
										 <i class="fa fa-paper-plane font-18 align-middle mr-2"></i>
										  보낸 메세지함
									 </a> 
									
									<a href="/dabomweb/contact-message/contactMessage"class="list-group-item">
										<i class="fa fa-star font-18 align-middle mr-2"></i>
										문의 메세지함 
										<span class="badge badge-danger text-white badge-sm float-right">47</span>
									</a> 
									
									<a href="#" class="list-group-item">
										<i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>
										읽은메세지함
									</a> 
									
									<a href="#" class="list-group-item">
										<i class="fa fa-trash font-18 align-middle mr-2"></i>
										삭제한 메세지
									</a>

								</div>
							</div>
							<div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
								<div role="toolbar" class="toolbar ml-4 ml-sm-0">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<a class="btn btn-dark"
										id="remove-btn" href="javascript:"> 
										Remove<span class="btn-icon-right">
										<i class="fa fa-trash"></i></span>
									</a>
								</div>
								<c:forEach var="contact" items="${ contactList }">
									<div class="email-list mt-4">
										<div class="message">
											<div>
												<div class="d-flex message-single">
													<div class="custom-control custom-checkbox pl-4">
														<input type="checkbox">
													</div>
												</div>
												<a href="sendContactAdminDetail?contactNo=${ contact.contactNo }"
													class="col-mail col-mail-2">
													<div>${ contact.title }</div>												
												</a>

											</div>
										</div>
									</div>
								</c:forEach>
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