<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<!-- JSP 스크립틀릿, Java 코드를 직접 삽입할 수 있는 JSP 기능 -->
	<%
	// 변수 선언
	String result;
	int dan = 2;

	try {
		// HTTP 요청을 통해 전달된 dan 파라미터 값 가져오기
		// ex) http://localhost:8080/missionJSP/Gugudan1.jsp?dan=2
		dan = Integer.parseInt(request.getParameter("dan"));

	} catch (Exception e) {
		// 예외 발생 시 처리
		result = "Invalid";		// dan 파라미터가 정수가 아닌 경우 "Invalid" 문자열을 result에 할당
	}
	// 웹 페이지에 출력
	out.print(String.format("<h2>%d단</h2>", dan));		// dan을 포맷 문자열 출력
	// 구구단 출력
	for (int i = 1; i <= 9; i++) {
		out.println(dan + " * " + i + " = " + (dan * i) + "<br />");
	}
	%>

</body>
</html>