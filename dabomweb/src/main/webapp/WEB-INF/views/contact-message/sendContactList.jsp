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
		<a class="btn btn-light btn-xs" id="back-btn"  
				    href="javascript:history.back();" style="width: 100px;" > 
					<span class="mr-2"><i class="fa fa-reply"></i></span> 
					Back
				</a><br><br>
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
								<div role="toolbar" class="toolbar ml-4 ml-sm-0">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<a class="btn btn-outline-dark" id="remove-btn"
										href="javascript:" style="width: 100px;"> 
										<span class="mr-2"><i class="fa fa-trash"></i></span> 
										Remove
									</a>
								</div>
								<c:forEach var="contact" items="${ contactList }">
									<div class="email-list mt-4">
										<div class="message">
											<div>
												<div class="d-flex message-single">
													<div class="custom-control custom-checkbox pl-4">
														<input type="checkbox" name="checkbox" value="${ contact.contactNo }">
													</div>
												</div>
												<a href="sendContactAdminDetail?contactNo=${ contact.contactNo }"
													class="col-mail col-mail-2" style="font-weight: bolder; color: black; font-size: 10pt;">
													<div>💬 ${ contact.title }</div>												
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
	
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript">
	
	$(function() {
		$('#remove-btn').on('click', function(event) {
			event.preventDefault();
			
			var checkboxNo = '';
			$('input[name="checkbox"]:checked').each(function(idx, checkBox) { 
				checkboxNo += $(checkBox).val() + ',';
			});
			
			checkboxNo = checkboxNo.substring(0, checkboxNo.lastIndexOf(','));
			
			if( checkboxNo == ''){
				alert('삭제 할 메세지를 선택하세요.');
				return false;
			}
			
			var ok = confirm('선택한 항목을 휴지통으로 이동합니다.');
			if ( ok ) {
				location.href = 'removeChecked?checkNos=' + checkboxNo;
			}
		
		});	
	
	
	});
	
	
	</script>

</body>
</html>