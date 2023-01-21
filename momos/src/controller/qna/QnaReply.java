package controller.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Qna;

@WebServlet("/board/reply")
public class QnaReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaReply() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String level = request.getParameter("session_level");
		
		if(!level.equals("10")) {
			out.print("<script>");
			out.print("alert('관리자만 답변 권한이 있습니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
		
			String uid = request.getParameter("uid");
			String item_uid = request.getParameter("item_uid");
			String item_name = request.getParameter("item_name");
			String reply_id = request.getParameter("reply_id");
			String reply_name = request.getParameter("reply_name");
			String fid = request.getParameter("fid");
			String thread = request.getParameter("thread");
			
			BoardDao dao = new BoardDao();
			Qna q = dao.qnareply(uid);
			
			request.setAttribute("uid", uid);
			request.setAttribute("subject", q.getSubject());
			request.setAttribute("contents", q.getContents());
			request.setAttribute("secret", q.getSecret());
			request.setAttribute("item_uid", item_uid);
			request.setAttribute("item_name", item_name);
			request.setAttribute("reply_id", reply_id);
			request.setAttribute("reply_name", reply_name);
			request.setAttribute("fid", fid);
			request.setAttribute("thread", thread);
			RequestDispatcher dis = request.getRequestDispatcher("reply.jsp");
			dis.forward(request, response);
			
		}
		
	}

}









