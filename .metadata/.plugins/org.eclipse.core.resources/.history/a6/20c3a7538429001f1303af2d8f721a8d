<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<h2 style="width:<%=col * 100 %>px; text-align:center;">구구단3</h2>
<div style="display:grid; grid-template-colums: repeat(<%=col%>)">
<%
	for(int i = 2; i <= 9; i++) {
		for(int k = 0; k <= 9; k++) {
			for(int j = 0; j < col; j++){
		}
	}
%>
</div>
<%
	int col = 1;

	try {
		col = Integer.parseInt(request.getParameter("col"));

	} catch (Exception e) {}
	
	
	int dan = 2;
	out.print("<table>");
	
	while (dan <= 9) {
		out.print("<tr>");
		for (int i = 0; i < col && dan <= 9; i++, dan++) {
			out.print("<td><h2>" + dan + "단</h2>");
			for (int j = 1; j <= 9; j++) {
				out.print(dan + "*" + j + "=" + (dan * j) + "<br />");				
			}
			out.print("</td>");
		}
		out.print("</tr>");		
	}
	out.print("</table>");
	%>
</body>
</html>