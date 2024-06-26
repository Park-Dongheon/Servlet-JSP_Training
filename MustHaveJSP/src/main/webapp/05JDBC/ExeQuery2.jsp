<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사용자 'musthave' 가 작성한 board 목록 출력2</h2>
	<%
	// 쿼리문
	String sql = "SELECT * FROM board WHERE id = ?";
	
	// DB에 연결
	try (JDBConnect jdbc = new JDBConnect();
		PreparedStatement psmt = jdbc.getConnection().prepareStatement(sql)) {
		psmt.setString(1, id);
		ResultSet rs = psmt.executeQuery();
		
		out.println("<table border='1'>");
		out.println("<tr><th>num</th><th>title</th><th>content</th><th>id</th><th>postdate</th><th>visitcount</th></tr>");
		while (rs.next()) {
			int num2 = rs.getInt(1);
			String title2 = rs.getString("title");
			String content2 = rs.getString("content");
			String id2 = rs.getString("id");
			java.sql.Date postdate2 = rs.getDate("postdate");
			String visitcount2 = rs.getString("visitcount");
			
			out.println("<tr>");
			out.println(String.format("<td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>", num2, title2, content2, id2, postdate2, visitcount2));
			out.println("</tr>");
			
		}
		out.println("</table>");
	} catch (Exception e) {
		out.println(e.getMessage());
	}
	
	%>
</body>
</html>