package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;


@WebServlet("/member/login")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberLogin() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		MemberDao dao = new MemberDao();
		int num = dao.loginSelect(userid);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//난수
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 10;
		String resultNum = "";
		
		for (int i = 0; i < letter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;
		}
		
		System.out.println("=======난수:"+resultNum);
		System.out.println("===num:"+num);
		if(num == 0) {//아이디가 없는 경우	
			out.print("<script>");
			out.print("alert('없는 아이디입니다.');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
		}else if(num != 0) {//아이디가 있는 경우
			Member m = dao.idPassSelect(userid, password);
			
			HttpSession session = request.getSession();
			System.out.println(m.toString());
			if(m.getUserid() != null) {//아이디, 비밀번호를 조회 후 회원 존재한다면 세션 처리 
				
				session.setAttribute("userid", m.getUserid());
				session.setAttribute("name", m.getName());
				session.setAttribute("level", m.getLevel());
				session.setAttribute("cart", resultNum);
				
				response.sendRedirect("/");
				
			}else {//비밀번호가 틀린 경우
				out.print("<script>");
				out.print("alert('비밀번호가 틀렸습니다.다시 확인 하세요.');");
				out.print("history.back();");
				out.print("</script>");
				out.close();
			}
			
		}
		
		
	}

}
