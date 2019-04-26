<%@page import="com.ssafy.model.dto.Member"%>
<%@page import="com.ssafy.model.dto.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="styles.css">
<style type="text/css">
#searchInputField {
	width: 200px;
}

#search {
	text-align: center;
	color : black;
}

#searchs {
	text-align: center;
	color : white;
}
#searchBox{
	width: 200px;
}
</style>
</head>
<body>
	<div id="mainbar">
		<jsp:include page="../include/header.jsp" flush="false" />

		<div id="search">
			<div id="searchs">
				<h1>WHAT WE PROVIDE</h1>
				<h3>건강한 삶을 위한 먹거리 프로젝트</h3>
			</div>
			<div class='center-block' id="searchBox">
				<c:url value="/book/search" var="search"/>
					<form action="${search}" method="post">
						<input type="hidden" name="action" value="SEARCH"> 
						<select name="searchField" id="searchField">
							<option value="whole">전체</option>
							<option value="name">제품명</option>
							<option value="maker">제조사</option>
							<option value="material">재료</option>
						</select> 
						<input type="text" id="searchText" name="searchText"> 
						<input type="submit" value="검색">
					</form>
			</div>
		</div>
	</div>
	<section>
		<table class="resultTable">
			<tr>
				<td>이미지</td>
				<td>음식 이름</td>
				<td>재료</td>
			</tr>
			<c:choose>
				<c:when test="${empty foods}">
					<tr>
						<td colspan="3">입력된 음식 정보가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${foods}" var="f">
						<tr>
							<td>${f.img}</td>
							<td>
								<c:url value="/food/foodview" var="view" />
								<a href="${view}?code=${f.code}">${f.title}</a>
							</td>
							<td>${f.material}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
