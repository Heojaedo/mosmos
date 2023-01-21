package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

@WebServlet("/board/delete")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String post_uid = request.getParameter("post_uid");
		String category = request.getParameter("category");
		System.out.println(post_uid);
		System.out.println(category);
		BoardDao dao = new BoardDao();
		dao.boardDelete(post_uid);
		
		response.sendRedirect("/board/"+category);
	}

}
