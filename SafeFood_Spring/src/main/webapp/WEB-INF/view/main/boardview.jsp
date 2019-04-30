<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<c:url value="/static/css/bootstarp.min.css" var="css" />
<link href="${css}" rel="stylesheet">
<style type="text/css">
a:link, a:visited {
	text-decoration: none;
	color: #656565;
}

.board_list {
	width: 75%;
	text-align: center;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc
}

.board_list thead th:first-child {
	background-image: none
}

.board_list thead th {
	border-bottom: 1px solid #ccc;
	padding: 12px 0 13px 0;
	color: #3b3a3a;
	vertical-align: middle
}

.board_list tbody td {
	border-top: 1px solid #ccc;
	padding: 10px 0;
	text-align: center;
	vertical-align: middle
}

.board_list tbody tr:first-child td {
	border: none
}

.board_list tbody td.title {
	text-align: left;
	padding-left: 20px
}

.board_list tbody td a {
	display: inline-block
}

.board_view {
	width: 50%;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc
}

.board_view tbody th {
	text-align: left;
	background: #f7f7f7;
	color: #3b3a3a
}

.board_view tbody th.list_tit {
	font-size: 13px;
	color: #000;
	letter-spacing: 0.1px
}

.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {
	border-bottom: none
}

.board_view tbody th, .board_view tbody td {
	padding: 15px 0 16px 16px;
	border-bottom: 1px solid #ccc
}

.board_view tbody td.view_text {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 45px 18px 45px 18px
}

.board_view tbody th.th_file {
	padding: 0 0 0 15px;
	vertical-align: middle
}

.wdp_90 {
	width: 90%
}

.btn {
	border-radius: 3px;
	padding: 5px 11px;
	color: #fff !important;
	display: inline-block;
	background-color: #6b9ab8;
	border: 1px solid #56819d;
	vertical-align: middle
}

#searchInputField {
	width: 200px;
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

table{
	text-align: center;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<c:url value="/static/" var="loc" />
	<div id="mainbar" style="background-image: url(${plz}); height : 300px">
		<jsp:include page="../include/header.jsp" flush="false" />
		<div id="search">
			<div id="searchs">
				<h1>WHAT WE PROVIDE</h1>
				<h3>건강한 삶을 위한 먹거리 프로젝트</h3>
			</div>
		</div>
	</div>
	<c:url value="/board/update" var="boardupdate"/>
	<form id="frm" method="post" action="${boardupdate}">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${board.idx} <input type="hidden" id="idx" name="idx" value="${board.idx}">
					</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${board.create_id} <input type="hidden" id="create_id" name="create_id" value="${board.create_id}">
					</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" id="title" name="title"	class="wdp_90" value="${board.title}" /></td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"	cols="100" title="내용" id="content" name="content">${board.content}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<c:url value="/board/delete" var="boarddelete"/>
		<a href="${boarddelete}?idx=${board.idx}" class="btn" id="delete">삭제하기</a>
		<c:url value="/board" var="board"/>
		<a href="${board}" class="btn" id="list">목록으로</a>
		<input type="submit" class="btn" id="update" value="저장하기">
	</form>

</body>


<footer>
	<jsp:include page="../include/footer.jsp" flush="false" />
</footer>
</body>
