<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
#imgbox {
	float: left;
}

#textbox {
	float: left;
}

footer {
	text-align: center;
	color : black;
	left:0px; 
	position:absolute;
	bottom:0px; 
	height:100px; 
	width:100%; 
}
ul{
list-style:none;
}
</style>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);

	var sup = ${food.supportpereat};
	var cal = ${food.calory};
	var car = ${food.carbo};
	var pro = ${food.protein};
	var fat = ${food.fat};
	var sug = ${food.sugar};
	var nat = ${food.natrium};
	var cho = ${food.chole};
	var fatty = ${food.fattyacid};
	var tra = ${food.transfat};

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ '일일제공량 : '+sup+'g', sup ], [ '칼로리　　 : '+cal+'kcal', cal ],
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

</head>
<body>
	<c:url value="/static/img/background.png" var="plz" />
	<c:url value="/static/" var="loc" />

	<jsp:include page="../include/header.jsp" flush="false" />
	
	<div id="info">
		<div class="imgbox">
			<img width="300" class="foodimg" src="${loc}${food.img}">
		</div>
		<div class="textbox">
			<p>
				제품명 <span id="name">${food.name}</span>
			</p>
			<p>
				제조사 <span id="maker">${food.maker}</span>
			</p>
			<p>
				원재료 <span id="material">${food.material}</span>
			</p>
			
			<c:choose>
			<c:when test="${not empty user}">
				<p>
					알레르기 성분
					<c:forEach items="${foodA}" var="fa">
						<c:if test="${not empty foodmyA}">
							<span 
							<c:if test="${fn:contains(foodmyA,fa)}">style= "color : red"</c:if>>${fa}</span>
						</c:if>
					</c:forEach>
				</p>
				
				
				<p>Quantity</p>
				
				<c:url value="/addAteFood?code=${food.code}" var="addAteFood"/>
				<form method="post" action="${addAteFood}">
					<input type="number" id="numberFood" name="number" min=0 required="required">
						<button id="btn2" class="btn btn-default" type="submit">
							<span aria-hidden="true">추가</span>
						</button>
						<button id="btn2" class="btn btn-default" onclick="expFoodAdd()">
							<span >찜</span> 
						</button>
					
				</form>
				<h3>${msg}</h3>
		
			</c:when>
			<c:otherwise>
				<p>
				알레르기 성분 <c:forEach items="${foodA}" var="fa">
							<span >${fa}</span>
						</c:forEach>
				</p>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br class="clear">
	
	<div id="donutchart" style="width: 750px; height: 400px;"></div>
	
	<jsp:include page="../include/footer.jsp" flush="false" />
	<script type="text/javascript">
		function expFoodAdd() {
			var num = document.getElementById("numberFood").value;
			console.log(${food.code} + ' '+ num);
			location.href = "../../index";
			location.href = "/addExpFood?code=${food.code}&num="+num+"";
		}
	</script>
</body>
</html>