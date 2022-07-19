<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="mail-list mt-4">
			<a href="/dabomweb/contact-message/sendContact" class="list-group-item active"> 
				<i class="fa fa-inbox font-18 align-middle mr-2"></i> 
				메세지 작성하기 
				<span class="badge badge-primary badge-sm float-right"></span>
			</a>
			
			 <a href="/dabomweb/contact-message/sendContactList" class="list-group-item"> 
				 <i class="fa fa-paper-plane font-18 align-middle mr-2"></i>
				  보낸 메세지함
			 </a> 
			
			<a href="/dabomweb/contact-message/contactMessage"class="list-group-item">
				<i class="fa fa-star font-18 align-middle mr-2"></i>
				문의 메세지함 
				<span class="badge badge-danger text-white badge-sm float-right">${ count }</span>
			</a> 
			
			<a href="/dabomweb/contact-message/readContact" class="list-group-item">
				<i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>
				읽은메세지함
			</a> 
			
			<a href="/dabomweb/contact-message/deletedContactList" class="list-group-item">
				<i class="fa fa-trash font-18 align-middle mr-2"></i>
				삭제한 메세지
			</a>
	</div>