<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, jakarta.servlet.*"%>
<%
    // 파라미터를 가져오기
    String gugudanType = request.getParameter("Gugudan");	// 사용자가 선택한 구구단 유형(Type1, Type2, Type3)을 의미
    String dan = request.getParameter("dan");				// Type1에서 입력한 단 수
    String dir = request.getParameter("dir");			// Type2에서 선택한 방향 (hor 또는 ver)
    String col = request.getParameter("col");				// Type3에서 입력한 열 수
    
    // 조건문을 통해 사용자가 선택한 구구단 유형에 따라 적절한 JSP 파일로 리디렉션
    if ("Type1".equals(gugudanType)) {			// Type1 선택 시
        response.sendRedirect("Gugudan1.jsp?dan=" + dan);	// Gugudan1.jsp로 dan 파라미터와 함께 리디렉션
    } else if ("Type2".equals(gugudanType)) {	// Type2 선택 시
        response.sendRedirect("Gugudan2.jsp?dir=" + dir);	// Gugudan2.jsp로 dir 파라미터와 함께 리디렉션
    } else if ("Type3".equals(gugudanType)) {	// Type3 선택 시
        response.sendRedirect("Gugudan3.jsp?col=" + col);	// Gugudan3.jsp로 col 파라미터와 함께 리디렉션
    } else {		// 유효하지 않은 선택이 있을 경우
        out.println("선택이 없습니다. 다시 시도해 주세요.");
    }
%>