<%@ page import="common.Person" %> <!-- common.Person 임포트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pageInteger", 1000);						// 속성 저장
pageContext.setAttribute("pageString", "페이지 영역의 문자열");			// 속성 저장
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));		// 속성 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));		// 속성 읽기
	String pString = pageContext.getAttribute("pageString").toString();		// 속성 읽기
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));		// 속성 읽기
	%>
	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%= pString %></li>
		<li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
	</ul>
	
	<h2>include된 파일에서 page 영역 읽어오기</h2>
	<%@ include file="PageInclude.jsp" %>
	
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>