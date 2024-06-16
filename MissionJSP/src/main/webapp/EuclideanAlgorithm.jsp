<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%!
// �� ���ڿ� ���ڸ� �Է¹޾� �ִ������� ����ϴ� method
public int gcd(String num1, String num2) {
	if (num1 == null || num1.isEmpty() || num2 == null || num2.isEmpty()) return 0;
	
	// �� ���ڿ� ���ڸ� Ÿ���� ���������� ����
	int a = Integer.parseInt(num1);
	int b = Integer.parseInt(num2);
	while (b != 0) {
		int rem = a % b;	// a�� b�� ���� �������� ���
		a = b;				// a�� b���� ����
		b = rem;			// b�� ������ ���� ����
	}
	return a;				// �ִ����� ��ȯ
}

// �� ���ڿ� ���ڸ� �Է¹޾� �ּҰ������ ����ϴ� method
public int lcm(String num1, String num2) {
	if (num1 == null || num1.isEmpty() || num2 == null || num2.isEmpty()) return 0;
	
	// �� ���ڿ� ���ڸ� Ÿ���� ���������� ����
	int a = Integer.parseInt(num1);
	int b = Integer.parseInt(num2);
	
	// a�� b�� ���� �ִ������� ���� �� ��ȯ
	return a * b / gcd(num1, num2);
}

%>
<html>
<head>
<meta charset="EUC-KR">
<title>EuclideanAlgorithm</title>
</head>
<%
String snum1 = request.getParameter("num1");	// ������ num1 ���� ������
String snum2 = request.getParameter("num2");	// ������ num2 ���� ������
int snum3 = gcd(snum1, snum2);					// �ִ����� ���
int snum4 = lcm(snum1, snum2);					// �ּҰ���� ���
%>
<body>
	<form>
	<table style="border: 1px solid black;">
		<tr>
			<td>����1:</td>
			<!-- num1 ���� ������ �Է� �ʵ忡 placeholder ���ڿ��� ��� -->
<%			if (snum1 == null) { %>
				<td><input type="text" name="num1" placeholder="���ڸ� �Է��ϼ���."/></td>
			<!-- num1 ���� ������ �Է� �ʵ忡 �ش� ���� ä�� -->
<%			} else { %>
				<td><input type="text" name="num1" value="<%= snum1 %>"/></td>
<%			} 	%>						
		</tr>
		<tr>
			<td>����2:</td>
			<!-- num2 ���� ������ �Է� �ʵ忡 placeholder ���ڿ��� ��� -->
<%			if (snum2 == null) { %>
				<td><input type="text" name="num2" placeholder="���ڸ� �Է��ϼ���."/></td>
			<!-- num2 ���� ������ �Է� �ʵ忡 �ش� ���� ä�� -->
<%			} else { %>
				<td><input type="text" name="num2" value="<%= snum2 %>"/></td>
<%			}	 %>											
		</tr>
		
		<tr>
			<td>�ִ�����:</td>
			<!-- �ִ������� �Է� �ʵ忡 ǥ��, �Է� �ʵ�� ���� �о� ǥ�ø�����  -->
			<td><input type="text" name="num3" value="<%= snum3 %>" readonly/></td>
		</tr>
		<tr>
			<td>�ּҰ����:</td>
			<!-- �ּҰ������ �Է� �ʵ忡 ǥ��, �Է� �ʵ�� ���� �о� ǥ�ø�����  -->
			<td><input type="text" name="num4" value="<%= snum4 %>" readonly/></td>
		</tr>
		<tr>
			<td colspan="2" style="margin: 0 auto; text-align: center;">
				<!-- ���� ��ư -->
				<input type="submit" value="����" style="width:100%;"/>
			</td>
		</tr>
	</table>
</body>
</html>
<!-- �ڵ��� ��ü���� �帧 : ����ڷκ��� �� ���ڸ� �Է¹ް�, �ִ������� �ּҰ������ ����Ͽ� ����� �����ִ� �� -->