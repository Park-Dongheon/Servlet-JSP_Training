package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.ServletContext;

public class JDBConnect implements AutoCloseable  {

	 // 연결 자원
    private Connection con;
    private Statement stmt;
    private PreparedStatement psmt;
    private ResultSet rs;
	
    // 기본 생성자
    public JDBConnect() {
    	// DB에 연결
    	String driver = "com.mysql.cj.jdbc.Driver";
    	String url = "jdbc:mysql://localhost:3306/musthave";
    	String id = "scott";
    	String pwd = "tiger";
    		
        try {
            // JDBC 드라이버 로드
            Class.forName(driver);
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB 연결 성공(기본 생성자)");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로드 실패: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("DB 연결 실패: " + e.getMessage());
        }
    }
    
    // 인수 생성자
    public JDBConnect(String driver, String url, String id, String pwd) {
        try {
            // JDBC 드라이버 로드
            Class.forName(driver);
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB 연결 성공(인수 생성자)");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로드 실패: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("DB 연결 실패: " + e.getMessage());
        }
    }
    
    
    // 세 번째 생성자
    public JDBConnect(ServletContext application) {
    	try {
    		// JDBC 드라이버 로드
    		String driver = application.getInitParameter("MySQL Driver");
    		Class.forName(driver);
    		
    		// DB에 연결
    		String url = application.getInitParameter("MySQL URL");
    		String id = application.getInitParameter("MySQL Id");
    		String pwd = application.getInitParameter("MySQL Pwd");
    		con = DriverManager.getConnection(url, id, pwd);
    		
    		System.out.println("DB 연결 성공(인수 생성자 2)");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
	
    // Connection 객체를 반환하는 메서드
    public Connection getConnection() {
    	return con;
    }
    
    // Statement 객체를 반환하는 메서드
	public Statement getStmt() {
		return stmt;
	}
	
    // PreparedStatement 객체를 반환하는 메서드
    protected PreparedStatement getPreparedStatement(String query) throws SQLException {
        psmt = con.prepareStatement(query);
        return psmt;
    }

	// ResultSet 객체를 반환하는 메서드
	public ResultSet getRs() {
		return rs;
	}

	  // 쿼리 실행 메서드
    public void executeQuery(String sql) throws SQLException {
        setStmt(con.createStatement());
        rs = getStmt().executeQuery(sql);
    }
	
	
	// 연결 해제(자원 반납)
	public void close() {
		try {
			if (rs != null) rs.close();
			if (getStmt() != null) getStmt().close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}
   
}
