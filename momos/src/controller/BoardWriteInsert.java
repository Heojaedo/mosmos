package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;

@WebServlet("/board/write_insert")
public class BoardWriteInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardWriteInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("session_id");
		String name = request.getParameter("session_name");
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		String category = request.getParameter("category");
		String notice = "";
		if(request.getParameter("noticeCheck") != null) {
			notice = request.getParameter("noticeCheck");
		}
			
		//현재 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddkkmmss");
		String signdate2 = sdf2.format(today);
		
		Board b = new Board();
		b.setUserid(id);
		b.setName(name);
		b.setCategory(category);
		b.setNotice(notice);
		b.setSubject(subject);
		b.setContents(contents);
		b.setSigndate(signdate);
		b.setSigndate2(signdate2);
		
		BoardDao dao = new BoardDao();
		dao.insertPost(b);
		
		response.sendRedirect("/board/"+category);
		
		
	}

}
