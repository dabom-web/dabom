<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>삭세메세지 내용보기</title>
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
								<h6 style="font-weight: bolder;">삭제 메세지 내용</h6>
							</div>
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-block">
										제목
										<h4 class="card-title" style="font-weight: bold;">${ contact.title }</h4>
										<c:choose>
											<c:when test="${ contact.writertype eq 'admin' }">
												<p class="mb-0 subtitle">발송일&nbsp;&nbsp; ${ contact.sendDate }</p>
											</c:when>
											<c:otherwise>
												<p class="mb-0 subtitle">수신일&nbsp;&nbsp; ${ contact.sendDate }</p>
											</c:otherwise>
										</c:choose>
									</div>
									<c:choose>
										<c:when test="${ contact.writertype eq 'admin' }">
											<div class="col-xl-6">
												<div class="alert alert-dark notification">
													<p class="notificaiton-title">
														<strong>${ contact.adminId }관리자님이</strong> ${ contact.memberId }회원님에게
														보낸 메세지입니다.
													</p>
													<br> <strong>${fn:replace(contact.content, replaceChar, "<br/>")}</strong>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-xl-6">
												<div class="alert alert-dark notification">
													<p class="notificaiton-title">
														<strong>${ contact.memberId }회원님이</strong> 문의한 내용입니다.
													</p>
													<br> <strong>${fn:replace(contact.content, replaceChar, "<br/>")}</strong>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
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