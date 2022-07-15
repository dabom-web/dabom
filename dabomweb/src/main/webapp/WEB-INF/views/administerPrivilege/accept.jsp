<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>업로드 승인</title>
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
						<h4>정보 업데이트 요청 승인</h4>
					</div>
				</div>
				<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
						</li>						
					</ol>
				</div>

			</div>
			<!-- row -->


			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">정보 업데이트 승인요청</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="display" style="min-width: 845px">
									<thead>
										<tr>
											<th style="width: 1000px;">이   름</th>											
											<th style="width: 470px;">작성일자</th>											
											<th style="width: 100px;">승인신청</th>
										</tr>
									</thead>
									<c:forEach var="board" items="${ produceList }">								
									<tbody>								
										<tr data-boardno="${board.boardNo}" style="height: 70px;">
											<td style="width: 1000px;"><a href="acceptDetail?boardno=${ board.boardNo }">${ board.member.userName }</a></td>											
											<td style="width: 470px;">${ board.writedate }</td>										
											<td style="width: 100px;">
											<form id="accept-form-${board.boardNo}">
											<input type="hidden" name='boardno' value="${ board.boardNo }">
											<input type="hidden" name='ok' value="${ board.ok ? 0 : 1 }">
											<a data-boardno="${board.boardNo}" href="javascript:" class="badge badge-rounded badge-dark accept-link">승인</a>
                                            </form>
                                            </td>											
										</tr>										
									</tbody>
									</c:forEach>	
									<tfoot>
										<tr>
											<th style="width: 1000px;">Name</th>											
											<th style="width: 470px;">WriteDate</th>
											<th style="width: 100px;">Accept</th>											
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
<script type="text/javascript">
	
	$(function() {
		$('.accept-link').on('click', function(event) {

			var ok = confirm('승인하시겠습니까?');
			if (ok) {

				var boardNo = $(this).attr('data-boardno'); // 현재 클릭된 <a 의 data-boardno 속성 값 읽기

				var formData = $('#accept-form-' + boardNo).serialize();
				$.ajax({
					"url" : "accept-post",
					"method" : "post",
					"async" : true,
					"data" : formData,
					"dataType" : "text",
					"success" : function(result, status, xhr) {
						if (result === "success") {
							alert('승인되었습니다.');
							$('tr[data-boardno=' + boardNo + ']').remove();
						} else {
							alert('승인 실패');
						}
					},
					"error" : function(xhr, status, err) {
						alert('승인 실패하였습니다.');
					}

				})
			}
		});
	});
</script>

</body>
</html>