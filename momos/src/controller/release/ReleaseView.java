package controller.release;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;


@WebServlet("/article/release")
public class ReleaseView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReleaseView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = "release";
		String category_title = "PRESS RELEASE";
		String uid = request.getParameter("no");	
		
		BoardDao dao = new BoardDao();
		Board b = dao.viewPost(category,uid);
		dao.viewrefplus(category,uid);
		Board prePost = dao.viewprePost(category,uid); //이전글
		Board nextPost = dao.viewnextPost(category,uid); //다음글
		Board preNotice = dao.noticeprePost(category,uid); //공지-이전글
		Board nextNotice = dao.noticenextPost(category,uid); //공지-다음글
		
		request.setAttribute("uid", b.getUid());
		request.setAttribute("subject", b.getSubject());
		request.setAttribute("name", b.getName());
		request.setAttribute("signdate", b.getSigndate());
		request.setAttribute("contents", b.getContents());
		request.setAttribute("ref", b.getRef()); //조회수
		request.setAttribute("category", category); //게시판 카테고리
		request.setAttribute("category_title", category_title);
		request.setAttribute("notice", b.getNotice());
		request.setAttribute("preuid", prePost.getUid()); //이전글 uid
		request.setAttribute("presubject", prePost.getSubject()); //이전글 제목
		request.setAttribute("nextuid", nextPost.getUid()); //다음글 uid
		request.setAttribute("nextsubject", nextPost.getSubject()); //다음글 제목
		request.setAttribute("prenoticeuid", preNotice.getUid()); //이전 공지글 uid
		request.setAttribute("prenoticesubject", preNotice.getSubject()); //이전 공지글 제목
		request.setAttribute("nextnoticeuid", nextNotice.getUid()); //다음 공지글 uid
		request.setAttribute("nextnoticesubject", nextNotice.getSubject()); //다음 공지글 제목
		RequestDispatcher dis = request.getRequestDispatcher("View.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
