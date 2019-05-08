<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
</head>
<body>
<h1>잘왔습니다12</h1>
	<div id="app">
	<!-- <div @click="boardlist">목록 조회</div> -->
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
					<td class="title"><a href="${boardview}?idx=${board.idx}" name="title">{{board.title}}</a>
						<input type="hidden" id="IDX" value="${row.IDX }"></td>
					<td>{{board.create_id}}</td>
				</tr>
			</tbody>
		</table>
	</div>
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
				.get('/getboards')
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