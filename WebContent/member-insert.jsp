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
<title>Insert title here</title>
</head>
<body>



<header> 쇼핑몰 회원관리 ver1.0 </header>

	<nav>
		<ul>
			<li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
			
			<li><a href="<%=rPath%>/member-list.jsp">회원목록조회/수정</a></li>
			
			<li><a href="<%=rPath%>/member-sales.jsp">회원매출조회</a></li>
			
			<li><a href="<%=rPath%>/">홈으로</a></li>
		
		</ul>
	</nav>
	
		<section>
		<h3>홈쇼핑 회원 등록</h3>
 	<%
 	request.setCharacterEncoding("utf-8");
 	String custno="";
		if(request.getParameter("custname")!=null){
			String custname=request.getParameter("custname");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String joindate = request.getParameter("joindate");
			String grade = request.getParameter("grade");
			String city = request.getParameter("city");
			String sql="insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)values(?, ?, ?,?,?,?)";
			Connection con = Connector.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,custname);
			ps.setString(2,phone);
			ps.setString(3,address);
			ps.setString(4,joindate);
			ps.setString(5,grade);
			ps.setString(6,city);
			int result = ps.executeUpdate();
			if(result==1){
				out.write("<script>");
				out.write("alert('회원 등록이 완료 되었습니다')");
				out.write("</script>");
			}
		}else{
			String sql="select seq_custno.nextval from dual";
			Connection con = Connector.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				custno=rs.getString(1);
			}
		}
		
		
	%>
	<form method="post">
<table border="1">
	
	<tr>
		
		<th>회원번호</th>
		<td><input type="text" name="custno" value="<%=custno%>" ></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname"></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type="text" name="address" ></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type="text" name="joindate"></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP, B:일반 C:직원]</th>
		<td><input type="text" name="grade"></td>
	</tr>
	<tr>
		<th>도시코드</th>
		<td><input type="text" name="city" ></td>
	</tr>
	
	<tr>
	<th colspan="2"><button >등록</button> <a href="<%=rPath%>/member-list.jsp"><button type="Button">조회</button></a></th>
	</tr>
</table>
</form>
	</section>
	
	<footer> 저작권어쩌구저쩌구 </footer>
	
	
	
</body>
</html>