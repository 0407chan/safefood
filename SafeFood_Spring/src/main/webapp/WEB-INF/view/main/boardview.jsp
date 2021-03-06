<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<c:url value="/static/css/bootstarp.min.css" var="css" />
<link href="${css}" rel="stylesheet">
<style type="text/css">
a:link, a:visited {
	text-decoration: none;
	color: #656565;
}

.board_view {
	margin:0 auto;
	text-align: center;
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
	display: inline-block;
	background-color: #6b9ab8;
	border: 1px solid #56819d;
	vertical-align: middle
}
#frm{
	margin:0 auto;
	text-align: center;
}
table{
	text-align: center;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<c:url value="/static/" var="loc" />
	<c:url value="/board/delete" var="boarddelete"/>
	<c:url value="/boardUI" var="boardUI"/>
	<c:url value="/board/update" var="boardupdate"/>
	
	<jsp:include page="../include/header.jsp" flush="false" />
	
		<form id="frm" method="post" action="${boardupdate}">
			<table class="board_view">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
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
						<td colspan="4" class="view_text"><textarea rows="15"	cols="100" title="내용" id="content" name="content">${board.content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<a href="${boardUI}" class="btn btn-default" id="list">목록으로</a>
			<c:if test="${sessionScope.user.id=='admin'}">
				<a href="${boarddelete}?idx=${board.idx}" class="btn btn-default" id="delete">삭제하기</a>
				<input type="submit" id="update" value="저장하기" class="btn btn-default">
			</c:if>
		</form>
		
	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
