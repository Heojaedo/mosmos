package controller.qna;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Qna;

@WebServlet("/board/qnamodify_insert")
public class QnaModifyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaModifyInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String secret = "";
		if(request.getParameter("secretCheck") != null) {
			secret = request.getParameter("secretCheck");
		}
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		
		Qna q = new Qna();
		q.setUid(uid);
		q.setSecret(secret);
		q.setSubject(subject);
		q.setContents(contents);
		
		BoardDao dao = new BoardDao();
		dao.qnaModify(q);
		
		response.sendRedirect("/board/qna");
	}

}
