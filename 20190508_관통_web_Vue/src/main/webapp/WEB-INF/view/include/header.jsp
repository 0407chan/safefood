<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/static/css/common.css" var="commoncss" />
<link rel="stylesheet" href="${commoncss }">
<title>SSAFY</title>
<h1 class="title">Welcome To SSAFY</h1>

<div class="right">
	<c:url value="/session/modify" var="modify" />
	<c:if test="${!empty loginUser }">
		<a href="${modify }">[${loginUser.name }]</a>
	&nbsp;
	<c:url value="/session/logout" var="logout" />
		<a href="${logout }">[로그아웃]</a>
	</c:if>
</div>
<hr>
<script>
	let alarm = "${alarm}";
	if (alarm) {
		alert(alarm);
	}
</script>
