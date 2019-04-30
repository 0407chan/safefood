<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	width:100%;
}
#searchs{
	color: white;
	text-align: center;
}

</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz"/>
	<div id="mainbar" style="background-image: url(${plz});">
	
	<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
			<h1>회원 정보</h1>
		</div>
	</div>
	<c:if test="${sessionScope.user==null }">
		<h1>로그인이 필요합니다</h1>
	</c:if>
	<c:if test="${sessionScope.user!=null }">
	<c:url value="/memberModify" var="memberModify"/>
	<form method="post" action="${memberModify}">
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
				<div>
				<span class="signUpBoxItem">알레르기</span>
				<div class="signUpBoxItem" id="signUpBoxBorder">
					<div id="signUpBoxBorderCheck">check</div>
					
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="대두"
						<c:if test="${fn:contains(user.allergy, '대두')}">checked</c:if>>
						<span class="checkItem">대두</span>
					</label>  
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="땅콩"
						<c:if test="${fn:contains(user.allergy, '땅콩')}">checked</c:if>>
						<span class="checkItem">땅콩</span>
					</label>
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="우유"
						<c:if test="${fn:contains(user.allergy, '우유')}">checked</c:if>>
						<span class="checkItem">우유</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="게"
						<c:if test="${fn:contains(user.allergy, '게')}">checked</c:if>>
						<span class="checkItem">게</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="새우"
						<c:if test="${fn:contains(user.allergy, '새우')}">checked</c:if>>
						<span class="checkItem">새우</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="참치"
						<c:if test="${fn:contains(user.allergy, '참치')}">checked</c:if>> 
						<span class="checkItem">참치</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="연어"
						<c:if test="${fn:contains(user.allergy, '연어')}">checked</c:if>> 
						<span class="checkItem">연어</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="쑥"
						<c:if test="${fn:contains(user.allergy, '쑥')}">checked</c:if>> 
						<span class="checkItem">쑥</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="소고기"
						<c:if test="${fn:contains(user.allergy, '소고기')}">checked</c:if>> 
						<span class="checkItem">소고기</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="닭고기"
						<c:if test="${fn:contains(user.allergy, '닭고기')}">checked</c:if>> 
						<span class="checkItem">닭고기</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="돼지고기"
						<c:if test="${fn:contains(user.allergy, '돼지고기')}">checked</c:if>> 
						<span class="checkItem">돼지고기</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="복숭아"
						<c:if test="${fn:contains(user.allergy, '복숭아')}">checked</c:if>> 
						<span class="checkItem">복숭아</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="민들레"
						<c:if test="${fn:contains(user.allergy, '민들레')}">checked</c:if>> 
						<span class="checkItem">민들레</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" name="allergy" value="계란흰자"
						<c:if test="${fn:contains(user.allergy, '계란흰자')}">checked</c:if>> 
						<span class="checkItem">계란흰자</span>
					</label> 
				</div>
			</div>
			
				<h4>${msg}</h4>
			</div>
		<input type="submit" value="수정">
		<c:url value="/memberDelete" var="memberDelete"/>
		<button><a href="${memberDelete}?id=${sessionScope.user.id}">삭제</a></button>
		<c:url value="/main/main" var="main"/>
		<button><a href="${main}">돌아가기</a></button>
		</section>
	</form>
	</c:if>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
