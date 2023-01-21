package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/find_passwd_result")
public class MemberPassSearchOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberPassSearchOk() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String password = request.getParameter("password");
		
		request.setAttribute("password", password);
		
		RequestDispatcher dis = request.getRequestDispatcher("find_passwd_result.jsp");
		dis.forward(request, response);
	}

}
