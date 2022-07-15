<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>🗑</title>
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
								<div role="toolbar" class="toolbar ml-4 ml-sm-0">
								<h6 style="font-weight: bolder;">삭제 메세지 리스트</h6>
								</div>
								<c:forEach var="deleted" items="${ deletedList }">
									<div class="email-list mt-4">
										<div class="message">
										<div>💬</div>
											<a href="deletedContactDetail?contactNo=${ deleted.contactNo }"
												class="col-mail col-mail-2" 
												style="font-weight: bolder; color: black; font-size: 10pt;">
												<div>
												<c:choose>
												<c:when test="${ deleted.writertype eq 'admin' }">
													관리자${ deleted.adminId }님이 "${ deleted.memberId }"님에게 보낸 메세지입니다.
												</c:when>
												<c:otherwise>
													${ deleted.memberId }님이 관리자에게 보낸 메세지입니다.
												</c:otherwise>
												</c:choose>	
												<c:choose>
												<c:when test="${ deleted.writertype eq 'admin' }">
													발송일 ${ deleted.sendDate }
												</c:when>
												<c:otherwise>
													수신일 ${ deleted.sendDate }
												</c:otherwise>
												</c:choose>	
												</div>												
											</a>
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




