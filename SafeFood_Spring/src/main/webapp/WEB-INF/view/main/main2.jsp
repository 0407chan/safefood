<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://unpkg.com/vue"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>

<style type="text/css">
#search {
	text-align: center;
	color: black;
}

.search_item {
	display: inline-block;
	float: left;
	width: 75px;
}

#searchs {
	text-align: center;
	color: white;
}

#searchBox {
	width: 200px;
	margin: 0 auto;
	text-align: center;
}


section {
	text-align: center;
	left: 50%;
}

.resultTable {
	text-align: center;
}

table td {
	border: medium;
	width: 300px;
}
.highlight {
	background-color: yellow;
}

.highlight-yellow .highlight, .highlight-type-yellow {
	background-color: yellow;
}
tr:hover {background-color:#f5f5f5;}
tr:nth-child(even) {background-color: #FAFAFA;}
tr:nth-child(even):hover {background-color: #f5f5f5;}
</style>
</head>
<c:url value="/member/memberInfo" var="memberinfo" />
<c:url value="/member/memberInsert" var="memberinsert" />
<c:url value="/login/login" var="login" />
<c:url value="/login/logout" var="logout" />
<c:url value="/board" var="board" />
<c:url value="/main" var="main" />
<c:url value="/atefoodform" var="atefoodform" />
<c:url value="/bestFoodForm" var="bestFoodForm" />
<c:url value="/qna" var="qna" />
<c:url value="/static/img/background.png" var="plz" />
<c:url value="/static/" var="loc" />
<body style="margin: 0 0 0 0;">
	
	<jsp:include page="../include/header.jsp" flush="false" />
	<div id="app">
		<div class='center-block' id="searchBox">
			<select name="searchField" id="searchField" v-model="searchField">
				<option value="whole" selected="selected">전체</option>
				<option value="name">제품명</option>
				<option value="maker">제조사</option>
				<option value="material">재료</option>
			</select> 
			<input type="text" id="searchText" name="searchText" v-model="question">
		</div>
	
		<section>
			<table class="resultTable">
				<tr>
					<td>이미지</td>
					<td>음식 이름</td>
					<td>재료</td>
				</tr>

				<template v-for="food in foods">
				<tr>
					<td><img v-bind:src="'./static/'+food.img" width="150"></td>
					<td><a v-bind:href="'./food/foodview?code='+food.code"> <span
							v-html="highlightKeyword(food.name)" :class="highlightType"></span>
					</a></td>
					<td><span v-html="highlightKeyword(food.material)"
						:class="highlightType"></span></td>
				</tr>
				</template>
			</table>
		</section>
	</div>
	<div style="padding-bottom: 100px;"></div>
	<jsp:include page="../include/footer.jsp" flush="false" />
	<script type="text/javascript">
		new Vue ({
			el:'#app',
			data(){
				return {
					info: null,
					loading: true,
					errored: false,
					searchField:'whole',
					question:'',
					foods:[],
					highlightType: 'highlight-yellow'
				}
			},
			
			mounted(){
				axios
				.post('getFoods')
					.then(response => (this.foods = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
			},
			
			
			watch: {
			// 질문이 변경될 때 마다 이 기능이 실행됩니다.
				searchField: function(){
					this.setSearchField()
				},
				question: function () {
					this.findFoods()
				},
			},
			
			methods:{
				findFoods: function () {
					var params = new URLSearchParams();
						params.append("name",this.question);
						params.append("searchField",this.searchField);
					var request = {
					  params: params
					};
					
					if(this.question.length > 0){
						axios
						.get('findFoods/'+params)
							.then(response => (this.foods = response.data))
							.catch(error => {
								console.log(error)
								this.errored = true
							})
							.finally(()=> this.loading = false);
					}
					else{
						axios
						.post('getFoods')
							.then(response => (this.foods = response.data))
							.catch(error => {
								console.log(error)
								this.errored = true
							})
							.finally(()=> this.loading = false);
					}
				},
			
				setSearchField(){
					console.log(this.searchField)
				},
				
				highlightKeyword: function(str) {
		            if(str && this.question) {
		                var highlight = [this.question.trim(), this.question.toLowerCase().trim()];
						str = ' ' + str;
		                return str.replace(new RegExp('(.)(' + highlight.join('|') + ')(.)','ig'), '$1<span class="highlight">$2</span class="highlight">$3');
		                //return str;
		            }
		            else return str;
		        }
			}
		})
 	</script>

</body>
