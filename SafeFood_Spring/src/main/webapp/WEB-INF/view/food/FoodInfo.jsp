<%@page import="com.ssafy.model.dto.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% Food food = (Food) request.getAttribute("food");
%>

<style type="text/css">
	#imgbox{
		float : left;
	}
	#textbox{
		float: left;
	}
#mainbar {
	background-image: url("img/background.png");
	width:100%;
}
#searchs{
	color: white;
	text-align: center;
}

</style>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	
	var sup = <%= food.getSupportpereat()%>;
	var cal = <%= food.getCalory()%>;
	var car = <%= food.getCarbo()%>;
	var pro = <%= food.getProtein()%>;
	var fat = <%= food.getFat()%>;
	var sug = <%= food.getSugar()%>;
	var nat = <%= food.getNatrium()%>;
	var cho = <%= food.getChole()%>;
	var fatty = <%= food.getFattyacid()%>;
	var tra = <%= food.getTransfat()%>;
	
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			[ 'Task', 'Hours per Day' ], 
			[ '일일제공량', sup ],
			[ '칼로리', cal ], 
			[ '탄수화물', car ], 
			[ '단백질', pro ],
			[ '지방', fat ], 
			[ '당류', sug ], 
			[ '나트륨', nat ],
			[ '콜레스테롤', cho ], 
			[ '포화 지방산', fatty ], 
			[ '트랜스지방', tra ], 
			]);

		var options = {
			title : '영양 정보',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="styles.css">

</head>
<body>
<div id="mainbar">
	<jsp:include page="../include/header.jsp" flush="false" />
		<div id="searchs">
		<h1>제품정보</h1>
	</div>		
</div>
	<div id="info">
		<h1 class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></h1>
		<br>
		
		<div>
			<div class="imgbox">
				<img width="300" class="foodimg" src="<%=food.getImg()%>">
			</div>
			<div class="textbox">
				<p>
					제품명 <span id="name"><%=food.getName()%></span>
				</p>
				<p>
					제조사 <span id="maker"><%=food.getMaker()%></span>
				</p>
				<p>
					원재료 <span id="material"><%=food.getMaterial()%></span>
				</p>
				<p>
					알레르기 성분 <span><%=food.getAllergy()%></span>
				</p>
				<p>Quantity</p>
				<input type="number" name = number min = 0>
				<button id="btn2" class="btn btn-outline-success my-2 my-sm-0"
					type="submit">
					<span class="glyphicon glyphicon-plus" aria-hidden="true">추가</span>
				</button>
				<button id="btn3" class="btn btn-outline-success my-2 my-sm-0"
					type="submit">
					<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">찜</span>
				</button>
			</div>
		</div>
	</div>
	<br class="clear">
	<div id="donutchart" style="width: 900px; height: 500px;"></div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
</body>
</html>