<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
=======
<%@page import="com.ssafy.model.dto.Member"%>
<% Member cus = (Member) session.getAttribute("user"); %>

>>>>>>> 7cc6cddfe36f5e0a33ad72d4ebe6b7db12312676
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
							<!-- 누르면 열리고, 누르면 닫힌다. -->
							<a href="#">
							<span v-on:click="setAnswerState(board.idx)">{{board.content}}</div>
							</a>
						</td>
						<td><span style="color: blue">답변 완료</span></td>
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
							<button>수정</button>
							<button>삭제</button>
						</td>
					</template>
				</tr>
				
					<template v-if="board.state">
						<tr>
							<td> </td>
							<td>답변 : <span style="background:yellow" v-html="getAnswer(board.idx).content"></span></td>
							<td></td>
							<td><span v-html="getAnswer(board.idx).userid"></span></td>
							<template v-if="board.userid=='${user.id}'">
								<td>
									<button>수정</button>
									<button>삭제</button>
								</td>
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
		<jsp:include page="../include/footer.jsp" flush="false" />
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
			methods :{
				addQuestion : function(){
					location.href='../index.jsp';
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
					.finally(()=> this.loading = false),
			
				axios
				.get('getAnswers')
					.then(response => (this.answers = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false)
			},
			
			methods:{
				getAnswer:function(index){
					console.log(this.$data.answers[index]);
					return this.$data.answers[index];
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
				
				getAnswerState:function(stateindex){
					console.log("열림닫힘? "+this.$data.state[stateindex]);
					
					return this.$data.state[stateindex];
				},
				
				showMyHrm:function(name,$event){
					return name+new Date();
				},
				changeMyName:function($event){
					alert($event);
					console.log($event);
					this.title='SSAFY HRM SSAFY HRM';
				}
			}
			
		})
 	</script>
</body>
</html>
