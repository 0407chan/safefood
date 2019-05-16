<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<template v-if="'${state}'=='questionAdd'">
			내용 :<input type="text" name="content" v-model="question.content">
			<button @click="addQuestion" class="btn btn-default">전송</button>
		</template>
		
		<template v-if="'${state}'=='answerAdd'">
			<div>
				<p>
				<label>내용 : </label>
				<input type="text" name="content" v-model="answer.content"><br>
				<button @click="addAnswer(${idx})" class="btn btn-default">답변작성</button>
				</p>
			</div>
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
