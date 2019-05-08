<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
</head>
<body>
	<h1 class="title">회원 정보 수정</h1>
	<div>
		<c:url value="/session/modify" var="modify" />
		<form action="${modify }" method="post">
			<label for="userId" class="input_label">아이디</label>
			<input type="text" name="userId" value="${loginUser.userId }" readonly="readonly">
			<br>
			<label for="password" class="input_label">비밀번호</label>
			<input type="password" name="password" value="${loginUser.password }">
			<br>
			<label for="name" class="input_label">이름</label>
			<input type="text" name="name" value="${loginUser.name }">
			<br>
			<input type="submit" value="변경">
		</form>
	</div>
</body>
</html>