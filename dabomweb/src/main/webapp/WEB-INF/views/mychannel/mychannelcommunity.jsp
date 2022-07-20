<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<% pageContext.setAttribute("replaceChar", "\n"); %>
		
		
		
		<c:forEach var="community" items="${ myChannelCommunity }">
			<tr>
				<td width="85%;" style="font-size: 13pt; color: black; left-margin:20%;">
				&nbsp;&nbsp;					
					<button type="button" class="btn btn-rounded btn-warning" disabled="disabled">
					${ community.member_Id }</button>
				</td>
				<td><fmt:formatDate pattern="yy-MM-dd hh:mm"
						value="${ community.writeDate }" />
				</td>
			</tr>			
			<tr>					
				<td colspan="2" style="font-size: 12pt; color: black;">
					<div style="margin: 20px 30px 20px 30px;"> 					
						${fn:replace(community.content, replaceChar, "<br/>")}
					</div><hr>	
				</td>													
			</tr>
			<hr>		
		</c:forEach>
