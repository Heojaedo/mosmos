package controller.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/qnawrite")
public class QnaWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String session_id = request.getParameter("session_id");
		String session_name = request.getParameter("session_name");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("session_id") == "") {
			out.print("<script>");
			out.print("alert('회원에게만 글쓰기 권한이 있습니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			request.setAttribute("id", session_id);
			request.setAttribute("name", session_name);
			RequestDispatcher dis = request.getRequestDispatcher("qnawrite.jsp");
			dis.forward(request, response);
		}
	}

}
