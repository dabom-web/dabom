<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
  <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav" >
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                
                <!-- 홈 -->
                <li class="nav-label first">DA!BOM Home</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                   
                    <span class="nav-text">📺 Channel</span></a>
                        <ul aria-expanded="false">  
                            <li><a href="#">라이브방송</a></li>                      
                      		<li><a href="/dabomweb/collect/chart">채널차트</a></li>
                            <li><a href="/dabomweb/collect/newUpdateVideo">최근 업데이트 영상</a></li>                           
                            <li><a href="/dabomweb/collect/hotChannel">인기 채널</a></li>
                        </ul>
                    </li>
                 
                   <!--  <li class="nav-label first">탐색</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <span class="nav-text">🚀 Collect</span></a>
                        <ul aria-expanded="false">
                        	 <li><a href="/dabomweb/collect/subscribeChannel">구독 채널</a></li>
                            <li><a href="/dabomweb/collect/wishList">찜 목록</a></li>
                            <li><a href="/dabomweb/collect/supportDirector">응원 감독 영상</a></li> 
                            <li><a href="/dabomweb/collect/supportActor">응원 배우 영상</a></li>       
                            
                        </ul>
                    </li> -->
                    
                     
                 <c:choose>
	                 <c:when test="${ loginuser.type eq 'admin' }">
	                 <!-- / 관리자 페이지  -->
	                 <li class="nav-label first">사이트 관리</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                    <span class="nav-text">🥞 Management</span></a>
	                        <ul aria-expanded="false">                        
	                        	<li><a href="/dabomweb/contact-message/contactMessage">문의메세지</a></li>
	                        	<li><a href="/dabomweb/administerPrivilege/site-revenue">사이트 수익관리</a></li>
	                            <li><a href="/dabomweb/administerPrivilege/member-management">회원계정관리</a></li>                           
	                            <li><a href="/dabomweb/administerPrivilege/channel-management">채널관리</a></li>
	                            <li><a href="/dabomweb/administerPrivilege/board-and-comment-management">게시글&댓글관리</a></li>
	                            <li><a href="/dabomweb/administerPrivilege/accept">업로드승인 new(<span id="accept-request-count">${ count }</span>)</a></li>                        
	                        </ul>
	                    </li>
	                    <!-- / 관리자 페이지 -->
	                 </c:when>                 
					 <c:otherwise>                    
	                 </c:otherwise>
                 </c:choose>
                    
                    
                 <!-- / 웹툰 -->
                 
                    <li class="nav-label first">웹툰</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <span class="nav-text">👻 Webtoon</span></a>
                        <ul aria-expanded="false">
                        
                            <li><a href="/dabomweb/webtoon/webtoonList">웹툰 보기</a></li>
          
                            
                        </ul>
                    </li>
                    
                    <!-- / 웹툰 -->
                
	                 <!-- / 영상팀소개 -->
	                 
	                    <li class="nav-label first">영상팀 정보</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                       ‍👩‍👧‍👦 Porducer</span></a>
	                        <ul aria-expanded="false">
	                        
	                            <li><a href="/dabomweb/produceBoard/director">감독</a></li>
	                 
	                            <li><a href="/dabomweb/produceBoard/actor">배우</a></li>
	                       
	                            
	                        </ul>
	                    </li>
	                    
	                    <!-- / 영상팀소개 -->
	                    
	                    <!-- / 결제 -->
	                 
	                    <li class="nav-label first">포인트구매</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                    💸 Point </span></a>
	                        <ul aria-expanded="false">	                        
	                            <li><a href="/dabomweb/payment/purchase-point">포인트결제</a></li>
	                 	        <li><a href="/dabomweb/payment/use-point">포인트사용</a></li>                    
	                        </ul>
	                    </li>
	                    
	                    <!-- / 결제 -->
                
                
                
                    <br>
                    <c:choose>
                    <c:when test="${empty loginuser }">
	                    <a href="/dabomweb/account/login" aria-expanded="false">
	                    <span class="nav-text">로그인</span></a>
	                    
	                      <a href="/dabomweb/account/register" aria-expanded="false">
	                    <span class="nav-text">회원가입</span></a>
	                    
	                      <a href="/dabomweb/account/findId" aria-expanded="false">
	                    <span class="nav-text">비밀번호 찾기</span></a>
	                 </c:when>
	                 <c:otherwise>   
	                     <a href="/dabomweb/account/logout" aria-expanded="false">
	                    <span class="nav-text">로그아웃</span></a>
	                 </c:otherwise>
	                </c:choose>
                
                </ul>
            
            
            </div>
            
            <script type="text/javascript">
            window.addEventListener("load", function(event) {
            	$.ajax({
            		"url": "/dabomweb/sidebar/accept-request-count",
            		"method": "get",
            		"success": function(result, status, xhr) {
            			$("#accept-request-count").text(result);
            		},
            		"error": function(xhr, status, err) {
            			consloe.log("accept request count error");
            		}
            	});
            });
            </script>


        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->