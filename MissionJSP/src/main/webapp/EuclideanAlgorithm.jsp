<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%!
// 두 문자열 숫자를 입력받아 최대공약수를 계산하는 method
public int gcd(String num1, String num2) {
	if (num1 == null || num1.isEmpty() || num2 == null || num2.isEmpty()) return 0;
	
	// 두 문자열 숫자를 타입을 정수형으로 변경
	int a = Integer.parseInt(num1);
	int b = Integer.parseInt(num2);
	while (b != 0) {
		int rem = a % b;	// a를 b로 나눈 나머지를 계산
		a = b;				// a에 b값을 대입
		b = rem;			// b에 나머지 값을 대입
	}
	return a;				// 최대공약수 반환
}

// 두 문자열 숫자를 입력받아 최소공배수를 계산하는 method
public int lcm(String num1, String num2) {
	if (num1 == null || num1.isEmpty() || num2 == null || num2.isEmpty()) return 0;
	
	// 두 문자열 숫자를 타입을 정수형으로 변경
	int a = Integer.parseInt(num1);
	int b = Integer.parseInt(num2);
	
	// a와 b의 곱을 최대공약수로 나눈 값 반환
	return a * b / gcd(num1, num2);
}

%>
<html>
<head>
<meta charset="EUC-KR">
<title>EuclideanAlgorithm</title>
</head>
<%
String snum1 = request.getParameter("num1");	// 폼에서 num1 값을 가져옴
String snum2 = request.getParameter("num2");	// 폼에서 num2 값을 가져옴
int snum3 = gcd(snum1, snum2);					// 최대공약수 계산
int snum4 = lcm(snum1, snum2);					// 최소공배수 계산
%>
<body>
	<form>
	<table style="border: 1px solid black;">
		<tr>
			<td>숫자1:</td>
			<!-- num1 값이 없으면 입력 필드에 placeholder 문자열을 출력 -->
<%			if (snum1 == null) { %>
				<td><input type="text" name="num1" placeholder="숫자를 입력하세요."/></td>
			<!-- num1 값이 있으면 입력 필드에 해당 값을 채움 -->
<%			} else { %>
				<td><input type="text" name="num1" value="<%= snum1 %>"/></td>
<%			} 	%>						
		</tr>
		<tr>
			<td>숫자2:</td>
			<!-- num2 값이 없으면 입력 필드에 placeholder 문자열을 출력 -->
<%			if (snum2 == null) { %>
				<td><input type="text" name="num2" placeholder="숫자를 입력하세요."/></td>
			<!-- num2 값이 있으면 입력 필드에 해당 값을 채움 -->
<%			} else { %>
				<td><input type="text" name="num2" value="<%= snum2 %>"/></td>
<%			}	 %>											
		</tr>
		
		<tr>
			<td>최대공약수:</td>
			<!-- 최대공약수를 입력 필드에 표시, 입력 필드는 값을 읽어 표시만가능  -->
			<td><input type="text" name="num3" value="<%= snum3 %>" readonly/></td>
		</tr>
		<tr>
			<td>최소공배수:</td>
			<!-- 최소공배수를 입력 필드에 표시, 입력 필드는 값을 읽어 표시만가능  -->
			<td><input type="text" name="num4" value="<%= snum4 %>" readonly/></td>
		</tr>
		<tr>
			<td colspan="2" style="margin: 0 auto; text-align: center;">
				<!-- 실행 버튼 -->
				<input type="submit" value="실행" style="width:100%;"/>
			</td>
		</tr>
	</table>
</body>
</html>
<!-- 코드의 전체적인 흐름 : 사용자로부터 두 숫자를 입력받고, 최대공약수와 최소공배수를 계산하여 결과를 보여주는 것 -->