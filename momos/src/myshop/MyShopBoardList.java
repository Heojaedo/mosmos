package myshop;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyShopDao;
import model.Member;
import model.Qna;


@WebServlet("/myshop/board_list")
public class MyShopBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MyShopBoardList() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("userid");
		
		MyShopDao dao = new MyShopDao();
		
		//code
		String code = "";
		if(request.getParameter("code") != null) {
			code = request.getParameter("code");
		}
		
		//한 페이지 출력 게시물 수 
		int pageSize = 15;
		
		//현재 페이지 수 
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) {//get방식으로 값이 넘어왔다면 
			pageNum = Integer.parseInt(request.getParameter("pageNum"));			
		}
				
		//검색어
		String field = request.getParameter("field");
		String search = request.getParameter("search");
		
		//내가 쓴 게시글 수 
		int count = dao.getAllPostCount(field, search, session_id, code);
		
		//넘버링
		int number = count - (pageNum - 1) * pageSize;
		
		//limit 값 설정
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		List<Qna> list = dao.myAllPost(session_id, startRow, endRow, field, search, code);
		
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("field", field);
		request.setAttribute("search", search);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("list", list);	
		request.setAttribute("code", code);
		
		RequestDispatcher dis = request.getRequestDispatcher("board_list.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
