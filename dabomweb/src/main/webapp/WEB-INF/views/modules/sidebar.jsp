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
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-world-2"></i><span class="nav-text">Collect</span></a>
                        <ul aria-expanded="false">                        
                      		
                      		<li><a href="/dabomweb/collect/chart">채널차트</a></li>
                            <li><a href="/dabomweb/collect/newUpdateVideo">최근 업데이트 영상</a></li>                           
                            <li><a href="/dabomweb/collect/hotChannel">인기 채널</a></li>
                            <li><a href="/dabomweb/collect/subscribeChannel">구독 채널</a></li>
                            <li><a href="/dabomweb/collect/wishList">찜 목록</a></li>
                            <li><a href="/dabomweb/collect/supportDirector">응원 감독 영상</a></li> 
                            <li><a href="/dabomweb/collect/supportActor">응원 배우 영상</a></li>                                          
                       
                            
                        </ul>
                    </li>
                 <!-- 홈 -->
                
                 <!-- / 채널영역 -->
                 
                    <li class="nav-label first">채널영역</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">Channel</span></a>
                        <ul aria-expanded="false">
                        
                        	<!-- 추수은 -->
                            <li><a href="mychannel/mychannellist">개인채널</a></li>
                            <!-- 추수은 -->
                            
                            <!-- 강효준 -->
                            <li><a href="video/uploadList">영상업로드</a></li>
                            <li><a href="video/liveStream">라이브방송</a></li>
                            <!-- 강효준 -->
                            
                        </ul>
                    </li>
                    
                    <!-- / 채널영역 -->
                    
                    
                     <!-- / 관리자 페이지  -->
                 
                    <li class="nav-label first">사이트 관리</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">Management</span></a>
                        <ul aria-expanded="false">
                        
                        	<li><a href="resources/index2.html">문의메세지</a></li>
                            <li><a href="resources/index.html">회원계정관리</a></li>                           
                            <li><a href="resources/index2.html">채널관리</a></li>
                            <li><a href="resources/index2.html">게시글&댓글관리</a></li>
                            <li><a href="/dabomweb/administerPrivilege/accept">업로드승인</a></li>                        
                       
                            
                        </ul>
                    </li>
                    
                    <!-- / 관리자 페이지 -->
                    
                 <!-- / 웹툰 -->
                 
                    <li class="nav-label first">웹툰영역</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">Webtoon</span></a>
                        <ul aria-expanded="false">
                        
                            <li><a href="/dabomweb/webtoon/webtoonList">웹툰 보기</a></li>
          
                            
                        </ul>
                    </li>
                    
                    <!-- / 웹툰 -->
                
	                 <!-- / 영상팀소개 -->
	                 
	                    <li class="nav-label first">영상팀 정보</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
	                                class="icon icon-single-04"></i><span class="nav-text">Porducer</span></a>
	                        <ul aria-expanded="false">
	                        
	                            <li><a href="/dabomweb/produceBoard/director">감독</a></li>
	                 
	                            <li><a href="/dabomweb/produceBoard/actor">배우</a></li>
	                       
	                            
	                        </ul>
	                    </li>
	                    
	                    <!-- / 영상팀소개 -->
	                    
	                    <!-- / 결제 -->
	                 
	                    <li class="nav-label first">결제하기</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
	                                class="icon icon-single-04"></i><span class="nav-text">결제하기</span></a>
	                        <ul aria-expanded="false">
	                        
	                            <li><a href="/dabomweb/payment/payment">결제하기</a></li>
	                 	                            
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


        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->