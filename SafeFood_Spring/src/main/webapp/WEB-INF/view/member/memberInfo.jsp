<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang=''>
<head>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="script.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">


header {
	background-image: url("img/banner.png");
	width: 100%;
	height: 150px;
}

section {
	text-align: center;
}

#search {
	text-align: center;
	color: white;
}

.signUpBoxItem {
	display: inline-block;
	text-align: left;
	width: 120px;
	fload: left;
	margin: 10px;
}

.signUpBox {
	background-color: gray;
	width: 500px;
}

.alergeCheck {
	background-color :red;
	width: 200px;
	border: 2px soild;
}

#signUp{
	background-color: gray;
	width: 500px;
	padding: 20px;
	margin-top: 20px;
	
}
#signUpBoxBorder{
	border: 1px solid;
	width: 200px;
	padding: 10px;
}
#signUpBoxBorderCheck{
	background-color: gray;
	margin-top: -20px;
	width: 40px;
}
#mainbar {
	background-image: url("img/background.png");
	width:100%;
}
#searchs{
	color: white;
	text-align: center;
}

</style>
</head>
<body>
<div id="mainbar">
	<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
			<h1>회원 정보</h1>
		</div>
	</div>
	<c:if test="${sessionScope.user==null }">
		<h1>로그인이 필요합니다</h1>
	</c:if>
	<c:if test="${sessionScope.user!=null }">
	<form method="post" action="memberModify.do">
		<section>
			<div class='center-block' id="signUp">
				<h3>회원정보</h3>
				<div>
					<span class="signUpBoxItem">아이디</span>  <input value="<c:out value="${sessionScope.user.id}" ></c:out>" name="id" readonly>
				</div>
				<div>
					<span class="signUpBoxItem">비밀번호</span>  <input value="<c:out value="${sessionScope.user.pw}" ></c:out>" name="pw">
				</div>
				<div>
					<span class="signUpBoxItem" >이름</span>   <input value="<c:out value="${sessionScope.user.name}" ></c:out>" name="name">
				</div>
				<h4>${msg}</h4>
			</div>
		<input type="submit" value="수정">
		<input type="submit" value="삭제">
		<button><a href="main.do">돌아가기</a></button>
		</section>
	</form>
	</c:if>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
    <footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
