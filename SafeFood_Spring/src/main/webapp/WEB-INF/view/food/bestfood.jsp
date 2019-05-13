<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>

<style type="text/css">
#mainbar {
	width: 100%;
}
#searchs {
	color: white;
	text-align: center;
}
td {
	text-align: center;
	width: 150px;
}
footer{ position:fixed; 
  left:0px; 
  bottom:0px; 
  height:100px; 
  width:100%; 
  background:grey; 
  color: white; 
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
#clear{
	clear: both;
}

#bestButtons{
	text-align: center;
}
#bestfoodViewWrapper{
	text-align: center;
}
#bestfoodView{
	display: inline-block;
}
</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	
	<div id="mainbar" style="background-image: url(${plz});">
		<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
			<h1>베스트 섭취 정보</h1>
		</div>
	</div>
	<br id="clear">
	
	
	<div id="bestButtons">
		<button>조회순</button>
		<button>섭취순</button>
	</div>
	<div id="bestfoodViewWrapper">
		<div id="bestfoodView">
			<table class="resultTable">
				<tr>
					<th>이미지</th>
					<th>음식 이름</th>
					<th>조회수</th>
					<th>섭취량</th>
				</tr>
				
				<template v-for="food in foods">
				<tr>
					<td><img v-bind:src="'./static/'+food.img" width="150"></td>
					<td><a v-bind:href="'./food/foodview?code='+food.code">{{food.name}}</a></td>
					<td>{{food.count}}회</td>
					<td>{{food.atecount}}회</td>
				</tr>
				</template>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		new Vue ({
			el:'#bestfoodView',
			data(){
				return {
					foods:[],
				}
			},
			
			mounted(){
				axios
				.post('getBestFoods/'+1)
					.then(response => (this.foods = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false);
			},
			
			methods:{
				getBestFoods :function(index){
					axios
					.post('getBestFoods/'+index)
						.then(response => (this.foods = response.data))
						.catch(error => {
							console.log(error)
							this.errored = true
						})
						.finally(()=> this.loading = false);
				}
			}
		});
 	</script>

	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
