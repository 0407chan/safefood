<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
</head>
<body>
	<h1 class='title'>회원가입</h1>
	<div>
		<c:url value="/join" var="join" />
		<form action="${join }" method="post">
			<label for="userId" class="input_label">아이디</label>
			<input type="text" name="userId" >
			<br>
			<label for="password" class="input_label">비밀번호</label>
			<input type="password" name="password">
			<br>
			<label for="name" class="input_label">이름</label>
			<input type="text" name="name" >
			<br>
			<input type="submit" value="가입">
		</form>
	</div>
</body>
</html>