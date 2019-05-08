<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
</head>
<body>
	<h1>서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.</h1>
	${info }
</body>
</html>