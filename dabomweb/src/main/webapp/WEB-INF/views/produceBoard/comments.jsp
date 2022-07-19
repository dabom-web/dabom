<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<% pageContext.setAttribute("replaceChar", "\n"); %>
<c:forEach var="comment" items="${ commentList }">
	<tr style="font-size: 9pt; color: black; font-weight: bolder;">
		<td width="10%;">${ comment.writer }</td>
		<td width="50%">${fn:replace(comment.content, replaceChar, "<br/>")}</td>
		<td><fmt:formatDate pattern="yy-MM-dd hh:mm"
				value="${ comment.regdate }" /></td>
		<td width="10%"><a class="btn btn-light btn-xs b"
			id="comment-update-btn" href="javascript:"> 수정 </a></td>
		<td width="10%"><a class="btn btn-light btn-xs b"
			id="deleted-comment-btn" href="javascript:"> 삭제 </a></td>
	</tr>
</c:forEach>