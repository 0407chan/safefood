<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

footer {
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 100px;
	width: 100%;
	background: grey;
	color: white;
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

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="${memberinsert}" id="register-form-link">Sign up</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<c:url value="/member/memberinsertaction"
									var="memberinsertaction" />
								<form action="${memberinsertaction}" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="id" id="id" tabindex="1" class="form-control" placeholder="아이디" value="">
									</div>
									<div class="form-group">
										<input type="text" name="name" id="name" tabindex="1" class="form-control" placeholder="이름" value="">
									</div>
									<div class="form-group">
										<input type="password" name="pw" id="pw" tabindex="2" class="form-control" placeholder="비밀번호">
									</div>
									<div class="form-group">
										<input type="password" name="pwCheck" id="pwCheck" tabindex="2" class="form-control" placeholder="비밀번호확인">
									</div>
									<div>
										<span class="signUpBoxItem">알레르기</span>
										<div class="signUpBoxItem" id="signUpBoxBorder">
											<div id="signUpBoxBorderCheck">check</div>
											<label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="대두"> <span
												class="checkItem">대두</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="땅콩"> <span
												class="checkItem">땅콩</span></label> <label class="checkbox-inline">
												<input type="checkbox" name="allergy" value="우유"> <span
												class="checkItem">우유</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="게"> <span
												class="checkItem">게</span></label> <label class="checkbox-inline">
												<input type="checkbox" name="allergy" value="새우"> <span
												class="checkItem">새우</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="참치"> <span
												class="checkItem">참치</span></label> <label class="checkbox-inline">
												<input type="checkbox" name="allergy" value="연어"> <span
												class="checkItem">연어</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="쑥"> <span
												class="checkItem">쑥</span></label> <label class="checkbox-inline">
												<input type="checkbox" name="allergy" value="소고기"> <span
												class="checkItem">소고기</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="닭고기"> <span
												class="checkItem">닭고기</span></label> <label class="checkbox-inline">
												<input type="checkbox" name="allergy" value="돼지고기">
												<span class="checkItem">돼지고기</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="복숭아"> <span
												class="checkItem">복숭아</span></label> <label class="checkbox-inline">
												<input type="checkbox" name="allergy" value="민들레"> <span
												class="checkItem">민들레</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="계란흰자"> <span
												class="checkItem">계란흰자</span></label>
										</div>
									</div>
										<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" tabindex="4" class="form-control btn btn-login" value="가입">
											</div>
										</div>
									</div>
									<h4>${msg}</h4>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
