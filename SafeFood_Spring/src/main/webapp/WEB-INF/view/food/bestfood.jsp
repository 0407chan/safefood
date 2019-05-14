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
.selected{
	color: blue;
	font-style: bold;
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
						<template v-if="selcount==true"> <span class="selected">조회수 ▼</span>
						</template>
						<template v-else> 조회수 </template>
					</th>
					<th onclick="sortNumTable(3)" v-on:click="select('ate')">
						<template v-if="selate==true"> <span class="selected">섭취량 ▼</span>
						</template>
						<template v-else>섭취량</template>
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
					selname:false,
					selcount:false,
					selate:false,
					name:0
				}
			},
			
			mounted(){
				this.selcount = true
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
						}else if(this.name == 0){
							this.name = 1
						}else{
							this.name = 1
						}
					}
					else if(temp == "count"){
						this.selname = false
						this.selcount = true
						this.selate = false
						this.name = 0
					}
					else if(temp == "ate"){
						this.selname = false
						this.selcount = false
						this.selate = true
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
		    /*Loop through all table rows (except the
		    first, which contains table headers):*/
		    for (i = 1; i < (rows.length - 1); i++) {
		      //start by saying there should be no switching:
		      shouldSwitch = false;
		      /*Get the two elements you want to compare,
		      one from current row and one from the next:*/
		      x = rows[i].getElementsByTagName("TD")[n];
		      y = rows[i + 1].getElementsByTagName("TD")[n];
		     
		      /*check if the two rows should switch place,
		      based on the direction, asc or desc:*/
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
		  var table, rows, switching, i, x, y, shouldSwitch;
		  table = document.getElementById("resultTable");
		  switching = true;
		  /*Make a loop that will continue until
		  no switching has been done:*/
		  while (switching) {
		    //start by saying: no switching is done:
		    switching = false;
		    rows = table.rows;
		    /*Loop through all table rows (except the
		    first, which contains table headers):*/
		    for (i = 1; i < (rows.length - 1); i++) {
		      //start by saying there should be no switching:
		      shouldSwitch = false;
		      /*Get the two elements you want to compare,
		      one from current row and one from the next:*/
		      x = rows[i].getElementsByTagName("TD")[n];
		      y = rows[i + 1].getElementsByTagName("TD")[n];
		      //check if the two rows should switch place:
		      if (Number(x.innerHTML.substring(0,1)) < Number(y.innerHTML.substring(0,1))) {
		        //if so, mark as a switch and break the loop:
		        shouldSwitch = true;
		        break;
		      }
		    }
		    if (shouldSwitch) {
		      /*If a switch has been marked, make the switch
		      and mark that a switch has been done:*/
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		    }
		  }
		}
	</script>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>
