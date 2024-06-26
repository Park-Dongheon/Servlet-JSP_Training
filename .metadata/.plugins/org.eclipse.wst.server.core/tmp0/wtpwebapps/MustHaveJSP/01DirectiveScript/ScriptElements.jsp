<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!			// 선언부(메서드 선언)
public int add(int num1, int num2) {
	return num1 + num2;
}
public int sub(int num1, int num2) {
	return num1 - num2;
}
public int mul(int num1, int num2) {
	return num1 * num2;
}
public int div(int num1, int num2) {
	return num1 / num2;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>

<%	//스크립틀릿(자바코드)
int result1;
int result2;
int result3;
int result4;

try {
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	result1 = add(num1, num2);
	result2 = sub(num1, num2);
	result3 = mul(num1, num2);
	result4 = div(num1, num2);
} catch (Exception e) {
	result1 = 0;
	result2 = 0;
	result3 = 0;
	result4 = 0;
}
//int result1 = add(10, 20);
//int result2 = sub(10, 20);
//int result3 = mul(10, 20);
//int result4 = div(10, 20);
%>

덧셈 결과 1 : <%= result1 %> <br />			<!-- 표현식(변수) -->
덧셈 결과 2 : <%= add(30, 40) %> <br />		<!-- 표현식(메서드 호출) -->
빼기 결과 1 : <%= result2 %> <br />			<!-- 표현식(변수) -->
빼기 결과 2 : <%= sub(30, 40) %> <br />		<!-- 표현식(메서드 호출) -->
곱하기 결과 1 : <%= result3 %> <br />			<!-- 표현식(변수) -->
곱하기 결과 2 : <%= mul(30, 40) %> <br />		<!-- 표현식(메서드 호출) -->
나누기 결과 1 : <%= result4 %> <br />			<!-- 표현식(변수) -->
나누기 결과 2 : <%= div(30, 40) %>				<!-- 표현식(메서드 호출) -->

</body>
</html>