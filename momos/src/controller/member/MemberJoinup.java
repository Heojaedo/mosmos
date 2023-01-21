package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;


@WebServlet("/member/modify")
public class MemberJoinup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberJoinup() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("userid");
		
		MemberDao dao = new MemberDao();
		
		Member m = dao.sessionSelect(session_id);
		
		request.setAttribute("member", m);
		
		RequestDispatcher dis = request.getRequestDispatcher("joinup.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		
		m.setUserid(request.getParameter("userid"));
		m.setPassword(request.getParameter("password"));
		m.setName(request.getParameter("name"));
		m.setZipcode(request.getParameter("zipcode"));
		m.setAddress(request.getParameter("address"));
		m.setDetailaddress(request.getParameter("detailaddress"));
		m.setPhone1(request.getParameter("phone1"));
		m.setPhone2(request.getParameter("phone2"));
		m.setPhone3(request.getParameter("phone3"));
		m.setSms(request.getParameter("sms"));
		m.setEmail(request.getParameter("email"));
		m.setEmail_re(request.getParameter("email_re"));
		System.out.println(m.toString());
		
	
		MemberDao dao = new MemberDao();
		dao.updateMember(m);
		
	    response.sendRedirect("/");
	}

}
