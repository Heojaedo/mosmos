package controller.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;

@WebServlet("/board/notice")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = "notice";
		String category_title = "NOTICE";
		
		//한 페이지 출력 게시물 수
		int pageSize = 5;
		
		//현재 페이지 수
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) { //get 방식으로 값이 넘어 왔다면
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		MemberDao m = new MemberDao();
		Board b = new Board();
		BoardDao dao = new BoardDao();
		
		//검색어
		String field = request.getParameter("field");
		String search = request.getParameter("search");
		if(request.getParameter("field") == null) { //검색어가 없을 때
			field = "";
		}
		if(request.getParameter("search") == null) {
			search = "";
		}
		
		//총 게시물 수
		int count = dao.postCount(field,search,category);
		
		//넘버링
		int number = count - (pageNum - 1) * pageSize;
		
		//limit 값 설정
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;		
		
		ArrayList<Board> notice = dao.boardnoticeList(category);
		ArrayList<Board> list = dao.boardList(startRow,endRow,field,search,category);
		
		request.setAttribute("notice", notice);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("number", number);
		request.setAttribute("field", field);
		request.setAttribute("search", search);
		request.setAttribute("category_title", category_title);
		request.setAttribute("category", category);
		RequestDispatcher dis = request.getRequestDispatcher("List.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
