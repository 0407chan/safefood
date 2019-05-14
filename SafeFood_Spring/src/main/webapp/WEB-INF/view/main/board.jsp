<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:url value="/static/css/bootstarp.min.css" var="css" />
<link href="${css}" rel="stylesheet">
<style type="text/css">
a:link, a:visited {
	text-decoration: none;
	color: #656565;
}
#gonji{
	width : 1200px;
	margin : 0 auto;
	text-align: center;
}
.table{
	text-align: center;
}

th{
	text-align: center;
}
#add_btn{
	margin : 0 auto;
	text-align: center;
}
#search {
	text-align: center;
	color: black;
}

#searchs {
	text-align: center;
	color: white;
}
#searchBox {
	width: 200px;
}

#mainbar {
	width: 100%;
	height: 500px;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<c:url value="/static/" var="loc" />
	<jsp:include page="../include/header.jsp" flush="false" />
	<div id= "gonji">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:url value="/board/view" var="boardview" />
				<c:choose>
					<c:when test="${fn:length(boards) > 0}">
						<c:forEach items="${boards}" var="board">
							<tr>
								<td>${board.idx}</td>
								<td class="title"><a href="${boardview}?idx=${board.idx}" name="title">${board.title}</a> <input type="hidden" id="IDX"	value="${row.IDX }"></td>
								<td>${board.create_id}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		</div>
	<c:url value="/board/insert" var="boardinsert" />
	<button id="add_btn">
		<a href="${boardinsert}">등록하기</a>
	</button>

	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
