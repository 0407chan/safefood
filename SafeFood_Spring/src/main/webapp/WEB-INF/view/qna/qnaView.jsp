<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" >
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<!doctype html>
<head>
<meta charset='utf-8'>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
a:link, a:visited {
	text-decoration: none;
	color: #656565;
}
th{
	text-align: center;
}
#app{
	text-align: center;
	margin : 0 auto;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz"/>
	
	<jsp:include page="../include/header.jsp" flush="false" />
	
	<div id="app">
		<template v-if="'${state}'=='questionModify'">
			수정내용 :<input type="text"  name="content" v-model="question.content">
			<button @click="updateQuestion(${idx})" class="btn btn-default">수정</button>
		</template>
		
		<template v-if="'${state}'=='answerModify'">
			수정내용 :<input type="text"  name="content" v-model="question.content">
			<button @click="updateAnswer(${idx})" class="btn btn-default">수정</button>
		</template>
		
		
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
						content: "",
						idx:0
					},
					result : ""
				}
			},  
			methods :{
				updateQuestion : function(index){
					console.log({idx:index, content: this.question.content})
					axios
						.post("../updateQuestion", {idx:index, content: this.question.content})
						.then(response => (this.result = response.data))
						.finally (location.href='../qna')
				},
				
				updateAnswer : function(index){
					console.log({idx:index, content: this.question.content})
					axios
						.post("/updateAnswer", {idx:index, content: this.question.content})
						.then(response => (this.result = response.data))
						.finally (location.href='/qna')
				},
			}
		})
		Vue.config.devtools=true;
 	</script>
</body>
</html>
