<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<div class="card d-flex align-items-center justify-content-center">
			<c:forEach var="community" items="${ myChannelCommunity }">
			<tr>
				<th>${community.content}
				</th>
					<th>${community.content}
				</th>
					<th>${community.content}
				</th>
			</tr>
	       	        	
   			</c:forEach>
    	</div>
 
  
    
   
    
            
