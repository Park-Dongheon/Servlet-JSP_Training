package mission;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import membership.MemberDAO;

/*
서블릿 실습(Model2) - MySQL musthave DB에서 아래와 같이 테이블을 선택하면 브라우저 화면에 출력되도록 구현하세요.
/ServletStudy/musthave?table=member => member.jsp
/ServletStudy/musthave?table=board => board.jsp
	
HINT
DAO, DTO
req.setAttribute, req.getRequestDispatcher(...).forward(req, resp)
EL & <c:forEach>
 */

@WebServlet("/ServletStudy/musthave")
public class MusthaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		// application 내장 객체 얻기
		ServletContext application = this.getServletContext();
		
		// web.xml에서 DB 연결 정보 얻기
		String driver = application.getInitParameter("MySQL Driver");
		String connectUrl = application.getInitParameter("MySQL URL");
		String oId = application.getInitParameter("MySQL Id");
		String oPass = application.getInitParameter("MySQL Pwd");
		
		// DAO 생성
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
}
