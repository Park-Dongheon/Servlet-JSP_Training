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
	String dir = "ver";

	try {
		// http://localhost:8080/missionJSP/Gugudan1.jsp?dan=2
		dir = request.getParameter("dir").toString();

	} catch (Exception e) {}
	
	if (dir.equalsIgnoreCase("ver")) {
		
		for (int i = 2; i <= 9; i++) {
			out.print(String.format("<h2>%d단</h2>", i));
			for (int j = 1; j <= 9; j++) {
				out.print(i + "*" + j + "=" + (i * j) + "<br />");
			}
			out.print("<br />");
		}
	} else if (dir.equalsIgnoreCase("hor")) {
		for (int i = 2; i <= 9; i++) {
			out.print(String.format("<h2>%d단</h2>", i));
			for (int j = 1; j <= 9; j++) {
				out.print(i + "*" + j + "=" + (i * j) + "&nbsp&nbsp&nbsp");
			}
			out.print("<br />");
		}
	}
	%>
</body>
</html>