<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>${ webtoonListByTitle.title }</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />

	 <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
		
	               <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="profile-tab">
                                    <div class="custom-tab-1">
                                       
                                        <div class="tab-content">
                                            <div id="my-posts" class="tab-pane fade active show">
                                                <div class="my-post-content pt-3">
                                                    <div class="post-input">
                                                       
                                                    </div>
                                                    <div class="profile-uoloaded-post border-bottom-1 pb-5">
                                                        <img src="images/profile/8.jpg" alt="" class="img-fluid">
                                                       	<div>
                                                            <h4>${webtoonListByTitle.title }</h4>
                                                            <br>
                                                            <br>
                                                    	</div>
                                                    	<div>
                                        			 
                                                    	<img src="/dabomweb/resources/upload-files/${ webtoonListByTitleattach[1].savedFileName }"/>
                                                  
                                                    	</div> 
                                                    
                                                        <p>작가의 말</p>
                                                        <button class="btn btn-primary mr-3"><span class="mr-3"><i
                                                                    class="fa fa-heart"></i></span>Like</button>
                                                   
                                              
                                              				<br><br><br>
                               								<a id='delete-btn' href="#">삭제하기</a>
                               								<a id="edit-btn" href="#">수정하기</a>
                                                    
                                                             
                                    
                                                     
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                      
                           
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>	
	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

	<script type="text/javascript">
	$(function(){
		$('#delete-btn').click(function(event){
			event.preventDefault();
			var ok = confirm('삭제하시겠습니까?');
			if(ok){
				location.href='delete?boardno=${webtoonListByTitle.boardNo}&number=${webtoonListByTitle.number}&pageNo=${param.pageNo}'
			}
		})	
	});
	
	$(function(){
		$('#edit-btn').click(function(event){
			event.preventDefault();
			var ok = confirm('수정하시겠습니까?')
			if(ok){
				location.href='edit?boardno=${webtoonListByTitle.boardNo}&pageNo=${param.pageNo}&number=${webtoonListByTitle.number}'
			}
		})
	})
	
	</script>

</body>
</html>