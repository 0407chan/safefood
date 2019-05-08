<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
</head>
<body>
	<h1 class='title'>로그인</h1>
	<c:url var="login" value="/login"></c:url>
	<form method="post" action="${login }">
		<input type="text" name="userId" placeholder="아이디">
		<input type="password"  name="password" placeholder="비밀번호">
		<input type="submit">
	</form>
	<br>
	<c:url var="join" value="/join"></c:url>
	<a href="${join }">회원가입</a>
</body>
</html>