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
#mainbar {
	width:100%;
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
		<template v-if="'${state}'=='questionAdd'">
			내용 :<input type="text" name="content" v-model="question.content">
			<button @click="addQuestion">전송</button>
		</template>
		
		<template v-if="'${state}'=='answerAdd'">
			<div>
				<label>내용 : </label>
				<input type="text" name="content" v-model="answer.content"><br>
			</div>
			<button @click="addAnswer(${idx})">답변작성</button>
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
						content: ""
					},
					answer :{
						idx:0,
						content:""
					},
					result : ""
				}
			},
			
			methods :{
				addQuestion : function(){
					axios
						.post("addQuestion", {content: this.question.content})
						.then(response => (this.result = response.data))
						.finally (location.href='qna')
				},
				
				addAnswer : function(index){
					axios
						.post("addAnswer", {idx : index, content: this.answer.content})
						.then(response => (this.result = response.data))
						.finally (location.href='qna')
				}
			}
		})
		Vue.config.devtools=true;
 	</script>
</body>
</html>
