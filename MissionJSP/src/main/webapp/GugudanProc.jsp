<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%
    // 파라미터를 가져오기
    String gugudan1 = request.getParameter("Gugudan");
    String gugudan2 = request.getParameter("Gugudan");
    String gugudan3 = request.getParameter("Gugudan");
    String dan = request.getParameter("dan");
    String col = request.getParameter("col");
    String orientation = request.getParameter("orientation");

    // 파라미터가 널인지 체크하고 리디렉션
    if (gugudan1 != null && !gugudan1.isEmpty()) {
        response.sendRedirect("Gugudan1.jsp?dan=" + dan);
    } else if (orientation != null && !orientation.isEmpty()) {
        response.sendRedirect("Gugudan2.jsp?hor=" + orientation);
    } else if (orientation != null && !orientation.isEmpty()) {
        response.sendRedirect("Gugudan2.jsp?ver=" + orientation);
    } else if (col != null && !col.isEmpty()) {
        response.sendRedirect("Gugudan3.jsp?col=" + col);
    } else {
        out.println("유효한 선택이 없습니다. 다시 시도해 주세요.");
    }
%>