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
	// URL 파라미터로부터 'dir' 값을 가져옴
	String dir = request.getParameter("dir");
	
	// 'dir' 값이 null인 경우 기본값으로 'ver' 설정
	if (dir == null) {
		dir = "ver";	// 기본값 설정
	}
	
	// 'dir' 값이 'ver'일 때
	if (dir.equalsIgnoreCase("ver")) {
		
		// 각 구구단을 세로로 출력
		for (int i = 2; i <= 9; i++) {		// 단
			out.print(String.format("<h2>%d단</h2>", i));		// 현재 출력하는 구구단의 단수 출력
			for (int j = 1; j <= 9; j++) {		// 수
				out.print(i + " * " + j + " = " + (i * j) + "<br />");		// 구구단 계산 결과를 출력
			}
			out.print("<br />");		// 각 단이 끝날 때마다 줄바꿈
		}
	}
	// 'dr' 값이 'hor'일 때
	else if (dir.equalsIgnoreCase("hor")) {
		// 각 구구단을 가로로 출력
		for (int i = 2; i <= 9; i++) {		// 단
			out.print(String.format("<h2>%d단</h2>", i));		// 현재 출력하는 구구단의 단수 출력
			for (int j = 1; j <= 9; j++) {
				out.print(i + " * " + j + " = " + (i * j) + "&nbsp;&nbsp;&nbsp;");		// 구구단 계산 결과를 출력하고 공백을 추가하여 가로로 출력
			}
			out.print("<br />");		// 각 단이 끝날 때마다 줄바꿈
		}
	}
	%>
</body>
</html>