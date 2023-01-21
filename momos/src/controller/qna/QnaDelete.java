package controller.qna;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

@WebServlet("/board/qnadelete")
public class QnaDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		
		BoardDao dao = new BoardDao();
		dao.qnaDelete(uid);
		
		response.sendRedirect("/board/qna");
	}

}
