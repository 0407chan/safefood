<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<head>
<meta charset='utf-8'>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

th{
	text-align: center;
}

</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz"/>
	
	<div id="mainbar" style="background-image: url(${plz});">
		<jsp:include page="../include/header.jsp" flush="false" />
	</div>
	
	<div id="app">
		글 번호 : <input type="text" name="idx" v-model="question.idx"> <br> 
		내용 :<input type="text" name="content" v-model="question.content">
		<button @click="addQuestion">전송</button>
	</div>
	
    <footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
	<script type="text/javascript">
		new Vue ({
			el:'#app',
			data(){
				return {
					question : {
						idx: 0,
						content: ""
					},
					result : ""
				}
			},
			methods :{
				addQuestion : function(){
					console.log({idx : this.question.idx, content: this.question.content})
					axios
						.post("addQuestion", {idx : this.question.idx, content: this.question.content})
						.then(response => (this.result = response.data))
						.finally (location.href='qna')
				}	
			}
		})
		Vue.config.devtools=true;
 	</script>
</body>
</html>
