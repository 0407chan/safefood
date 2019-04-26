<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
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
			<h1>회원 가입</h1>
		</div>
	</div>
	<section>
		<div class='center-block' id="signUp">
		<form method="post" action="memberInsertAction.do">
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
					<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox1" value="option1"> 
						<span class="checkItem">대두</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox2" value="option2"> 
						<span class="checkItem">돼지고기</span>
					</label> 
					
					<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox3" value="option3"> 
						<span class="checkItem">새우</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox4" value="option4"> 
						<span class="checkItem">참치</span>
					</label> 
					
					<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox5" value="option5"> 
						<span class="checkItem">소고기</span>
					</label> 
					<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox6" value="option6"> 
						<span class="checkItem">땅콩</span>
					</label> 
				</div>
			</div>
			<input type="submit" value="가입"> 
			<button><a href="main.do">취소</a></button>
			</form>
		</div>
	</section>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
