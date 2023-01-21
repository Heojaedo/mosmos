package controller.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

@WebServlet("/board/secretCheck")
public class QnaSecretCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaSecretCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qna_id = request.getParameter("qna_id");
		String fid_id = request.getParameter("fid_id");
		String session_level = request.getParameter("session_level");
		String preurl = request.getParameter("preurl");
		String pass = "";
		if(request.getParameter("pass") != null) {
			pass = request.getParameter("pass");
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDao dao = new MemberDao();
		int num = dao.secretCheck(fid_id,pass);
		
		if(session_level.equals("10")) { //관리자
			response.sendRedirect(preurl);
		} else { //관리자가 아닐 때		
			if(num == 0) { //비밀번호 없음
				out.print("<script>");
				out.print("alert('비밀번호가 틀립니다.');");
				out.print("history.back();");
				out.print("</script>");
			} else {
				response.sendRedirect(preurl);
			}
		}
		
		
	}

}







