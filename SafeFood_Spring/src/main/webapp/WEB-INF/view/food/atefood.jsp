<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/vue"></script>
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

#resultWrapper{
	margin: 0 auto;
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

</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	
	<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
			<h1>내 섭취 정보</h1>
		</div>
		<div class='center-block' id="searchBox">
			<c:url value="/atefood/search" var="search"/>
				<form action="${search}" method="post">
					<select name="searchField" id="searchField" >
						<option value="whole">전체</option>
						<option value="today">오늘</option>
						<option value="day">일</option>
						<option value="month">월</option>
						<option value="year">년</option>
					</select> 
					<input type="text" id="searchText" name="searchText" > 
					<input type="submit" value="검색" >
				</form>
		</div>
	<br id="clear">
	<section>
	
	<div id="app">
		<div id="nutri">
			<hr>
			<h3>오늘 섭취 식품 정보</h3>
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
					<td>{{foods[0].calory}}kcal</td>
					<td>{{foods[0].carbo}}g</td>
					<td>{{foods[0].sugar}}g</td>
					<td>{{foods[0].protein}}g</td>
					<td>{{foods[0].fat}}g</td>
					<td>{{foods[0].natrium}}mg</td>
					<td>{{foods[0].chole}}mg</td>
					<td>{{foods[0].transfat}}g</td>
					<td>{{foods[0].fattyacid}}mg</td>
				</tr>
				
				<tr>
					<td class="firstline">1일 기준치에 대한 비율</td>
					<td>
						<template v-if="foods[1].calory >= 120">
							<span class ="over120">{{foods[1].calory}}% (초과)</span>
						</template>
						<template v-else-if="foods[1].calory <120 && foods[1].calory > 90">
							<span class ="less120over90">{{foods[1].calory}}% (적정)</span>
						</template>
						<template v-else> {{foods[1].calory}}% </template>
					</td>
					<td><template v-if="foods[1].carbo >= 120">
							<span class ="over120">{{foods[1].carbo}}% (초과)</span>
						</template>
						<template v-else-if="foods[1].carbo <120 && foods[1].carbo > 90">
							<span class ="less120over90">{{foods[1].carbo}}% (적정)</span>
						</template>
						<template v-else> {{foods[1].carbo}}% </template>
						</td>
						
					<td><template v-if="foods[1].sugar >= 0">
							<span>-</span>
						</template>
					</td>
					<td><template v-if="foods[1].protein >= 120">
							<span class ="over120">{{foods[1].protein}}% (초과)</span>
						</template>
						<template v-else-if="foods[1].protein <120 && foods[1].protein > 90">
							<span class ="less120over90">{{foods[1].protein}}% (적정)</span>
						</template>
						<template v-else> {{foods[1].protein}}% </template>
						</td>
					<td><template v-if="foods[1].fat >= 120">
							<span class ="over120">{{foods[1].fat}}% (초과)</span>
						</template>
						<template v-else-if="foods[1].fat <120 && foods[1].fat > 90">
							<span class ="less120over90">{{foods[1].fat}}% (적정)</span>
						</template>
						<template v-else> {{foods[1].fat}}% </template>
						</td>
					<td><template v-if="foods[1].natrium >= 120">
							<span class ="over120">{{foods[1].natrium}}% (초과)</span>
						</template>
						<template v-else-if="foods[1].natrium <120 && foods[1].natrium > 90">
							<span class ="less120over90">{{foods[1].natrium}}% (적정)</span>
						</template>
						<template v-else> {{foods[1].natrium}}% </template>
						</td>
					<td><template v-if="foods[1].chole >= 120">
							<span class ="over120">{{foods[1].chole}}% (초과)</span>
						</template>
						<template v-else-if="foods[1].chole <120 && foods[1].chole > 90">
							<span class ="less120over90">{{foods[1].chole}}% (적정)</span>
						</template>
						<template v-else> {{foods[1].chole}}% </template>
						</td>
					<td><template v-if="foods[1].transfat >= 0">
							<span>-</span>
						</template>
					</td>
					<td><template v-if="foods[1].fattyacid >= 120">
							<span class ="over120">{{foods[1].fattyacid}}% (초과)</span>
						</template>
						<template v-else-if="foods[1].fattyacid <120 && foods[1].fattyacid > 90">
							<span class ="less120over90">{{foods[1].fattyacid}}% (적정)</span>
						</template>
						<template v-else> {{foods[1].fattyacid}}% </template>
						</td>
				</tr>
			</table>
			<hr>
		</div>
	</div>
	<script type="text/javascript">
		var userid = '${user.id}';
		
		new Vue ({
			el:'#app',
			data(){
				return {
					searchField:'whole',
					question:'',
					isss:true,
					foods:[],
				}
			},
			
			mounted(){
				axios
				.post('getTodayAteFoods/'+userid)
					.then(response => (this.foods = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
			}
		});
	</script>
	
	
	
	<div id="atefoodView">
		<div id="resultWrapper">
			<table class="resultTable">
				<tr>
					<th>이미지</th>
					<th>음식 이름</th>
					<th>개수</th>
					<th>일자</th>
					<th>비고</th>
				</tr>
				
				<template v-for="food in foods">
				<tr>
					<td><img v-bind:src="'./static/'+food.img" width="150"></td>
					<td><a v-bind:href="'./food/foodview?code='+food.code">{{food.name}}</a></td>
					<td>{{food.num}}개</td>
					<td>{{food.date}}</td>
					<td>
						<button @click="ateFoodDelete(food.getatekey)">삭제</button>
					</td>
				</tr>
				</template>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var userid = '${user.id}';
		new Vue ({
			el:'#atefoodView',
			data(){
				return {
					searchField:'whole',
					question:'',
					isss:true,
					foods:[],
				}
			},
			
			mounted(){
				axios
				.post('getAteFoods/'+userid)
					.then(response => (this.foods = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
			},
			
			methods:{
				ateFoodDelete:function(key){
					axios
					.delete('ateFoodDelete/'+key)
						.then(response => (this.answers = response.data))
						.catch(error => {
							console.log(error)
							this.errored = true
						})
						.finally(location.href='atefoodform')
				}
			}
		});
 	</script>
	</section>

	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
