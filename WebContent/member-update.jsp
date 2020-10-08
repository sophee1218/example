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
<title>홈쇼핑 회원 등록</title>
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
<%
request.setCharacterEncoding("UTF-8");
if(request.getParameter("custname")!=null){
   Connection con = Connector.getConnection();
   String sql = "update member_tbl_02 set custname=?, phone=?, address=?, grade=?, city=? where custno=?";
   PreparedStatement ps = con.prepareStatement(sql);
   ps.setString(1, request.getParameter("custname"));
   ps.setString(2, request.getParameter("phone"));
   ps.setString(3, request.getParameter("address"));
   ps.setString(4, request.getParameter("grade"));
   ps.setString(5, request.getParameter("city"));
   ps.setInt(6, Integer.parseInt(request.getParameter("custno")));
   int result = ps.executeUpdate();
   if(result==1){
      out.write("<script>alert('회원정보 수정이 완료되었습니다.')</script>");
   }
}
Connection con = Connector.getConnection();
String custno = request.getParameter("custno");
String sql = "select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD') as joindate,grade,city from member_tbl_02 "
         +" where custno=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(custno));
ResultSet rs = ps.executeQuery();
if(rs.next()){
%>
<h3 style="text-align: center">홈쇼핑 회원 등록</h3>
<div style="align-items: center;">
   <form method="POST">
      <table border="1">
         <tr>
            <td>회원번호</td>
            <td><input type="number" name="custno" value="<%=rs.getInt("custno")%>" readonly></td>  
         </tr>
         <tr>
            <td>회원성명</td>
            <td><input type="text" name="custname" value="<%=rs.getString("custname")%>"></td>  
         </tr>
         <tr>
            <td>회원전화</td>
            <td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>  
         </tr>
         <tr>
            <td>회원주소</td>
            <td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>  
         </tr>
         <tr>
            <td>가입일자</td>
            <td><input type="text" name="joindate" value="<%=rs.getString("joindate") %>" readonly></td>  
         </tr>
         <tr>
            <td>고객등급(A:VIP,B:일반,C:직원)</td>
            <td><input type="text" name="grade" value="<%=rs.getString("grade")%>"></td>   
         </tr>
         <tr>
            <td>도시코드</td>
            <td><input type="number" min="0" name="city" value="<%=rs.getString("city")%>"></td>  
         </tr>
         <tr>
            <td colspan="2" align="center"><button>수정</button><a href="<%=rPath%>/member-list.jsp"></a><button type="button">취소</button></a></td>
         </tr>
      </table>
   </form>
</div>
<%
}
%>
</section>
<footer>
저작권 어쩌구!! 
</footer>
<script>

</script>
</body>
</html>