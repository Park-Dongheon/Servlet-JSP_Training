<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<%
	int col;

	try {
		// http://localhost:8080/missionJSP/Gugudan1.jsp?dan=2
		col = Integer.parseInt(request.getParameter("col"));

	} catch (Exception e) {}
	
	for (col) {
		
		for (int i = 2; i <= 9; i++) {
			out.print(String.format("<h2>%d단</h2>", i));
			for (int j = 1; j <= 9; j++) {
				out.print(i + "*" + j + "=" + (i * j) + "<br />");
			}
			out.print("<br />");
		}
	}
	%>
</body>
</html>