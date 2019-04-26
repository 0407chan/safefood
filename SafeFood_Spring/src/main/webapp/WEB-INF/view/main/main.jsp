<%@page import="com.ssafy.model.dto.Member"%>
<%@page import="com.ssafy.model.dto.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%	List<Food> fs = (List<Food>) request.getAttribute("foods");
	Member cus = (Member) session.getAttribute("user"); %>

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
				<form method="post" action="Search.do">
					<select name="search">
						<option value="whole">전체</option>
						<option value="name">제품명</option>
						<option value="maker">제조사</option>
						<option value="material">재료</option>
					</select> <input type="text" name="searchFD"> 
					<input type="submit" name="searchButton" value="검색">
				</form>
			</div>
		</div>
	</div>
	<section>
		<table class="resultTable">
			<h4>${msg}</h4>
			<%
				for (int i = 0; i < fs.size(); i++) {
			%>
			<tr>
				<td class='book-img'><img width="100" alt="img"
					src="<%=fs.get(i).getImg()%>"></td>
				<td class='book-name'>
					<div>
						<h4>
						<a href="foodInfo.do?food=<%=fs.get(i).getCode()%>"><%=fs.get(i).getName()%></a>
						</h4>
						<a href="foodInfo.do?food=<%=fs.get(i).getCode()%>"> <%=fs.get(i).getMaterial()%></a>
						<div>
							<input type="button" value="추가"> <input type="button"
								value="찜">
						</div>
					</div>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
