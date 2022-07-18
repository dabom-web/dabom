<%@page import="com.dabom.dto.WebtoonBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<style type="text/css">
img {
  object-fit: cover;
  overflow: hidden;
}
#box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
</style>


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
		
		 <!--**********************************
            상단
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
               
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="profile">
                            <div class="profile-head">
                                <div class="photo-content">
                                    <div class="cover-photo">
                                    	<img src="/dabomweb/resources/images/webtoon2.jpg"
                                    	style="min-height: 100px; width: 100%">
                                    </div>                                   
                                    <div class="profile-photo">
                                      
                                        <img src="/dabomweb/resources/upload-files/${ webtoonBoard.files[0].savedFileName }" class="img-fluid rounded-circle " id="box" alt="">
                                    </div>
                                </div>
                                <div class="profile-info">
                                    <div class="row justify-content-center">
                                        <div class="col-xl-8">
                                            <div class="row">
                                                <div class="col-xl-4 col-sm-4 border-right-1 prf-col">
                                                    <div class="profile-name">
                                                        <h4 class="text-primary">${webtoonBoard.title }</h4>
                                                      
                                                    </div>
                                                </div>
                                          
                                                <!-- <div class="col-xl-4 col-sm-4 prf-col">
                                                    <div class="profile-call">
                                                        <h4 class="text-muted">(+1) 321-837-1030</h4>
                                                        <p>Phone No.</p>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

			<!-- 카드 -->

				 <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Basic</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-responsive-sm">
                                        <thead>
                                            <tr>
                                                <th>회차</th>
                                                <th>사진</th>
                                                <th>제목</th>
                                                <th>작가</th>
                                                <th>날짜</th>
                                                <th>조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                       	<c:forEach var="webtoon" items="${webtoonListByTitle }">
                                            <tr>
                                             <td>${webtoon.content } </td>
                                            	<td>
                                            	 <a href="/dabomweb/webtoon/detail?boardno=${webtoon.boardNo }&pageNo=${pageNo}&number=${webtoon.number}">
                                            	 <img width="150px" height="100"  src="/dabomweb/resources/upload-files/${ webtoon.files[0].savedFileName }" >
                                            	 </a>
                                            	 </td>
                                               
                                                <td>
                                                     <a href="/dabomweb/webtoon/detail?boardno=${webtoon.boardNo }&pageNo=${pageNo}&number=${webtoon.number}">
                                               		${webtoon.title }
                                              		  </a>
                                                </td>
                                                <td><span class="badge badge-primary">${webtoon.memberId }</span>
                                                </td>
                                                <td>${webtoon.regdate }</td>
                                                <td class="color-primary">${webtoon.readCount }</td>
                                            </tr>
                                           </c:forEach>
                                         
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <c:if test="${loginuser.type eq '웹툰업로더' }">
                        	
                        	<div align="center">
								<a href="/dabomweb/webtoon/webtoonListByTitleRegister?boardno=${webtoonBoard.boardNo}&pageNo=${pageNo}">웹툰 올리기</a>
							</div>
							</c:if>
							<br>
						
                     
                    </div>
	
	

	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>