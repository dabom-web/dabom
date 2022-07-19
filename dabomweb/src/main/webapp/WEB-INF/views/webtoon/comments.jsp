<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
		
		 	<c:forEach var="comment" items="${ comments }">
			<tr id="tr${ comment.commentNo }">
				<td style="text-align:left;margin:5px;border-bottom: solid 1px;">
	        		
	        		<div id='commentview${ comment.commentNo }'>
	        			<br>
	        			${ comment.writer } &nbsp;&nbsp;
	        			[${ comment.regDate }]
	                    <br /><br />
	                    <span>
	                    ${ comment.content }
	                    </span>
	                    <br><br>
	                    <span style='display:${ loginuser.memberId eq comment.writer ? "" : "none" }'>
	                    	<a class="editcomment" data-commentno='${ comment.commentNo }' href="javascript:">편집</a>
	                    	&nbsp;
	                    	<a class="deletecomment"
	                    	   href="javascript:"
	                    	   data-commentno="${ comment.commentNo }">삭제</a>
	                    	&nbsp;
	                    </span>
	                    	<a class="recomment"
                    	   href="javascript:"
                    	   data-commentno="${ comment.commentNo }">댓글쓰기</a>
                    	<br><br>
	                    	                    
	                </div>
	                </c:forEach> 