<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
<meta charset='utf-8'>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
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
		<table class="board_list">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col"></th>
					<th scope="col">작성자</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<template v-for="board in boards">
				
				<tr>
					<td>{{board.idx}}</td>
					<template v-if="board.state">
						<td>
							<a href="#">{{board.content}}</a>
						</td>
						<td><span style="color: blue">답변 완료</span></t>
					</template>
					<template v-else>
						<td>{{board.content}}</td>
						<template v-if="'${user.id}'!= ''">
							<td><button>답변</button></td>
						</template>
						<template v-else>
							<td></td>
						</template>
					</template>
					<td>{{board.userid}}</td>
					<template v-if="board.userid=='${user.id}'">
						<td>
							<c:url value="/qna/view" var="qnaview"/>
							<button @click="questionUpdate(board.idx)">수정</button>
							<button @click="questionDel(board.idx)">삭제</button>
						</td>
					</template>
				</tr>
				
					<template v-if="board.state">
						<tr>
							<td> </td>
							<template v-for="ans in answers">
								<td v-if="ans.idx==board.idx">답변 : <span style="background:yellow" v-html="ans.content"></span></td>
								<td v-if="ans.idx==board.idx">-</td>
								<td v-if="ans.idx==board.idx"><span v-html="ans.userid"></span></td>
								<template v-if="ans.userid=='${user.id}'">
								<td v-if="ans.idx==board.idx">
									<c:url value="/modifyAnswer" var="modifyans"/>
									<button > <a href="${modifyans}">수정</a></button>
									<button @click="questionDel(board.idx)">삭제</button>
								</td>
								</template>
							</template>
						</tr>
					</template>
			
				</template>
			</tbody>
		</table>
		<template v-if="'${user.id}'!= ''">
			<c:url value="/addQuestion" var="add"/>
			<button > <a href="${add}">질문하기</a></button>
		</template>
	</div>
	
    <footer>
		<jsp:include page="../include/footer.jsp" flush="false"/>
	</footer>
	
	<script type="text/javascript">
		new Vue ({
			el:'#app',
			data(){
				return {
					info: null,
					loading: true,
					errored: false,
					boards:[],
					answers:[],
					state:[]
				}
			},
			
			mounted(){
				axios
				.get('getboards')
					.then(response => (this.boards = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
			 
				axios
				.post("getAnswers")
					.then(response => (this.answers = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
			},
			
			methods:{
 				questionDel:function(idx){
					axios
					.delete('deleteQuestion/'+idx)
						.then(response => (this.boards = response.data))
						.catch(error => {
							console.log(error)
							this.errored = true
						})
						.finally(location.href='qna')
				},  
 				questionUpdate:function(idx){
 					location.href='qna/view?idx='+idx;
				},  
				answerDel:function(idx){
					axios
					.delete('deleteAnswer/'+idx)
						.then(response => (this.answers = response.data))
						.catch(error => {
							console.log(error)
							this.errored = true
						})
						.finally(location.href='qna')
				},
				
				setAnswerState:function(stateindex){
					if(typeof this.$data.state[stateindex] == 'undefined'){
						this.$data.state[stateindex]= false;
					}
					
					if(this.$data.state[stateindex] == true){
						this.$data.state[stateindex] = false;
					}else if(this.$data.state[stateindex] == false) {
						this.$data.state[stateindex] = true;
					}
					
					return this.$data.state[stateindex];
				},
			}
		})
 	</script>
</body>
</html>
