package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;

@WebServlet("/board/modify")
public class BoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("post_uid");
		String category = request.getParameter("category");
		String category_title = request.getParameter("category_title");
		
		BoardDao dao = new BoardDao();
		Board b = dao.viewPost(category, uid);
		
		request.setAttribute("uid", b.getUid());
		request.setAttribute("category", b.getCategory());
		request.setAttribute("category_title", category_title);
		request.setAttribute("subject", b.getSubject());
		request.setAttribute("contents", b.getContents());
		request.setAttribute("notice", b.getNotice());
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}

}
