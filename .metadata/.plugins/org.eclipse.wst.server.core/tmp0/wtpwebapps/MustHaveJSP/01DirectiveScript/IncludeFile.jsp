<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!		// 클래스의 메소드로 포함
	int add(int a, int b) {
		return a + b;
	}
%>
<%
LocalDate today = LocalDate.now();		// 오늘 날짜
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);		// 내일 날짜
%>