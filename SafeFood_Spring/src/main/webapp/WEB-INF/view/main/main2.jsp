<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/vue"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>

<style type="text/css">
	.search{
  background-color: #fffff;
  color: black;
  padding: 12px;
  border: none;
  font-size: 20px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  -webkit-appearance: button;
  appearance: button;
  outline: none;
}
.search_item {
	display: inline-block;
	float: left;
	width: 75px;
}

#searchBox {
	width: 400px;
	margin: 0 auto;
	text-align: center;
}

section {
	text-align: center;
	left: 50%;
}

.resultTable {
	text-align: center;
	margin: 0 auto;
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


.foodItem{
	text-align: left;
	margin-right: 10px;
	margin-left: 10px;
}

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
			<p>
			<select class="search" style="width:85px;" name="searchField"  v-model="searchField" >
				<option value="whole" selected="selected">전체</option>
				<option value="name">제품명</option>
				<option value="maker">제조사</option>
				<option value="material">재료</option>
			</select>
			<input class="search"  style="width:300px;" type="text" placeholder="Search" aria-label="Search" v-model="question"><p>
		</div>
		<hr>
		<section>
			<template v-for="food in foods">
				<div class="foodItem">
					<div class="col-md-4">
						<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
							<div class="col-auto d-none d-lg-block">
								<a v-bind:href="'./food/foodview?code='+food.code">
								 <img v-bind:src="'./static/'+food.img" width="200"></a>
							</div>
							<div class="col p-4 d-flex flex-column position-static">
								<strong class="d-inline-block mb-2 text-primary"><span
									v-html="highlightKeyword(food.maker)" :class="highlightType"></span></strong>
								<h3 class="mb-0"><a v-bind:href="'./food/foodview?code='+food.code">
								<span v-html="highlightKeyword(food.name)" :class="highlightType"></span></a></h3>
								<br>
								<div style="height:100px; overflow:auto;">
								<span v-html="highlightKeyword(food.material)" :class="highlightType"></span></div>
							</div>
						</div>
					</div>
				</div>
			</template>
		</section>
	</div>
	<div style="padding-bottom: 100px;"></div>
	<jsp:include page="../include/footer.jsp" flush="false" />
	<script type="text/javascript">
	
		new Vue ({
			el:'#app',
			data(){
				return {
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
		
		$(document).ready(function(e){
		    $('.search-panel .dropdown-menu').find('a').click(function(e) {
		    	e.preventDefault();
				var param = $(this).attr("href").replace("#","");
				var concept = $(this).text();
				$('.search-panel span#search_concept').text(concept);
				$('.input-group #search_param').val(param);
			});
		});
 	</script>

</body>
