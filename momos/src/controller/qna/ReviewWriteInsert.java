package controller.qna;

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
import model.Qna;

@WebServlet("/board/reviewwrite_insert")
public class ReviewWriteInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewWriteInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Qna q = new Qna();
		BoardDao dao = new BoardDao();
		
		if(request.getParameter("session_id") == "") {
			out.print("<script>");
			out.print("alert('회원에게만 글쓰기 권한이 있습니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			int item_uid = Integer.parseInt(request.getParameter("item_uid"));
			String item_name = request.getParameter("item_name");
			String category = request.getParameter("category");
			String id = request.getParameter("session_id");
			String name = request.getParameter("session_name");
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			
			//현재 날짜
			Date today = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String signdate = sd.format(today);
	
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddkkmmss");
			String signdate2 = sdf2.format(today);
			
			int ref = 1;
			
			q.setItem_uid(item_uid);
			q.setItem_category(category);
			q.setItem_name(item_name);
			q.setUserid(id);
			q.setSubject(subject);
			q.setContents(contents);
			q.setName(name);
			q.setSigndate(signdate);
			q.setSigndate2(signdate2);
			q.setRef(ref);
			
			dao.reviewWrite(q);
			
			response.sendRedirect("/product/"+category+"?no="+item_uid);
		}
	}

}
