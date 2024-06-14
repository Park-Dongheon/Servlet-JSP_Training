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
	<h2>사용자 'musthave' 가 작성한 board 목록 출력</h2>
	<%
	// 쿼리문
	String sql = "SELECT * FROM board WHERE id = 'musthave'";
	
	
	// DB에 연결
	try (JDBConnect jdbc = new JDBConnect()) {
		jdbc.executeQuery(sql);
		ResultSet rs = jdbc.getRs();
		
		out.println("<table border='1'>");
		out.println("<tr><th>num</th><th>title</th><th>content</th><th>id</th><th>postdate</th><th>visitcount</th></tr>");
		while (rs.next()) {
			int num = rs.getInt(1);
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
			java.sql.Date postdate = rs.getDate("postdate");
			String visitcount = rs.getString("visitcount");
			
			
			
			out.println("<tr>");
			out.println(String.format("<td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>", num, title, content, id, postdate, visitcount));
			out.println("</tr>");
			
			
		}
		out.println("</table>");
	} catch (Exception e) {
		out.println(e.getMessage());
	}
	
	%>
</body>
</html>