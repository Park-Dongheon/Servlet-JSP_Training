<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp" %>		<!-- 다른 JSP 파일(IncludeFile.jsp) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
</head>
<body>
<%
out.println("오늘 날짜 : " + today);		// IncludeFile.jsp에서 선언한 변수 사용
out.println("</br>");
out.println("내일 날짜 : " + tomorrow);
out.println("</br>");
%>
<%= add(1, 2) %>
</body>
</html>