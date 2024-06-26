<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>JDBC 테스트</h2>
	<%
	try (JDBConnect jdbc1 = new JDBConnect()) {
	    // 데이터베이스 연결 및 작업 수행
	} catch (Exception e) {
	    e.printStackTrace();
	}
	%>
	<h2>JDBC 테스트 2</h2>
	<%
	String driver = application.getInitParameter("MySQL Driver");
	String url = application.getInitParameter("MySQL URL");
	String id = application.getInitParameter("MySQL Id");
	String pwd = application.getInitParameter("MySQL Pwd");

	try (JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd)) {
	    // 데이터베이스 연결 및 작업 수행
	} catch (Exception e) {
	    e.printStackTrace();
	}
	%>
	<h2>JDBC 테스트 3</h2>
	<%
	try (JDBConnect jdbc3 = new JDBConnect(application)) {
	    // 데이터베이스 연결 및 작업 수행
	} catch (Exception e) {
	    e.printStackTrace();
	}
	%>
</body>
</html>