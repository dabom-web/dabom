<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>타이틀수정하세요</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
   
			
			<!-- 여기에 내용 입력하시면 됩니다~!~! -->
			
			
			
			<br><br><br><br><br><br>
		  <div class="content-body">

            <div class="container-fluid">
				
				   <div class="row page-titles mx-0">
				
				<c:forEach var="board" items="${ requestScope.boardList}">
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card mb-3">
                           <a href="/dabomweb/webtoon/webtoonListByTitle?boardno=${board.boardNo}&pageNo=${pageNo}">
                            <img class="card-img-top img-fluid" src="/dabomweb/resources/upload-files/${board.files[0].savedFileName}" alt="Card image cap">
                           </a>
                            <div class="card-header">
                                <h5 class="card-title">${ board.title }</h5>
                            </div>
                            <div class="card-body">
                              
                            </div>
                        </div>
                    </div>  
                    
                    </c:forEach>
				
				</div>
				
				<div align="center">
					<a href="/dabomweb/webtoon/webtoonRegister"> 웹툰 등록 </a>
				</div>
				<br><br>
				<div align="center">
				${ pager} 
				</div>
				<br><br>
			</div>
		</div>

	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>


	

