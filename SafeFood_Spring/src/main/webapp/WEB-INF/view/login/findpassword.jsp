<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

#logInBox{
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
#loginText{
	text-align: center;
	color: white;
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
			<h1>비밀번호 찾기</h1>
		</div>
	</div>
	<section>
		<div class='center-block' id="logInBox">
			<div class='center-block'>
				<h3>비밀번호 찾기</h3>
			</div>
			
			<form class="form-horizontal" method="post" action="findpasswordAction.do">
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
					<input type="button" value="로그인" onclick="cancle()">
				</div>
			</form>
		</div>
	</section>
	
	
	<footer> </footer>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
		function cancle(){
			location.href = "logIn.do";
		}	
	</script>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
