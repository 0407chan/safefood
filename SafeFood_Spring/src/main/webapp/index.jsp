<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>제품 확인 기본 화면</h1>
<c:url value="/main" var="main"/>
<script type="text/javascript">
	location.href = "${main}";
</script>
</body>
</html>