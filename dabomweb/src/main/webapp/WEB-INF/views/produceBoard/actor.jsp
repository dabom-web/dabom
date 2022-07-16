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
 	<title>Actor</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">
    <style type="text/css">
    	.tr {
    		color: gray;
    		font-weight: bolder;		
    	}
    	
    	.th {
    		color: black;
    		font-size: 10pt;
    		font-weight: bold;
    	}
    
    	a:link { color:black; }
		a:visited { color:black; }
		a:hover { color:lightgray; }
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
					<div class="welcome-text tr">
						<h4>배우 정보</h4>
					</div>
				</div>
			</div>
				

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title tr">배우 정보 보기</h4>
						</div>
							
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="display" style="min-width: 845px">
									<thead>
										<tr class="tr small">
											<th style="width: 1000px;">이 름</th>
											<th style="width: 470px;">작성일자</th>
											<th style="width: 100px;">수정신청</th>
										</tr>
									</thead>
									<c:forEach var="board" items="${ actorList }">
										<tbody class="th">
											<tr style="height: 70px;" data-boardno="${ board.boardNo }">
												<td style="width: 1000px;"><a href="actorDetail?boardno=${ board.boardNo }">${ board.member.userName }</a></td>
												
												<c:choose>
												<c:when test="${ board.modifydate ne null }">
													<td style="width: 470px;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ board.modifydate }"/>에 수정</td>
												</c:when>
												<c:otherwise>
													<td style="width: 470px;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ board.writedate }"/></td>
												</c:otherwise>
												</c:choose>
											
												<c:choose>
												<c:when test="${ loginuser.memberId eq board.writer }">
													<td style="width: 100px;">
														<a href="editActorInfor?boardno=${ board.boardNo }" class="badge badge-rounded badge-danger">신청</a>	
													</td>	
												</c:when>
												<c:otherwise>
													<c:choose>
													<c:when test="${ loginuser.type eq 'admin' }">
														<td style="width: 100px;">
															<form id="remove-form-${board.boardNo}">
																<input type="hidden" name='boardno' value="${ board.boardNo }">
																<a class="badge badge-rounded badge-info remove-link" href="javascript:"
																   data-boardno="${ board.boardNo }">삭제</a>
															 </form>
														 </td>
													</c:when>
													<c:otherwise>
														<td style="width: 100px;">
															<a class="badge badge-rounded badge-dark">제한</a>
														</td>
													</c:otherwise>
													</c:choose>
												</c:otherwise>
												</c:choose>
											</tr>
										</tbody>
									</c:forEach>
									<tfoot>
										<tr class="tr small">
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
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript">

	
		$(function() {
			$('.remove-link').on('click', function(event) {

				var ok = confirm('삭제하시겠습니까?');
				if (ok) {

					var boardNo = $(this).attr('data-boardno');

					var formData = $('#remove-form-' + boardNo).serialize();
					$.ajax({
						"url" : "remove-post",
						"method" : "post",
						"async" : true,
						"data" : formData,
						"dataType" : "text",
						"success" : function(result, status, xhr) {
							if (result === "success") {
								alert('삭제되었습니다.');
								$('tr[data-boardno=' + boardNo + ']').remove();
							} else {
								alert('삭제 실패');
							}
						},
						"error" : function(xhr, status, err) {
							alert('삭제 실패하였습니다.');
						}

					})
				}

			});
		});
		
	</script>

</body>
</html>