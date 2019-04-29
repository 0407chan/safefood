<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
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
	background-color: red;
	width: 200px;
	border: 2px soild;
}

#signUp {
	background-color: gray;
	width: 500px;
	padding: 20px;
	margin-top: 20px;
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
	<c:url value="/main/main" var="main" />
	<c:url value="/main/memberinsertaction" var="memberinsertaction" />
	<c:url value="/static/img/background.png" var="plz" />
	<div id="mainbar" style="background-image: url(${plz});">
		<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
			<h1>회원 가입</h1>
		</div>
	</div>
	<section>
		<div class='center-block' id="signUp">
		<c:url value="/member/memberinsertaction" var="memberinsertaction"/>
		<form method="post" action="${memberinsertaction}">
			<h3>회원가입</h3>
			<div>
				<span class="signUpBoxItem">아이디</span> <input type="text" name="id">
			</div>
			<div>
				<span class="signUpBoxItem" >이름</span> <input type="text" name="name">
			</div>
			<div>
				<span class="signUpBoxItem">비밀번호</span> <input type="password"  name="pw">
			</div>
			<div>
				<span class="signUpBoxItem" >비밀번호 확인</span> <input type="password" name="pwCheck">
			</div>

				<div>
					<span class="signUpBoxItem">알레르기</span>
					<div class="signUpBoxItem" id="signUpBoxBorder">
						<div id="signUpBoxBorderCheck">check</div>
						<label class="checkbox-inline"> <input type="checkbox"
							name="allergy" value="대두"> <span class="checkItem">대두</span>
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="allergy" value="돼지고기"> <span class="checkItem">돼지고기</span>
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="allergy" value="새우"> <span class="checkItem">새우</span>
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="allergy" value="참치"> <span class="checkItem">참치</span>
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="allergy" value="소고기"> <span class="checkItem">소고기</span>
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="allergy" value="땅콩"> <span class="checkItem">땅콩</span>
						</label>
					</div>
				</div>
			</div>
			<input type="submit" value="가입"> 
			<c:url value="/main/main" var="main"/>
			<button><a href="${main}">취소</a></button>
			</form>
		</div>
	</section>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
