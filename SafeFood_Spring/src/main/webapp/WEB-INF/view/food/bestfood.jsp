<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>

<style type="text/css">
#searchs {
	color: white;
	text-align: center;
}
td {
	text-align: center;
	width: 150px;
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
	
	<jsp:include page="../include/header.jsp" flush="false" />
	<br id="clear">
	
	<div id="bestfoodViewWrapper">
		<div id="bestfoodView">
			<table class="resultTable" id="resultTable">
				<tr>
					<th>이미지</th>
					<th onclick="sortTable(0)" v-on:click="select('name')">
						<template v-if="selname==true && name == 1"> 
							<span class="selected">음식 이름 ▼</span>
						</template>
						<template v-if="selname==true && name == 2">
							<span class="selected">음식 이름 ▲</span>
						</template>
						<template v-if="selname==false">음식 이름</template>
					</th>
					<th onclick="sortNumTable(2)" v-on:click="select('count')">
						<template v-if="selcount==true && count == 1"> 
							<span class="selected">조회수▼</span>
						</template>
						<template v-if="selcount==true && count == 2">
							<span class="selected">조회수▲</span>
						</template>
						<template v-if="selcount==false">조회수</template>
					</th>
					<th onclick="sortNumTable(3)" v-on:click="select('ate')">
						<template v-if="selate==true && ate == 1"> 
							<span class="selected">섭취량▼</span>
						</template>
						<template v-if="selate==true && ate == 2">
							<span class="selected">섭취량▲</span>
						</template>
						<template v-if="selate==false">섭취량</template>
					</th>
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
	<div style="padding-bottom: 100px;"></div>
	<jsp:include page="../include/footer.jsp" flush="false" />
	<script type="text/javascript">
		new Vue ({
			el:'#bestfoodView',
			data(){
				return {
					foods:[],
					selname:false,
					selcount:false,
					selate:false,
					name:0,
					count:0,
					ate:0
				}
			},
			
			mounted(){
				this.selcount = true
				this.count = 1
			
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
				select:function(temp){
					if(temp == "name"){
						this.selname = true
						this.selcount = false
						this.selate = false
						if(this.name == 1){
							this.name = 2
						}else {
							this.name = 1
						}
						this.count = 0
						this.ate= 0
					}
					else if(temp == "count"){
						this.selname = false
						this.selcount = true
						this.selate = false
						if(this.count == 1){
							this.count = 2
						}else {
							this.count = 1
						}
						this.ate = 0
						this.name = 0
					}
					else if(temp == "ate"){
						this.selname = false
						this.selcount = false
						this.selate = true
						if(this.ate == 1){
							this.ate = 2
						}else {
							this.ate = 1
						}
						this.count = 0
						this.name = 0
					}
				},
				
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

	
	<script type="text/javascript">
	function sortTable(n) {
		  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
		  table = document.getElementById("resultTable");
		  switching = true;
		  dir = "asc"; 
		  while (switching) {
		    
		    switching = false;
		    rows = table.rows;
		    for (i = 1; i < (rows.length - 1); i++) {
		      shouldSwitch = false;
		      x = rows[i].getElementsByTagName("TD")[n];
		      y = rows[i + 1].getElementsByTagName("TD")[n];
		     
		      if (dir == "asc") {
		        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
		          shouldSwitch= true;
		          break;
		        }
		      } else if (dir == "desc") {
		        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
		          shouldSwitch = true;
		          break;
		        }
		      }
		    }
		    if (shouldSwitch) {
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		      switchcount ++;      
		    } else {
		      if (switchcount == 0 && dir == "asc") {
		        dir = "desc";
		        switching = true;
		      }
		    }
		  }
		}
	</script>
	
	<script type="text/javascript">
	function sortNumTable(n) {
		  var table, rows, switching, i, x, y, shouldSwitch, switchcount =0;
		  table = document.getElementById("resultTable");
		  switching = true;
		  dir = "desc"; 
		  while (switching) {
		    switching = false;
		    rows = table.rows;
		    for (i = 1; i < (rows.length - 1); i++) {
		      shouldSwitch = false;
		      x = rows[i].getElementsByTagName("TD")[n];
		      y = rows[i + 1].getElementsByTagName("TD")[n];
		     
		      if (dir == "asc") {
		    	  if (Number(x.innerHTML.substring(0,x.innerHTML.length-1)) > Number(y.innerHTML.substring(0,y.innerHTML.length-1))) {
			        shouldSwitch = true;
			        break;
			      }
		      } else if (dir == "desc") {
		    	  if (Number(x.innerHTML.substring(0,x.innerHTML.length-1)) < Number(y.innerHTML.substring(0,y.innerHTML.length-1))) {
			        shouldSwitch = true;
			        break;
			      }
		      }
		    }
		    if (shouldSwitch) {
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		      switchcount ++;
		    } else {
	      	if (switchcount == 0 && dir == "desc") {
		        dir = "asc";
		        switching = true;
		      }
		    }
		  }
		}
	</script>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
