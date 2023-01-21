package myshop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyShopDao;


@WebServlet("/myshop/index")
public class MyshopIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyshopIndex() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("userid");
	
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(session_id == null) {
			out.print("<script>");
			out.print("location.href='/member/login';");
			out.print("</script>");
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
