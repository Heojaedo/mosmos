package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/write")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("session_id");
		String name = request.getParameter("session_name");
		String level = request.getParameter("session_level");
		String category = request.getParameter("category");
		String category_title = request.getParameter("category_title");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(id != null && !level.equals("10")) {
			out.print("<script>");
			out.print("alert('권한이 없습니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			request.setAttribute("id", id);
			request.setAttribute("category", category);
			request.setAttribute("category_title", category_title);
			RequestDispatcher dis = request.getRequestDispatcher("Write.jsp");
			dis.forward(request, response);
		}

	}

}
