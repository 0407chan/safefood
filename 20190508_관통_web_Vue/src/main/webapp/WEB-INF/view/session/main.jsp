<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#description {
	width: 100%;
}
</style>
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
</head>
<body>
	<h1>도서 관리</h1>
	<button id="blist">목록조회</button>
	(상세 내용을 조회하기 위해서 목록의 아이템을 클릭하세요.)
	<ul id="list">
	</ul>
	<button id="badd">추가</button>
	<button id="bmod">수정</button>
	<button id="bdel">삭제</button>
	<br>
	<br>
	<form id="bookform">
		<div id="book">
			<label for="isbn" class="input_label">ISBN</label>
			<input type="text" name="isbn" id="isbn">
			<br>
			<label for="title" class="input_label">제목</label>
			<input type="text" name="title" id="title">
			<br>
			<label for="author" class="input_label">저자</label>
			<input type="text" name="author" id="author">
			<br>
			<label for="publisher" class="input_label">출판사</label>
			<input type="text" name="publisher" id="publisher">
			<br>
			<textarea rows="5" cols="10" name="description" id="description" placeholder="내용"></textarea>
		</div>

	</form>
	<div id="result"></div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	$("#blist").on("click", function() {
		$.ajax({
			url : "./book",
			type : "get",
			success : function(json) {
				if (json.status == "SUCCESS") {
					updateList(json.data);
					printResult("조회성공");
				} else {
					printResult(json.msg);
				}
			},
			error : errorHandler
		});
	});
	$("#blist").trigger("click");

	$("#badd").on("click", function() {
		$.ajax({
			url : "./book",
			data : JSON.stringify(getFormData()),
			contentType : "application/json;charset=utf-8",
			type : "post",
			success : function(json) {
				if (json.status == "SUCCESS") {
					updateList(json.data);
					printResult("추가성공");
				} else {
					printResult(json.msg);
				}
			},
			error : errorHandler
		});
	});

	$("#list").on("click", "li", function() {
		$.ajax({
			url : "./book/" + this.innerHTML,
			type : "get",
			success : function(json) {
				if (json.status == "SUCCESS") {
					let book = json.data;
					$("#isbn").val(book.isbn);
					$("#title").val(book.title);
					$("#author").val(book.author);
					$("#publisher").val(book.publisher);
					$("#description").val(book.description);
					$("#result").html("조회성공");
				} else {
					printResult(json.msg);
				}
			},
			error : errorHandler
		});
	});
	function getFormData() {
		let data = {};
		data.isbn = $("#isbn").val();
		data.title = $("#title").val();
		data.author = $("#author").val();
		data.publisher = $("#publisher").val();
		data.description = $("#description").val();
		return data;
	}
	$("#bmod").on("click", function() {
		$.ajax({
			url : "./book/" + $("#isbn").val(),
			data : JSON.stringify(getFormData()),
			contentType : "application/json;charset=utf-8",
			type : "put",
			success : function(json) {
				if (json.status == "SUCCESS") {
					updateList(json.data);
					printResult("수정성공");
				} else {
					printResult(json.msg);
				}
			},
			error : errorHandler
		});
	});

	$("#bdel").on("click", function() {
		$.ajax({
			url : "./book/" + $("#isbn").val(),
			type : "delete",
			success : function(json) {
				if (json.status == "SUCCESS") {
					updateList(json.data);
					printResult("삭제성공");
				} else {
					printResult(json.msg);
				}
			},
			error : errorHandler
		});
	});

	function updateList(books) {
		$("#list").empty();
		$.each(books, function(idx, item) {
			$("#list").append("<li>" + item.isbn);
		});
	}

	function errorHandler() {
		alert("요청 실패");
	}
	function printResult(msg) {
		$("#result").html(msg);
		$("#isbn").val("");
		$("#title").val("");
		$("#author").val("");
		$("#publisher").val("");
		$("#description").val("");
	}
</script>
</html>