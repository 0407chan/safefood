<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">

section {
	text-align: center;
}

#search {
	text-align: center;
}

.signUpBoxItem {
	display: inline-block;
	text-align: left;
	width: 120px;
	fload: left;
	margin: 10px;
}

.signUpBox {
	background-color: gray;
	width: 500px;
}

.alergeCheck {
	background-color: red;
	width: 200px;
	border: 2px soild;
}

#signUp {
	background-color: gray;
	width: 500px;
	padding: 20px;
}

#signUpBoxBorder {
	border: 1px solid;
	width: 200px;
	padding: 10px;
}

#signUpBoxBorderCheck {
	background-color: gray;
	margin-top: -20px;
	width: 40px;
}

#logInBox {
	background-color: gray;
	width: 500px;
	padding: 20px;
	margin-top: 20px;
}

.LogInBoxItem {
	display: inline-block;
	text-align: left;
	width: 120px;
	fload: left;
	margin: 10px;
}

#loginText {
	text-align: center;
	color: white;
}

#mainbar {
	width: 100%;
}

#searchs {
	color: white;
	text-align: center;
}
td {
	text-align: center;
	width: 150px;
}
footer{ position:fixed; 
  left:0px; 
  bottom:0px; 
  height:100px; 
  width:100%; 
  background:grey; 
  color: white; 
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	
	<div id="mainbar" style="background-image: url(${plz});">
		<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
			<h1>내 섭취 정보</h1>
		</div>
		<div class='center-block' id="searchBox">
			<c:url value="/atefood/search" var="search"/>
				<form action="${search}" method="post">
					<input type="hidden" name="action" value="SEARCH"> 
					<select name="searchField" id="searchField">
						<option value="whole">전체</option>
						<option value="today">오늘</option>
						<option value="day">일</option>
						<option value="month">월</option>
						<option value="year">년</option>
					</select> 
					<input type="text" id="searchText" name="searchText"> 
					<input type="submit" value="검색">
				</form>
		</div>
	</div>
	<section>
		<table class="resultTable">
			<tr>
				<td>이미지</td>
				<td>음식 이름</td>
				<td>개수</td>
				<td>일자</td>
			</tr>
				<c:forEach items="${foods}" var="f">
					<tr>
						<c:url value="/static/" var="loc"/>
						<td><img width="150" alt="img" src="${loc}${f.img}"></td>
						<td>
							<c:url value="/food/foodview" var="view" />
							<a href="${view}?code=${f.code}">${f.name}</a>
						</td>
						<td>${f.num}개</td>
						<td>${f.date}</td>
					</tr>
				</c:forEach>
		</table>
	</section>


	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
