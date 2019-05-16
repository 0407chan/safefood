<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  

<style type="text/css">

#search {
	text-align: center;
}
#searchs {
	color: white;
	text-align: center;
}
td {
	text-align: center;
	width: 150px;
}

.firstline{
	background: #f0f0f0;
}

#nutrTable{
	border-top: 1px solid #111;
	border-bottom: 1px solid #111;
}

#nutrTable td{
	padding: 8px;
	border-bottom: 1px solid #ddd;
}
.resultTable th{
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;

}
.resultTable tr:hover {background-color:#f5f5f5;}


h3{
	text-align: center;
}

.over120{
	color: red;
}
.less120over90{
	color: blue;
}

#searchBox{
	width: 200px;
	margin: 0 auto;
	text-align: center;
}
.search_item{
	float : left;
	width:75px;
}
#clear{
	clear: both;
}
section{
	padding-bottom: 100px;
}


#atefoodView{
	text-align: center;
}

#app{
	text-align: center;
}
#resultWrapper{
	display: inline-block;
	text-align: center;
}

#nutri{
	width: 1200px;
	margin: 0 auto;
}
#result{
	margin: 0 auto;
	display: inline-block;
}

.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
#returnbutton{
	margin: 0 auto;
	width: 200px;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<section>

	<div id="app">
		<div id="resultWrapper">
			
			<div id="nutri">
				<hr>
				<template v-if="expfoodsNutr[0] != null && expfoodsNutr[0].calory > 0">
					<h3>예상 섭취 식품 정보</h3>
				</template>
				<template v-else>
					<h3>찜한 식품이 없습니다.</h3>
					<br>
					<c:url value="/index" var="index" />
					<div id="returnbutton">
						<button class="form-control btn btn-login"><a href="${index}">음식 찜하러 가기</a></button>
					</div>
				</template>
				
				<template v-if="expfoodsNutr[0] != null && expfoodsNutr[0].calory > 0">
					<table id="nutrTable">
						<tr>
							<td class="firstline">영양성분표</td>
							<td>칼로리</td>
							<td>탄수화물</td>
							<td>당류</td>
							<td>단백질</td>
							<td>지방</td>
							<td>나트륨</td>
							<td>콜레스테롤</td>
							<td>트렌스지방</td>
							<td>포화지방산</td>
						</tr>
						<tr>
							<td class="firstline">영양성분</td>
							<td>{{expfoodsNutr[0].calory}}kcal</td>
							<td>{{expfoodsNutr[0].carbo}}g</td>
							<td>{{expfoodsNutr[0].sugar}}g</td>
							<td>{{expfoodsNutr[0].protein}}g</td>
							<td>{{expfoodsNutr[0].fat}}g</td>
							<td>{{expfoodsNutr[0].natrium}}mg</td>
							<td>{{expfoodsNutr[0].chole}}mg</td>
							<td>{{expfoodsNutr[0].transfat}}g</td>
							<td>{{expfoodsNutr[0].fattyacid}}mg</td>
						</tr>
						<tr>
						<td class="firstline">1일 기준치에 대한 비율</td>
						<td>
							<template v-if="expfoodsNutr[1].calory >= 120">
								<span class ="over120">{{expfoodsNutr[1].calory}}% (초과)</span>
							</template>
							<template v-else-if="expfoodsNutr[1].calory <120 && expfoodsNutr[1].calory > 90">
								<span class ="less120over90">{{expfoodsNutr[1].calory}}% (적정)</span>
							</template>
							<template v-else> {{expfoodsNutr[1].calory}}% </template>
						</td>
						<td><template v-if="expfoodsNutr[1].carbo >= 120">
								<span class ="over120">{{expfoodsNutr[1].carbo}}% (초과)</span>
							</template>
							<template v-else-if="expfoodsNutr[1].carbo <120 && expfoodsNutr[1].carbo > 90">
								<span class ="less120over90">{{expfoodsNutr[1].carbo}}% (적정)</span>
							</template>
							<template v-else> {{expfoodsNutr[1].carbo}}% </template>
							</td>
							
						<td><template v-if="expfoodsNutr[1].sugar >= 0">
								<span>-</span>
							</template>
						</td>
						<td><template v-if="expfoodsNutr[1].protein >= 120">
								<span class ="over120">{{expfoodsNutr[1].protein}}% (초과)</span>
							</template>
							<template v-else-if="expfoodsNutr[1].protein <120 && expfoodsNutr[1].protein > 90">
								<span class ="less120over90">{{expfoodsNutr[1].protein}}% (적정)</span>
					 		</template>
							<template v-else> {{expfoodsNutr[1].protein}}% </template>
							</td>
						<td><template v-if="expfoodsNutr[1].fat >= 120">
								<span class ="over120">{{expfoodsNutr[1].fat}}% (초과)</span>
							</template>
							<template v-else-if="expfoodsNutr[1].fat <120 && expfoodsNutr[1].fat > 90">
								<span class ="less120over90">{{expfoodsNutr[1].fat}}% (적정)</span>
							</template>
							<template v-else> {{expfoodsNutr[1].fat}}% </template>
							</td>
						<td><template v-if="expfoodsNutr[1].natrium >= 120">
								<span class ="over120">{{expfoodsNutr[1].natrium}}% (초과)</span>
							</template>
							<template v-else-if="expfoodsNutr[1].natrium <120 && expfoodsNutr[1].natrium > 90">
								<span class ="less120over90">{{expfoodsNutr[1].natrium}}% (적정)</span>
							</template>
							<template v-else> {{expfoodsNutr[1].natrium}}% </template>
							</td>
						<td><template v-if="expfoodsNutr[1].chole >= 120">
								<span class ="over120">{{expfoodsNutr[1].chole}}% (초과)</span>
							</template>
							<template v-else-if="expfoodsNutr[1].chole <120 && expfoodsNutr[1].chole > 90">
								<span class ="less120over90">{{expfoodsNutr[1].chole}}% (적정)</span>
							</template>
							<template v-else> {{expfoodsNutr[1].chole}}% </template>
							</td>
						<td><template v-if="expfoodsNutr[1].transfat >= 0">
								<span>-</span>
							</template>
						</td>
						<td><template v-if="expfoodsNutr[1].fattyacid >= 120">
								<span class ="over120">{{expfoodsNutr[1].fattyacid}}% (초과)</span>
							</template>
							<template v-else-if="expfoodsNutr[1].fattyacid <120 && expfoodsNutr[1].fattyacid > 90">
								<span class ="less120over90">{{expfoodsNutr[1].fattyacid}}% (적정)</span>
							</template>
							<template v-else> {{expfoodsNutr[1].fattyacid}}% </template>
							</td>
					</tr>
					</table>
					</template>
				<hr>
			</div>
			<div id="result">
					<table class="resultTable">
						<tr>
							<th>이미지</th>
							<th>음식 이름</th>
							<th>개수</th>
							<th>비고</th>
						</tr>
						<template v-if="expfoodsNutr[0] != null && expfoodsNutr[0].calory > 0">
							<food-component :food="food" v-for="food in foods"></food-component>
						</template>
					</table>
			</div>
		</div>
	</div>
	</section>

	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
	<script type="text/javascript">
	
		Vue.component('food-component', {
		    props: ["food"],
		    template:`
		    	<tr>
					<td><a v-bind:href="'./food/foodview?code='+food.code"><img v-bind:src="'./static/'+food.img" width="150"></a></td>
					<td><a v-bind:href="'./food/foodview?code='+food.code">{{food.name}}</a></td>
					<td><input type="number" min="0" v-model="food.num"></td>
					<td>
						<button @click="expFoodDelete(food.code)" class="btn btn-default">삭제</button>
					</td>
				</tr>
		        `,
		    watch: {
		    	food: {
		            handler: function(food) {
		                this.getexpfoods(food)
		            },
		            deep: true
		        }
		    },
		        
	        methods:{
				getexpfoods:function(key){
					var params = new URLSearchParams();
						params.append("code",key.code);
						params.append("num",key.num);
					var request = {
					  params: params
					};
					axios
					.post('updateExpFoods/'+params)
						.then(response => (this.foods = response.data))
						.catch(error => {
							console.log(error)
							this.errored = true
						})
						.finally(location.href='expfoodform');
				},
				
				expFoodDelete:function(key){
					axios
					.delete('expFoodDelete/'+key)
						.then(response => (this.answers = response.data))
						.catch(error => {
							console.log(error)
							this.errored = true
						})
						.finally(location.href='expfoodform')
				}
	        }
		});
	
	
		var userid = '${user.id}';
		function yyyymmdd() {
		    var now = new Date();
		    var y = now.getFullYear();
		    var m = now.getMonth() + 1;
		    var d = now.getDate();
		    return '' + y +'-'+(m < 10 ? '0' : '') + m + '-'+(d < 10 ? '0' : '') + d;
		}
		var today = yyyymmdd();
		
		new Vue ({
			el:'#app',
			data(){
				return {
					isss:true,
					update:'',
					expfoodsNutr:[],
					foods:[],
					date:today
				}
			},
			
			mounted(){
				axios
				.post('getExpFoodsNutr/'+userid)
					.then(response => (this.expfoodsNutr = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
				
				axios
				.post('getExpFoods/'+userid)
					.then(response => (this.foods = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
			},
			
			watch: {
				date: function () {
					this.getExpFoodbyDate(),
					this.getExpFoodNutrbyDate()
				}, 
			
				update:function(){
					this.updateExpFoods()
				}
			},
			
			methods:{
				updateExpFoods:function(){
					axios
					.post('getExpFoodsNutr/'+userid)
						.then(response => (this.expfoodsNutr = response.data))
						.catch(error => {
							console.log(error)
							this.errored = true
						})
						.finally(()=> this.loading = false);
				}
				
				
			}
		});
	</script>
</body>
	
</html>
