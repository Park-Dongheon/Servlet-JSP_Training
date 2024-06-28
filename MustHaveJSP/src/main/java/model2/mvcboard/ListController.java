package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// DAO 생성
		MVCBoardDAO dao = new MVCBoardDAO();
		
		// 부에 전달할 매개변수 저장용 맵 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");

		if (searchWord != null) {
			// 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		

		int totalCount = dao.selectCount(map);					// 게시물 수 확인
		
		/*** 페이지 처리 start ***/
		
		// 전체 페이지 수 계산
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
//		int totalPage = (int)Math.ceil((double)totalCount / pageSize);

		// 현재 페이지 확인
		int pageNum = 1;		// 기본값
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);				// 요청 받은 페이지로 수정
		
		// 목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize;					// 첫 게시물 번호
		map.put("start", start);
		map.put("pageSize", pageSize);
		/*** 페이지 처리 end ***/

		List<MVCBoardDTO> boardLists = dao.selectListPage(map);	// 게시물 목록 받기
		if( boardLists == null) {
			System.out.println("게시물 없음");
		}
		dao.close();											// DB 연결 닫기
		
		
		// 뷰에 전달할 매개변수 추가
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		
		// 바로가기 영역 HTML 문자열
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		// 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
//		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		
		req.getRequestDispatcher(getServletContext().getInitParameter("VIEWPATH") + "/14MVCBoard/List.jsp").forward(req, resp);
		// 보안 및 구성 요소의 위치를 관리
		// WEB-INF 폴더는 웹 서버에 의해 직접 접근이 불가능합니다. 즉, 브라우저를 통해 URL로 접근할 수 없습니다. 이로 인해 민감한 설정 파일이나 클래스 파일을 안전하게 저장
		// 위치: WEB-INF/web.xml, 역할: 웹 애플리케이션의 배치 설명자(Deployment Descriptor)입니다. 서블릿, 필터, 리스너, 세션 구성, MIME 타입 매핑 등을 정의
		// 위치: WEB-INF/lib/, 역할: 웹 애플리케이션에서 사용하는 외부 라이브러리(JAR 파일)를 포함
		// Tomcat 서버가 시작될 때 WEB-INF 폴더를 스캔하여 web.xml 파일을 읽고, 그에 따라 서블릿 및 기타 구성 요소를 초기화
		// WEB-INF/classes/ 및 WEB-INF/lib/의 모든 클래스 및 라이브러리는 애플리케이션 클래스 로더에 의해 로드되어 웹 애플리케이션에서 사용
	}

}
