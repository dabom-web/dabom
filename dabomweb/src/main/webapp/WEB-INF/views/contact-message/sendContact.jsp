<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>메세지 보내기</title>
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
								<jsp:include page="/WEB-INF/views/contact-message/adminContactListLink.jsp" />

							</div>
							<div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
								<div class="toolbar mb-4" role="toolbar">	
									<div class="btn-group mb-1">										
										<a class="btn btn-rounded btn-outline-dark">
											관리자 : ${ loginuser.memberId } 											
										</a>									
									</div>
								</div>
								<div class="compose-content">
									<form id="write-form" method="post" action="sendContactAdmin">
									 <input type="hidden" name="adminId" value="${ loginuser.memberId }">
									 <input type="hidden" name="writertype" value="admin">
										<div class="form-group">
											<label>받는사람 :</label>
											 <select class="form-control" id="sel1" name="memberId">
												<c:forEach var="user" items="${ memberList }">
													<option>${ user.memberId }</option>
												</c:forEach>
											</select>
										</div>
										
										<div class="form-group">
											<input type="text" class="form-control bg-transparent"
												name="title" id="title" placeholder=" 제 목 :">
										</div>
										<div class="form-group">
											<textarea id="content" name="content"
												class="textarea_editor form-control bg-transparent"
												rows="15" placeholder="내용 입력.."></textarea>
										</div>
									</form>

								</div>
								<div class="text-left">
									<a class="btn btn-outline-dark"
									   id="send-btn" href="javascript:" >
										<span class="mr-2"><i class="fa fa-paper-plane"></i></span>
										Send
									</a>
									<a class="btn btn-outline-dark" id="cancel-btn" href="javascript:">
										<span class="mr-2"><i class="fa fa-times" aria-hidden="true"></i></span>
										Cancel
									</a>
								</div>
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
		$('#send-btn').on('click', function (event) {
			event.preventDefault();
			
			var title = document.querySelector('#title');
			var content = document.querySelector('#content');
			
			if (!title.value) {
				alert('메세지 제목을 입력하세요.');
				return false;
			} else if (!content.value) {
				alert('메세지 내용을 입력하세요.');
				return false;
			} else {
				var ok = confirm("메세지를 전송하시겠습니까?");
				if (ok) {
					$('#write-form').submit();			
				} else {
					location.href = "/dabomweb/contact-message/sendContact";
				}			
			}
			
	
				
		});	
		
		
		
		$('#cancel-btn').click(function (event) {
			event.preventDefault();
			var ok = confirm("정말 취소하시겠습니까?");
			if (ok) {
				location.href = "/dabomweb/contact-message/sendContact";	
			}
		});
		
	});
	

	
	
	

	</script>


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>