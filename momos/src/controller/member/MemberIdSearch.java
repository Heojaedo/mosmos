package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;


@WebServlet("/member/find_id")
public class MemberIdSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberIdSearch() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("find_id.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name2");
		String email = request.getParameter("email");
		
		MemberDao dao = new MemberDao();
		String userid = dao.idSelect(name, email);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(userid.equals("")) {
			out.print("<script>");
			out.print("alert('존재하지 않는 회원입니다.');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
		}else {
			out.print("<form name='aaa' action='/member/find_id_result' method='post'>");
			out.print("<input name='id' value='"+userid+"'>");
			out.print("<input name='name' value='"+name+"'>");
			out.print("<input name='email' value='"+email+"'>");
			out.print("</form>");
			out.print("<script>");
			out.print("document.aaa.submit();");
			out.print("</script>");
			//response.sendRedirect("/member/find_id_result?id="+userid);
		}
	}

}







