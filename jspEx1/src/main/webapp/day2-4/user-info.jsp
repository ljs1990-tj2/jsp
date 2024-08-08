<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>

</head>
<body>
	<%@include file="db.jsp"%>
	<%
	ResultSet rs = null;
	Statement stmt = null;
	String id = request.getParameter("userId");
	try {
		stmt = conn.createStatement();
		String query = "SELECT * FROM TBL_USER WHERE userId='" + id + "'";
		rs = stmt.executeQuery(query);
		
		if (rs.next()) {
	%>
			<div><%= rs.getString("userId") %></div>
			<div><%= rs.getString("name") %></div>
			<div><%= rs.getString("status") %></div>
	<%
		} else {
			out.println("삭제된 아이디 입니다.");
		}
	} catch (SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	
	%>

</body>
</html>