 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<head>
<meta charset='utf-8'>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
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
		글번호 <input type="text" value="${idx}">
		수정할꺼임 :<input type="text"  name="content" v-model="question.content">
		<button @click="updateQuestion(${idx})">수정</button>
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
				}	
			}
		})
		Vue.config.devtools=true;
 	</script>
</body>
</html>
