<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public String gugudan(int dan) {
	StringBuffer result = new StringBuffer();
	for(int i = 1; i < 10; i++) {
		result.append(dan).append("*").append(i).append("=").append(dan * i).append("<br/>");
	}
	return result.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
<%
String result;
//int dan = 2;

try {
	int dan = Integer.parseInt(request.getParameter("dan"));
	
	result = gugudan(dan);			
} catch (Exception e) {
	result = "Invalid";
}
	//for(int i = 1; i <= 9; i++) {
	//	out.println(dan + "*" + i + "=" + (dan * i) + "<br />");
	//}
%>
<%= result %>

</body>
</html>