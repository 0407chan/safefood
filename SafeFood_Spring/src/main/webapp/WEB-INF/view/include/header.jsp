<%@page import="com.ssafy.model.dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<% Member cus = (Member) session.getAttribute("user"); %>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="styles.css">
<style type="text/css">
#searchInputField {
	width: 200px;
}
#cssmenu,
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul li a {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  line-height: 1;
  display: block;
  position: relative;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
#cssmenu:after,
#cssmenu > ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
#cssmenu {
  width: auto;
  font-family: Raleway, sans-serif;
  line-height: 1;
}
#cssmenu > ul > li {
  float: left;
}
#cssmenu.align-center > ul {
  font-size: 0;
  text-align: center;
}
#cssmenu.align-center > ul > li {
  display: inline-block;
  float: none;
}
#cssmenu.align-right > ul > li {
  float: right;
}
#cssmenu.align-right > ul > li > a {
  margin-right: 0;
  margin-left: -4px;
}
#cssmenu > ul > li > a {
  z-index: 2;
  padding: 18px 25px 12px 25px;
  font-size: 15px;
  font-weight: 400;
  text-decoration: none;
  color: #ffffff;
  -webkit-transition: all .2s ease;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  margin-right: -4px;
}
#cssmenu > ul > li:hover > a,
#cssmenu > ul > li > a:hover {
  color: #444444;
}
#cssmenu > ul > li > a:after {
  position: absolute;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: -1;
  width: 100%;
  height: 120%;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
  content: "";
  -webkit-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-transform: perspective(5px) rotateX(2deg);
  -webkit-transform-origin: bottom;
  -moz-transform: perspective(5px) rotateX(2deg);
  -moz-transform-origin: bottom;
  transform: perspective(5px) rotateX(2deg);
  transform-origin: bottom;
}

#mainbar {
	background-image: url("img/background.png");
	width:100%;
}
#search {
	text-align: center;
	color : black;
}
#searchBox{
	width: 200px;
}

#signButton{
}

</style>
</head>
<c:url value="/member/memberInfo" var="memberinfo"/>
<c:url value="/member/memberInsert" var="memberinsert"/>
<c:url value="/login/login" var="login"/>
<c:url value="/login/logout" var="logout"/>

<body>
	<div id='signButton'>
		<c:if test="<%= cus!= null %>">
			<button>
				<a href="${memberinfo}">회원정보</a>
			</button>
			<button>
				<a href="${logout}">Logout</a>
			</button>
		</c:if>
		<c:if test="<%= cus== null %>">
			<button>
				<a href="${memberinsert}">Sign up</a>
			</button>
			<button>
				<a href="${login}">Login</a>
			</button>
		</c:if>
	</div>
	<div id='cssmenu'>
		<ul>
			<li><a href='#'>공지사항</a></li>
			<li><a href='main.do'>상품 정보</a></li>
			<li><a href=''>베스트 섭취 정보</a></li>
			<c:if test="${sessionScope.user!=null }">
				<li><a href=''>내 섭취 정보</a></li>
				<li><a href=''>예상 섭취 정보</a></li>
			</c:if>
		</ul>
	</div>
</body>