<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String rPath=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>

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
	height: 700px;
}

header {
	text-align: center;
	background-color: blue;
	color: white;
	heigt: 50px;
}

footer {
	bottom: 0px;
	text-align: center;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>

	<header> 쇼핑몰 회원관리 ver1.0 </header>

	<nav>
		<ul>
			<li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
			
			<li><a href="<%=rPath%>/member-list.jsp">회원목록조회/수정</a></li>
			
			<li><a href="<%=rPath%>/member-sales.jsp">회원매출조회</a></li>
			
			<li><a href="<%=rPath%>/">홈으로</a></li>
			</a>
		</ul>
	</nav>
	<section>
		<h3>회원목록조회/수정</h3>
<%
Connection con = Connector.getConnection();
String sql = "select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD') as joindate,decode(grade,'A','VIP','B','일반','C','직원') as grade,city from member_tbl_02";
PreparedStatement ps = con.prepareStatement(sql);
ps.executeQuery();
ResultSet rs = ps.executeQuery();
%>
<table border="1">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
<%
while(rs.next()){
%>
	<tr>
		<td><a href="<%=rPath%>/member-update.jsp?custno=<%=rs.getInt("custno")%>"><%=rs.getInt("custno")%></a></td>
		<td><%=rs.getString("custname")%></td>
		<td><%=rs.getString("phone")%></td>
		<td><%=rs.getString("address")%></td>
		<td><%=rs.getString("joindate")%></td>
		<td><%=rs.getString("grade")%></td>
		<td><%=rs.getString("city")%></td>
	</tr>

<% 
}
%>
</table>
	</section>
	<footer> 저작권어쩌구저쩌구 </footer>
</body>
</html>