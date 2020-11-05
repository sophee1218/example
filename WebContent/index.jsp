<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String rPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
* {
	margin: auto 0;
	padding: 0;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

li {
	margin: 15px;
	float: left;
}

section {
	clear: both;
	height:700px;
}

header{
	text-align:center;
	background-color:blue;
	color:white;
	heigt:50px;
}
footer {
	bottom: 0px;
	text-align : center;
}
h3{
	text-align : center;
}
</style>
</head>
<body>
	<header> 쇼핑몰 회원관리 ver1.0 </header>

	<nav>
		<ul>
			<li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
			
			<li><a href="<%=rPath%>/member-list.jsp">회원목록조회/수정</a></li>
			
			<li><a href="<%=rPath%>/member-sales.jsp">회원매출조회	</a></li>
			
			<li><a href="<%=rPath%>/">홈으로</a></li>
			
		</ul>
	</nav>
	<section>
		<h3>쇼핑몰 회원관리 프로그램</h3>
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다<br>
		프로그램 작성 순서<br>
		1 회원정보 테이블을 생성한다<br>
		2 매출정보 테이블을 생성한다<br>
		3 회원정보, 매출정보 테이블에 제시된 문서지의 참조데이터를 추가 생성한다<br>
		4 회원정보 입력 화면프로그램을 작성한다<br>
		5 회원정보 조회 프로그램을 작성한다<br>
		6 회원매출정보 조회 프로그램을 작성한다<br>
	</section>
	<footer> 저작권어쩌구저쩌구 </footer>
</body>
</html>