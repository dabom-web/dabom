<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
  <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav" >
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                
                <!-- ν -->
                <li class="nav-label first">DA!BOM Home</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                   
                    <span class="nav-text">πΊ Channel</span></a>
                        <ul aria-expanded="false">  
                            <li><a href="#">λΌμ΄λΈλ°©μ‘</a></li>                      
                      		<li><a href="/dabomweb/collect/chart">μ±λμ°¨νΈ</a></li>
                            <li><a href="/dabomweb/collect/newUpdateVideo">μ΅κ·Ό μλ°μ΄νΈ μμ</a></li>                           
                            <li><a href="/dabomweb/collect/hotChannel">μΈκΈ° μ±λ</a></li>
                        </ul>
                    </li>
                 
                   <!--  <li class="nav-label first">νμ</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <span class="nav-text">π Collect</span></a>
                        <ul aria-expanded="false">
                        	 <li><a href="/dabomweb/collect/subscribeChannel">κ΅¬λ μ±λ</a></li>
                            <li><a href="/dabomweb/collect/wishList">μ° λͺ©λ‘</a></li>
                            <li><a href="/dabomweb/collect/supportDirector">μμ κ°λ μμ</a></li> 
                            <li><a href="/dabomweb/collect/supportActor">μμ λ°°μ° μμ</a></li>       
                            
                        </ul>
                    </li> -->
                    
                     
                 <c:choose>
	                 <c:when test="${ loginuser.type eq 'admin' }">
	                 <!-- / κ΄λ¦¬μ νμ΄μ§  -->
	                 <li class="nav-label first">μ¬μ΄νΈ κ΄λ¦¬</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                    <span class="nav-text">π₯ Management</span></a>
	                        <ul aria-expanded="false">                        
	                        	<li><a href="/dabomweb/contact-message/contactMessage">λ¬Έμλ©μΈμ§</a></li>
	                        	<li><a href="/dabomweb/administerPrivilege/site-revenue">μ¬μ΄νΈ μμ΅κ΄λ¦¬</a></li>
	                            <li><a href="/dabomweb/administerPrivilege/member-management">νμκ³μ κ΄λ¦¬</a></li>                           
	                            <li><a href="/dabomweb/administerPrivilege/channel-management">μ±λκ΄λ¦¬</a></li>
	                            <li><a href="/dabomweb/administerPrivilege/board-and-comment-management">κ²μκΈ&λκΈκ΄λ¦¬</a></li>
	                            <li><a href="/dabomweb/administerPrivilege/accept">μλ‘λμΉμΈ new(<span id="accept-request-count">${ count }</span>)</a></li>                        
	                        </ul>
	                    </li>
	                    <!-- / κ΄λ¦¬μ νμ΄μ§ -->
	                 </c:when>                 
					 <c:otherwise>                    
	                 </c:otherwise>
                 </c:choose>
                    
                    
                 <!-- / μΉν° -->
                 
                    <li class="nav-label first">μΉν°</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <span class="nav-text">π» Webtoon</span></a>
                        <ul aria-expanded="false">
                        
                            <li><a href="/dabomweb/webtoon/webtoonList">μΉν° λ³΄κΈ°</a></li>
          
                            
                        </ul>
                    </li>
                    
                    <!-- / μΉν° -->
                
	                 <!-- / μμνμκ° -->
	                 
	                    <li class="nav-label first">μμν μ λ³΄</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                       βπ©βπ§βπ¦ Porducer</span></a>
	                        <ul aria-expanded="false">
	                        
	                            <li><a href="/dabomweb/produceBoard/director">κ°λ</a></li>
	                 
	                            <li><a href="/dabomweb/produceBoard/actor">λ°°μ°</a></li>
	                       
	                            
	                        </ul>
	                    </li>
	                    
	                    <!-- / μμνμκ° -->
	                    
	                    <!-- / κ²°μ  -->
	                 
	                    <li class="nav-label first">ν¬μΈνΈκ΅¬λ§€</li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                    πΈ Point </span></a>
	                        <ul aria-expanded="false">	                        
	                            <li><a href="/dabomweb/payment/purchase-point">ν¬μΈνΈκ²°μ </a></li>
	                 	        <li><a href="/dabomweb/payment/use-point">ν¬μΈνΈμ¬μ©</a></li>                    
	                        </ul>
	                    </li>
	                    
	                    <!-- / κ²°μ  -->
                
                
                
                    <br>
                    <c:choose>
                    <c:when test="${empty loginuser }">
	                    <a href="/dabomweb/account/login" aria-expanded="false">
	                    <span class="nav-text">λ‘κ·ΈμΈ</span></a>
	                    
	                      <a href="/dabomweb/account/register" aria-expanded="false">
	                    <span class="nav-text">νμκ°μ</span></a>
	                    
	                      <a href="/dabomweb/account/findId" aria-expanded="false">
	                    <span class="nav-text">λΉλ°λ²νΈ μ°ΎκΈ°</span></a>
	                 </c:when>
	                 <c:otherwise>   
	                     <a href="/dabomweb/account/logout" aria-expanded="false">
	                    <span class="nav-text">λ‘κ·Έμμ</span></a>
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