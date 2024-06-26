<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<%
	// 쿼리문
	String sql = "SELECT id, pass, name, regidate FROM member";
	
	// DB에 연결
	try (JDBConnect jdbc = new JDBConnect()) {
		jdbc.executeQuery(sql);
        ResultSet rs = jdbc.getRs();
		// 결과 확인(웹 페이지에 출력)
		while (rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
		}
	}
	%>
</body>
</html>