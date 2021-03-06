<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
a:link, a:visited {
	text-decoration: none;
	color: #656565;
}
#clear{
	clear: both;
}
#wrap{
	margin:0 auto;
	text-align: center;
	width:50%;
}
#left{
	width:50%;
	float: left;
}
#right{
	width:50%;
	float: right;
	text-align:left;
}
.title{
	font-weight: bold;
}
.content{
	font-weight: normal;
}
#jump{
	padding-bottom: 400px;
}
#meesage{
	margin:0 auto;
	text-align: center;
	width:80%;
}
</style>
<head>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://unpkg.com/vue"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);

	var car = ${food.carbo};
	var pro = ${food.protein};
	var fat = ${food.fat};
	var sug = ${food.sugar};
	var nat = ${food.natrium}/1000;
	var cho = ${food.chole};
	var fatty = ${food.fattyacid};
	var tra = ${food.transfat};
	nat = nat * 10;
	nat = nat / 10;
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], 
				[ '탄수화물　 : '+car+'g', car ], [ '단백질　　 : '+pro+'g', pro ], [ '지방　　　 : '+fat+'g', fat ], [ '당류　　　 : '+sug+'g', sug ],
				[ '나트륨　　 : '+nat+'mg', nat ], [ '콜레스테롤 : '+cho+'mg', cho ], [ '포화지방산 : '+fatty+'mg', fatty ],
				[ '트랜스지방 : '+tra+'mg', tra ], ]);

		var options = {
			title : '영양 정보',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>

<style type="text/css">
#clear{
	clear: both;
}
#wrap{
	margin:0 auto;
	text-align: center;
	width:50%;
}
#left{
	width:50%;
	float: left;
}
#right{
	width:50%;
	float: right;
	text-align:left;
}
.title{
	font-weight: bold;
}
.content{
	font-weight: normal;
}
#jump{
	padding-bottom: 400px;
}
#meesage{
	margin:0 auto;
	text-align: center;
	width:80%;
}
</style>

</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<c:url value="/static/" var="loc" />
	<c:url value="/addAteFood?code=${food.code}" var="addAteFood"/>
	
	<jsp:include page="../include/header.jsp" flush="false" />
	
	<div id="wrap">
		<div id="left">
			<div class="imgbox">
				<img style="width:300px; height:300px;" class="foodimg" src="${loc}${food.img}">
			</div>
		</div>	
		<div id="right">
			<p>
				<span class="title">제품명</span>  <span id="name" class="content">${food.name}</span>
			</p>
			<p>
				<span class="title">제조사</span>  <span id="maker" class="content">${food.maker}</span>
			</p>
			<p>
				<span class="title">원재료</span>  <span id="material" class="content">${food.material}</span>
			</p>
			<c:if test="${sessionScope.user!=null}">
				<p>
					<span class="title">알레르기</span>  
					<c:forEach items="${foodA}" var="fa">
						<c:if test="${not empty foodmyA}">
							<span class="contnet"
							<c:if test="${fn:contains(foodmyA,fa)}">style= "color : red"</c:if>>${fa}</span>
						</c:if>
					</c:forEach>
				</p>
			</c:if>
			<c:if test="${sessionScope.user==null}">
				<p>
					<span class="title">알레르기</span>
					<c:forEach items="${foodA}" var="fa">
						<span class="content">${fa}</span>
					</c:forEach>
				</p>
			</c:if>
			<p>
				<c:if test="${sessionScope.user!=null}">
				<form method="post" action="${addAteFood}">
					<span class="title">수량</span> 
					<input type="number" name="number" id="number" min=0 required="required">
					<button id="btn2" class="btn btn-default" type="submit">
						<span aria-hidden="true">추가</span>
					</button>
				</form>
				<button id="btn2" class="btn btn-default" onclick="addExpFood()">
					<span aria-hidden="true">찜</span> 
				</button>
				</c:if>
			</p>
			
		</div>
		<br id="clear">
		<h3>${msg}</h3>	
		<div id="donutchart" style="width:750px; height:400px;"></div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
	<script type="text/javascript">
		addExpFood = function(){
			var link = document.location.href; 
			var code = ${food.code};
			var number = document.getElementById("number").value;
			if(number == 0){
				number = 1
			}
			if(link.indexOf('foodview') >= 0){
				location.href = "../addExpFood?code="+code+"&number="+number;
			}else{
				location.href = "./addExpFood?code="+code+"&number="+number;
			}
			
		}
	</script>
</body>
</html>