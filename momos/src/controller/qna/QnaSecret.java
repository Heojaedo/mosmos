package controller.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

@WebServlet("/board/secret")
public class QnaSecret extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaSecret() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getParameter("url");
		String qna_uid = request.getParameter("no"); //Qna 글 번호
		BoardDao dao = new BoardDao();
		String qna_id = dao.qnawrite_id(qna_uid); //Qna 글 번호로 Qna 작성자 찾기
		String firstfid_id = dao.qnareplyfirstfid(qna_uid); //Qna 답변이 비밀일 경우, 같은 fid값의 첫 작성자 찾기
		
		request.setAttribute("preurl", url);
		request.setAttribute("qna_id", qna_id);
		request.setAttribute("firstfid_id", firstfid_id);
		RequestDispatcher dis = request.getRequestDispatcher("secret.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
