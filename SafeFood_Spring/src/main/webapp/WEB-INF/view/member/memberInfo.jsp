<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<head>
<meta charset='utf-8'>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}


#searchs {
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<c:url value="/member/memberInsert" var="memberinsert"/>
	<c:url value="/login/login" var="login"/>
	<c:url value="/memberModify" var="memberModify" />
	<c:url value="/index" var="index" />
	
	<jsp:include page="../include/header.jsp" flush="false" />
	<div id="searchs">
		<h1>회원 정보</h1>
	</div>
	
	<c:if test="${sessionScope.user==null }">
		<h1>로그인이 필요합니다</h1>
	</c:if>
	<c:if test="${sessionScope.user!=null }">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-login">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<span  id="register-form-link">Member Info</span>
								</div>
							</div>
							<hr>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<form action="${memberModify}" method="post" role="form"	style="display: block;">
										<div class="form-group">
											<span>아이디</span> <input type="text" tabindex="1"
												class="form-control"
												value="<c:out value="${sessionScope.user.id}" ></c:out>"
												name="id" readonly>
										</div>
										<div class="form-group">
											<span>비밀번호</span> <input type="text" tabindex="1"
												class="form-control"
												value="<c:out value="${sessionScope.user.pw}" ></c:out>"
												name="pw">
										</div>
										<div class="form-group">
											<span>이름</span> <input type="text" tabindex="2"
												class="form-control"
												value="<c:out value="${sessionScope.user.name}" ></c:out>"
												name="name">
										</div>
										<fieldset>
										<legend>알레르기</legend>
											<label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="대두"
												<c:if test="${fn:contains(user.allergy, '대두')}">checked</c:if>>
												<span class="checkItem">대두</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="땅콩"
												<c:if test="${fn:contains(user.allergy, '땅콩')}">checked</c:if>>
												<span class="checkItem">땅콩</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="우유"
												<c:if test="${fn:contains(user.allergy, '우유')}">checked</c:if>>
												<span class="checkItem">우유</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="게"
												<c:if test="${fn:contains(user.allergy, '게')}">checked</c:if>>
												<span class="checkItem">게</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="새우"
												<c:if test="${fn:contains(user.allergy, '새우')}">checked</c:if>>
												<span class="checkItem">새우</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="참치"
												<c:if test="${fn:contains(user.allergy, '참치')}">checked</c:if>>
												<span class="checkItem">참치</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="연어"
												<c:if test="${fn:contains(user.allergy, '연어')}">checked</c:if>>
												<span class="checkItem">연어</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="쑥"
												<c:if test="${fn:contains(user.allergy, '쑥')}">checked</c:if>>
												<span class="checkItem">쑥</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="소고기"
												<c:if test="${fn:contains(user.allergy, '소고기')}">checked</c:if>>
												<span class="checkItem">소고기</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="닭고기"
												<c:if test="${fn:contains(user.allergy, '닭고기')}">checked</c:if>>
												<span class="checkItem">닭고기</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="돼지고기"
												<c:if test="${fn:contains(user.allergy, '돼지고기')}">checked</c:if>>
												<span class="checkItem">돼지고기</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="복숭아"
												<c:if test="${fn:contains(user.allergy, '복숭아')}">checked</c:if>>
												<span class="checkItem">복숭아</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="민들레"
												<c:if test="${fn:contains(user.allergy, '민들레')}">checked</c:if>>
												<span class="checkItem">민들레</span>
											</label> <label class="checkbox-inline"> <input
												type="checkbox" name="allergy" value="계란흰자"
												<c:if test="${fn:contains(user.allergy, '계란흰자')}">checked</c:if>>
												<span class="checkItem">계란흰자</span>
											</label>
										</fieldset>
									<h4>${msg}</h4>
									<input type="submit" value="수정" class="form-control btn btn-login">
									
									<c:url value="/memberDelete" var="memberDelete" />
									<button class="form-control btn btn-login"><a href="${memberDelete}?id=${sessionScope.user.id}" >삭제</a></button>
									<button class="form-control btn btn-login"><a href="${index}">돌아가기</a></button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
