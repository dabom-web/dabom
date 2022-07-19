<%@page import="com.dabom.dto.VideoUpload"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>DABOM | HOT CHANNEL VIDEO</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

<style type="text/css">

	img {
		 object-fit: cover;
 		 overflow: hidden;
	}
	
	.box {
		width: 100%;
		height: 300px;
	}
	
	.text-box {
			  overflow: hidden;
			  text-overflow: ellipsis;
			  white-space: nowrap;
			  width: 100%;
			  
			}
	
</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

	<div class="content-body">
		<div class="container-fluid">
			<div class="row page-titles mx-0">
				<div class="col-sm-6 p-md-0">
					<div class="welcome-text">
						<h4>인기영상리스트</h4>
						<span class="ml-1">(HOT Video)</span>
					</div>
				</div>
				<div
					class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Channel</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">(Hot video)</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->
			<div class="email-box col-lg-12">


				<div class="card">
					<div class="card-header">
						<h4 class="card-title">
							<b>업로드한 동영상</b>
						</h4>
					</div>

					<div class="container-fluid">
						<div class="row page-titles mx-0">
							<c:forEach var="vUpload" items="${ vList }">
								<div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
									<c:if test="${ vUpload.open }">

									</c:if>
									<a href="/dabomweb/video/detail?videoNo=${ vUpload.videoNo }">
										<div class="card mb-3">
											<img class="box"
												src='/dabomweb/resources/upload-files/${ vUpload.thumbnailSavedName }'>
											<div class="card-header">
												<h4 class="card-title">[${ vUpload.videoType }] ${ vUpload.videoTitle }</h4>
												<h5 class="card-writer">${ vUpload.memberId }</h5>
											</div>
											<div class="card-body">
												<p class="card-text text-box">${ vUpload.content }</p>
												<p class="card-text text-dark">
													<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
														value="${ vUpload.uploadTime }" />
												</p>
												<p class="card-text text-dark">조회수: ${ vUpload.readCount }</p>
											</div>
										</div>
									</a>
								</div>

							</c:forEach>

						</div>
					</div>
				</div>
				<!-- panel -->
				<div class="row mt-4 m-4 mx-sm-4">
					<div class="col-7">
						<div class="text-left"></div>
					</div>
					<div class="col-5">
						<div class="btn-group float-right">
							<!-- <button class="btn btn-dark" type="button"><i class="fa fa-angle-left"></i>
                                                </button>
                                                <button class="btn btn-dark" type="button"><i class="fa fa-angle-right"></i>
                                                </button> -->
							<ul class="pagination pagination-sm m-0">${ pager }
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	
	

</body>
</html>