<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<div class="card d-flex align-items-center justify-content-center">
			<c:forEach var="community" items="${ myChannelCommunity }">
			
				<tr id="tr${ community.community_No }">
					<hr><br>
			
					<!-- 댓글 보이는 부분 -->
				
					<c:if test="${ loginuser.memberId != community.member_Id }">  
	        		<div id='communityview${ community.community_No }'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        				<span class="badge bg-label-warning">&nbsp;${ community.writeDate }&nbsp;</span> &nbsp;        					
	                    		<br /><br />
		                    	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    		${ community.content }
		                   		 </span>
		                   		 <br /><br />	
		              		                  
               		    <div style="text-align: right">                    	                    
			                <div style='display:${ loginuser.memberId eq community.member_Id ? "block" : "none" }'>
		                    	
		                    	<a class="badge bg-label-primary editcommunity"
		                    	   type="button"
		                    	   data-communityno='${ community.community_No }' 
		                    	   href="javascript:"		                    	   
		                    	   >편집</a>
		                    		&nbsp;
		                    	<a class="badge bg-label-primary deletecommunity"
		                    	   type="button"
		                    	   href="javascript:"
		                    	   data-communityno="${ community.community_No }"
		                    	   >삭제</a>
		                    	   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    </div>
		                    </div>	                   
		                </div>
	               	
		                
	                <!-- /댓글 보이는 부분 -->
	                
	                
	                <!-- 댓글 수정시 보이는 부분 -->
	                 <form id="updateform${ community.community_No }">
	                	<div id='communityedit${ community.community_No }' style="display: none">
	                	${ community.member_Id } &nbsp;(${ community.writeDate })<br>	
						
						<textarea name="content" 
								  style="width: 500px" 
								  rows="3" 
								  maxlength="200"
								  >${ community.content }
						</textarea>
						
						<input type="hidden" name="community_no" value="${ community.community_No }" />
						<div style="text-align: right">   
							
							<a class="badge bg-label-primary updatecommunity" 
							   type=" button"
							   data-communityno="${ community.community_No }"
							   href="javascript:" 							   
							   >수정</a> 
								&nbsp; 
							
							<a class="badge bg-label-primary cancel"
							   type=" button"
							   data-communityno="${ community.community_No }"
							   href="javascript:" 
							   >취소</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					   
						</div> 
					</form>	
					 </c:if>
					<!-- /댓글 수정시 보이는 부분 -->    				
					
					 <c:if test="${ loginuser.memberId != community.member_Id }">  
		                 <div id='communityview${ community.community_No }'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        				<span class="badge bg-label-warning">&nbsp;${ community.member_Id }&nbsp;</span> 
	        				<button type="button" class="btn btn-danger">글쓴이</button>&nbsp;
	        					(${ community.writeDate })
	                    		<br /><br />
		                    	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    		${ community.content }
		                   		 </span>
		                   		 <br /><br />	
		                   		 
		                   		 <div style="text-align: right">                    	                    
			                <div style='display:${ loginuser.memberId eq community.member_Id ? "block" : "none" }'>
		                    	
		                    	<a class="badge bg-label-primary editcommunity"
		                    	   type="button"
		                    	   data-communityno='${ community.community_No }' 
		                    	   href="javascript:"		                    	   
		                    	   >편집</a>
		                    		&nbsp;
		                    	<a class="badge bg-label-primary deletecommunity"
		                    	   type="button"
		                    	   href="javascript:"
		                    	   data-communityno="${ community.community_No }"
		                    	   >삭제</a>
		                    	   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    </div>
		                    </div>	                   
		                </div>
		                
	                 <form id="updateform${ community.community_No }">
	                	<div id='communityedit${ community.community_No }' style="display: none">
	                	${ community.member_Id } &nbsp;(${ community.writeDate })<br>	
						
						<textarea name="content" 
								  style="width: 500px" 
								  rows="3" 
								  maxlength="200"
								  >${ community.content }
						</textarea>
						
						<input type="hidden" name="community_no" value="${ community.community_No }" />
						<div style="text-align: right">   
							
							<a class="badge bg-label-primary updatecommunity" 
							   type=" button"
							   data-communityno="${ community.community_No }"
							   href="javascript:" 							   
							   >수정</a> 
								&nbsp; 
							
							<a class="badge bg-label-primary cancel"
							   type=" button"
							   data-communityno="${ community.community_No }"
							   href="javascript:" 
							   >취소</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					   
						</div> 
					</form>	
	                 </c:if>
		                   
		
	        	</tr>	        	
   			</c:forEach>
    	</div>
 
  
    
   
    
            
