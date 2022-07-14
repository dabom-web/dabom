<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
     <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="/dabomweb/home" class="brand-logo">
                <img class="logo-abbr" src="/dabomweb/resources/images/logo.jpg" alt="">
                <img class="logo-compact" src="/dabomweb/resources/images/dabom.jpg" alt="">
                <img class="brand-title" src="/dabomweb/resources/images/logo-text.jpg" alt="">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->
    
    
        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="search_bar dropdown">
                                <span class="search_icon p-3 c-pointer" data-toggle="dropdown">
                                    <i class="mdi mdi-magnify"></i>
                                </span>
                                <div class="dropdown-menu p-0 m-0">
                                    <form>
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                                    </form>
                                </div>
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">                        	
                            <li class="nav-item dropdown notification_dropdown">                             	                        
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">                             
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>                                
                                <div class="dropdown-menu dropdown-menu-right">
                                    
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="resources/app-profile.html" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    
                                    <c:choose>
                                    <c:when test="${ !empty loginuser.memberId }">                                    
                                    <a href="/dabomweb/message/message_receive_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId}" class="dropdown-item">
                                        <i class="icon-envelope-open"></i>
                                        <span class="ml-2">Message </span>
                                    </a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="/dabomweb/account/login" class="dropdown-item">
                                        <i class="icon-envelope-open"></i>
                                        <span class="ml-2">Message </span>
                                    </a>
                                    </c:otherwise>
                                    </c:choose>   
                                    
                                    <a href="resources/page-login.html" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->