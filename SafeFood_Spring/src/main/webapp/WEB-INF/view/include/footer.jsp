<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<head>
<style type="text/css">
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
</head>
<c:url value="/test" var="test" />
<footer id = "footer" class="footer">
	<div class = "footer-inner">
		<ul class ="part-list">
		
			<a href="${test}">이용약관</a>
			<a href="#">개인정보취급방침</a>
		</ul>
		<address>
	        (주)멀티캠퍼스 서울특별시 강남구 언주로 508 10-17층
	        <span>(역삼동, 서울상록빌딩)</span>
	        
		</address>
		<div class = "footer-desc"> Copyright by Multicampus Co., Ltd. All rights reserved.
		</div>
	</div>
</footer>
