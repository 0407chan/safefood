<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang=''>
<head>
<meta charset='utf-8'>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="script.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">


header {
	background-image: url("img/banner.png");
	width: 100%;
	height: 150px;
}

section {
	text-align: center;
}

#search {
	text-align: center;
	color: white;
}

.signUpBoxItem {
	display: inline-block;
	text-align: left;
	width: 120px;
	fload: left;
	margin: 10px;
}

.signUpBox {
	background-color: gray;
	width: 500px;
}

.alergeCheck {
	background-color :red;
	width: 200px;
	border: 2px soild;
}

#signUp{
	background-color: gray;
	width: 500px;
	padding: 20px;
	margin-top: 20px;
	
}
#signUpBoxBorder{
	border: 1px solid;
	width: 200px;
	padding: 10px;
}
#signUpBoxBorderCheck{
	background-color: gray;
	margin-top: -20px;
	width: 40px;
}
#mainbar {
	width:100%;
}
#searchs{
	color: white;
	text-align: center;
}

</style>
</head>
<body>
	<c:url value="/static/img/background.png" var="plz"/>
	
	<div id="mainbar" style="background-image: url(${plz});">
		<jsp:include page="../include/header.jsp" flush="false" />
	</div>
	
	<div id="app">
		<table class="board_list">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="board in boards">
					<td>{{board.idx}}</td>
					<td class="title"><a href="${boardview}?idx=${board.idx}" name="title">{{board.content}}</a>
						<input type="hidden" id="IDX" value="${row.IDX }"></td>
					<td>{{board.userid}}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <footer>
		<jsp:include page="../include/footer.jsp" flush="false" />
	</footer>
	<script type="text/javascript">
		new Vue ({
			el:'#app',
			data(){
				return {
					info: null,
					loading: true,
					errored: false,
					boards:[]
				}
			},
			mounted(){
				axios
				.get('getboards')
					.then(response => (this.boards = response.data))
					.catch(error => {
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false)
			}
		})
 	</script>
</body>
</html>
