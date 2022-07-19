<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
			<c:forEach var="comment" items="${ vComments }">
			<tr id="tr${ vComment.commentNo }">
				<td style="text-align:left;margin:5px;border-bottom: solid 1px;padding-left:${comment.depth * 20}px">
	        		
	        		<div id='commentView${ vComment.commentNo }'>
	        			${ vComment.memberId } &nbsp;&nbsp;
	        			[${ vComment.writeDate }]
	                    <br /><br />
	                    <span>
	                    ${ comment.content }
	                    </span>
	                    <br /><br />
	                    <div style='display:${ loginuser.memberId eq comment.writer ? "block" : "none" }'>
	                    	<a class="editcomment" data-commentno='${ vComment.commentNo }' href="javascript:">편집</a>
	                    	&nbsp;
	                    	<a class="deletecomment"
	                    	   href="javascript:"
	                    	   data-commentno="${ vComment.commentNo }">삭제</a>
	                    </div>	                    
	                </div>
	                
	                <div id='commentedit${ vComment.commentNo }' style="display: none">
	                	${ vComment.memberId } &nbsp;&nbsp;
	        			[${ vComment.writeDate }]
						<br /><br />
						<form id="updateform${ vComment.commentNo }">
						<input type="hidden" name="commentNo" value="${ vComment.commentNo }" />
						<textarea name="content" style="width: 800px" rows="3" 
							maxlength="200">${ vComment.comment }</textarea>
						</form>
						<br />
						<div>
							<a class="updatecomment" href="javascript:" data-commentno="${ vComment.commentNo }">수정</a> 
							&nbsp; 
							<a class="cancel" data-commentno="${ vComment.commentNo }" href="javascript:">취소</a>
						</div>
					</div>
		
				</td>
        	</tr>
        	</c:forEach>