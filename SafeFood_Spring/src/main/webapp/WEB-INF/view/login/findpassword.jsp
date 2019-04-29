<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">

section {
	text-align: center;
}

#search {
	text-align: center;
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
	background-color: red;
	width: 200px;
	border: 2px soild;
}

#signUp {
	background-color: gray;
	width: 500px;
	padding: 20px;
}

#signUpBoxBorder {
	border: 1px solid;
	width: 200px;
	padding: 10px;
}

#signUpBoxBorderCheck {
	background-color: gray;
	margin-top: -20px;
	width: 40px;
}

#logInBox {
	background-color: gray;
	width: 500px;
	padding: 20px;
	margin-top: 20px;
}

.LogInBoxItem {
	display: inline-block;
	text-align: left;
	width: 120px;
	fload: left;
	margin: 10px;
}

#loginText {
	text-align: center;
	color: white;
}

#mainbar {
	width: 100%;
}

#searchs {
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<div id="mainbar" style="background-image: url(${plz});">
		<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
			<h1>비밀번호 찾기</h1>
		</div>
	</div>
	<section>
		<div class='center-block' id="logInBox">
			<div class='center-block'>
				<h3>비밀번호 찾기</h3>
			</div>

			<c:url value="/findpasswordAction" var="findpasswordAction"/>
			<form class="form-horizontal" method="post" action="${findpasswordAction}">
				<div>
					<span class="LogInBoxItem">아이디</span>
					 <input type="text" name="id">
				</div>
				<div>
					<span class="LogInBoxItem">이름</span> 
					<input type="text" name="name">
				</div>
				<h4>${msg}</h4>
				<div>
					<input type="submit" value="찾기"> 
					
					<c:url value="/login/login" var="login"/>
					<button><a href="${login}">로그인</a></button>
				</div>
			</form>
		</div>
	</section>


	<footer> </footer>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
