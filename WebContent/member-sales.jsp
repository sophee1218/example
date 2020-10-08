<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String rPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
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
   <header>
      <h2>쇼핑몰 회원관리 ver1.0</h2> 
   </header>
   <nav>
      <ul>
         <li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
         <li><a href="<%=rPath%>/member-list.jsp">회원목록조회/수정</a></li>
         <li><a href="<%=rPath%>/member-sales.jsp">회원매출조회</a></li>
         <li><a href="<%=rPath%>">홈으로</a></li>
      </ul>
   </nav>
   <section>
      <h3 style="text-align: center">회원매출조회</h3>
<%
Connection con = Connector.getConnection();
String sql = "select met.custno,met.custname,sum(price) as price ,met.grade from money_tbl_02 mot ,member_tbl_02 met"
         +" where mot.custno=met.custno "
         +" group by met.CUSTNO,met.custname,met.grade "
         +" order by price desc";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<table border="1" style="text-align: center;">
   <tr>
      <th>회원번호</th>
      <th>회원성명</th>
      <th>매출</th>
      <th>고객등급</th>
   </tr>
<%
while(rs.next()){
%>
   <tr>
      <td><%=rs.getInt("custno") %></td>
      <td><%=rs.getString("custname") %></td>
      <td><%=rs.getString("price") %></td>
      <td><%=rs.getString("grade") %></td>
   </tr>
<%
}
%>
</table>
   </section>
   <footer>
      저작권 어쩌구!! 
   </footer>
   
</body>
</html>