<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
<meta charset='utf-8'>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:url value="/static/css/bootstarp.min.css" var="css" />
<link href="${css}" rel="stylesheet">
<style type="text/css">
th{
	text-align: center;
}
#app{
	padding-bottom: 100px;
}
#qnawrapper{
	width : 1200px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz"/>
	<c:url value="/qna/view" var="qnaview"/>
	<c:url value="/addQuestion" var="add"/>
	
	<jsp:include page="../include/header.jsp" flush="false" />
	
	<div id="app">
	<div id="qnawrapper">
		<table class="table table-striped table-hover">
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
							<td>
								<button @click="answerAddUI(board.idx)" class="btn btn-default">답변</button>
							</td>
						</template>
						<template v-else>
							<td> </td>
						</template>
					</template>
					<td>{{board.userid}}</td>
					<template v-if="board.userid=='${user.id}'">
						<td>
							<button @click="questionUpdate(board.idx)" class="btn btn-default">수정</button>
							<button @click="questionDel(board.idx)" class="btn btn-default">삭제</button>
						</td>
					</template>
					<template v-else>
						<td>
							<p> </p>
						</td>
					</template>
				</tr>
					<template v-if="board.state">
						<tr>
							<td> </td>
							<template v-for="ans in answers">
								<template v-if="ans.idx==board.idx">
								<td>답변 : <span style="background:yellow" v-html="ans.content"></span></td>
								<td>-</td>
								<td><span v-html="ans.userid"></span></td>
								<template v-if="ans.userid=='${user.id}'">
									<td>
										<button @click="answerModify(board.idx)" class="btn btn-default">수정</button>
										<button @click="answerDel(board.idx)" class="btn btn-default">삭제</button>
									</td>
								</template>
								<template v-else>
									<td>
										<p> </p>
									</td>
								</template>
							</template>
							</template>
						</tr>
					</template>
			
				</template>
			</tbody>
			
		</table>
		<template v-if="'${user.id}'!= ''">
			<button class="btn btn-default"> <a href="${add}">질문하기</a></button>
		</template>
	</div>
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
				.post('getAnswers')
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
				
				answerAddUI:function(idx){
					location.href='answerAddUI?idx='+idx;
				},  
				
 				questionUpdate:function(idx){
 					location.href='qna/view?idx='+idx;
				},
				
				answerModify:function(idx){
 					location.href='answerModify?idx='+idx;
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
				}
				
			}
		})
 	</script>
</body>
</html>
