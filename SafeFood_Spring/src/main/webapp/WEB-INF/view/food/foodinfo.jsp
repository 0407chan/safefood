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

#searchs {
	color: white;
	text-align: center;
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
				[ 'Task', 'Hours per Day' ], [ '일일제공량', sup ], [ '칼로리', cal ],
				[ '탄수화물', car ], [ '단백질', pro ], [ '지방', fat ], [ '당류', sug ],
				[ '나트륨', nat ], [ '콜레스테롤', cho ], [ '포화 지방산', fatty ],
				[ '트랜스지방', tra ], ]);

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
	<div id="searchs">
		<h1>제품정보</h1>
	</div>
	
	<div id="info">
		<div>
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
						<input type="number" name="number" min=0 required="required">
							<button id="btn2" class="btn btn-outline-success my-2 my-sm-0" type="submit">
								<span class="glyphicon glyphicon-plus" aria-hidden="true">추가</span>
							</button>
					</form>
					<h3>${msg}</h3>
					<button id="btn3" class="btn btn-outline-success my-2 my-sm-0" type="submit">
						<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">찜</span>
					</button>
			
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
	</div>
	<br class="clear">
	<div id="donutchart" style="width: 900px; height: 500px;"></div>

	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>