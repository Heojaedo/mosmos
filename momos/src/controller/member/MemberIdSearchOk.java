package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/find_id_result")
public class MemberIdSearchOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberIdSearchOk() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email =request.getParameter("email");
		
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		
		RequestDispatcher dis = request.getRequestDispatcher("find_id_result.jsp");
		dis.forward(request, response);
	}

}
