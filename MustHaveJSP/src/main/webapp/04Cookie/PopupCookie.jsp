<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String chkVal = request.getParameter("inactiveToday");		// "inactiveToday" 매개변수의 값 얻기

if (chkVal != null && chkVal.equals("1")) {		// 값이 "1"이면 쿠키를 생성해 응답 객체에 추가
	Cookie cookie = new Cookie("PopupClose", "off");	// 쿠키 생성
	cookie.setPath(request.getContextPath());		// 경로 설정
	cookie.setMaxAge(60*60*24);		// 유지 기간 설정
	response.addCookie(cookie);		// 응답 객체에 추가
	out.println("쿠키 : 하루 동안 열지 않음");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>