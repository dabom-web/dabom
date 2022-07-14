<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>Actor</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/dabom.jpg">
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
						<h4>배우 정보</h4>
					</div>
				</div>
				<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
						<a href="/dabomweb/produceBoard/writeActorInfor">배우 정보 업데이트 신청</a></li>						
					</ol>
				</div>

			</div>
			<!-- row -->


			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">배우 정보 보기</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="display" style="min-width: 845px">
									<thead>
										<tr>
											<th style="width: 1000px;">이 름</th>
											<th style="width: 470px;">작성일자</th>
											<th style="width: 100px;">수정신청</th>
										</tr>
									</thead>
									<c:forEach var="board" items="${ actorList }">
										<tbody>
											<tr style="height: 70px;">
												<td style="width: 1000px;"><a href="actorDetail?boardno=${ board.boardNo }">${ board.member.userName }</a></td>
												<td style="width: 470px;">${ board.writedate }</td>
													
													<c:set var="writer" value="${ board.writer }"/>
													<c:if test="${ writer eq loginuser.memberId }">
													<td style="width: 100px;">
														<a href="#"	class="badge badge-rounded badge-danger">신청</a>	
													</td>	
													</c:if>
													<td style="width: 100px;">
														<a class="badge badge-rounded badge-dark">제한</a>
													</td>											
																			 
											</tr>
										</tbody>
									</c:forEach>
									<tfoot>
										<tr>
											<th style="width: 1000px;">Name</th>
											<th style="width: 470px;">WriteDate</th>
											<th style="width: 100px;">Update</th>
										</tr>
									</tfoot>
								</table>
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