package controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/regist")
public class ProductRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductRegist() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate = request.getParameter("category");
		String session_level = request.getParameter("session_level");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(session_level != null && !session_level.equals("10")) {
			out.print("<script>");
			out.print("alert('권한이 없습니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			request.setAttribute("category", cate);
			RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
			dis.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
