<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ssafy.model.dto.Member"%>
<%@page import="java.util.List"%>
<% Member cus = (Member) session.getAttribute("user"); %>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:url value="/static/css/bootstrap.min.css" var="css" />
<link href="${css}" rel="stylesheet" />

<style type="text/css">
.navbar-new-top ul{
    margin-right: 9%;
}
.navbar-new-top ul li{
    margin-right: 8%;
}
.navbar-new-bottom{
    background-color: #ffffff;
    box-shadow: 0 5px 6px -2px rgba(0,0,0,.3);
    border-top: 1px solid #e0e0e0;
    height: 40px;
}
.navbar-new-bottom ul li{
    margin-left: 2%;
    margin-right: 2%;
}
.navbar-nav .nav-item a {
    color: #333;
    font-size: 14px;
    font-weight: 600;
    transition: 1s ease;
}
.navbar-nav .nav-item a:hover{
    color: #0062cc;
}
.dropdown-menu.show{
    background: #f8f9fa;
    border-radius: 0;
}
</style>
</head>

<c:url value="/member/memberInfo" var="memberinfo" />
<c:url value="/member/memberInsert" var="memberinsert" />
<c:url value="/login/login" var="login" />
<c:url value="/login/logout" var="logout" />
<c:url value="/board" var="board" />
<c:url value="/main" var="main" />
<c:url value="/atefoodform" var="atefoodform" />
<c:url value="/bestFoodForm" var="bestFoodForm" />
<c:url value="/qna" var="qna" />
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<div id="mainbar" style="background-image: url(${plz}); height : 100px">
		<nav class="navbar fixed-top navbar-expand-md flex-nowrap navbar-new-top">
            <ul class="nav navbar-nav mr-auto"></ul>
            <ul class="navbar-nav flex-row">
            	
            	<c:if test="<%= cus== null %>">
                <li class="nav-item">
                    <a href="${memberinsert}" class="nav-link px-2" style="color:white;">SignUp</a>
                </li>
                <li class="nav-item">
                    <a href="${login}" class="nav-link px-2" style="color:white;">LogIn</a>
                </li>
                </c:if>
                
                <c:if test="<%= cus!= null %>">
                 <li class="nav-item">
                    <a href="${memberinfo}" class="nav-link px-2" style="color:white;">Info</a>
                </li>
                <li class="nav-item">
                    <a href="${logout}" class="nav-link px-2" style="color:white;">LogOut</a>
                </li>
				</c:if>
			
			
            </ul>
            <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbar2">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
    </div>
        <nav class="navbar fixed-top navbar-expand-md navbar-new-bottom">
            <div class="navbar-collapse collapse pt-2 pt-md-0" id="navbar2">
                <ul class="navbar-nav w-100 justify-content-center px-3">
                    <li class="nav-item active">
                        <a class="nav-link" href="${board}">공지사항</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${main}">상품정보</a></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${bestFoodForms}">베스트 섭취 정보</a>
                    </li>
                    <c:if test="${sessionScope.user!=null }">
						<li class="nav-item">
							<a class="nav-link" href="${atefoodform}">내 섭취 정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href='#'>예상 섭취 정보</a>
						</li>
					</c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="${qna}">Q&A</a>
                    </li>
                </ul>
            </div>
        </nav>
 
</body>