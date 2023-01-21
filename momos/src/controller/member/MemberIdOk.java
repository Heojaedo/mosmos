package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;


@WebServlet("/member/idok")
public class MemberIdOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberIdOk() {
        super();
        
    }

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
		MemberDao dao = new MemberDao();
		int num = dao.loginSelect(userid);
		
		String msg = "";
		if(userid.length() < 4) {
			msg = "<font color=red>아이디는 4자 이상으로 입력하세요.</font>";
		}else if(num == 1){
			msg = "<font color=red>이미 존재하는 아이디입니다.</font>";
		}else {
			msg = "<font color=blue>사용 가능한 아이디입니다.</font>";
		}
		
		response.setContentType("test/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(msg);
	}
		
}

