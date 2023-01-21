package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import model.Item;
import model.Member;

@WebServlet("/admin/memberList")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminDao dao = new AdminDao();
		
		//한 페이지 출력 게시물 수
		int pageSize = 10;
		
		//현재 페이지 수
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) { //get 방식으로 값이 넘어 왔다면
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		//검색어
		String field = request.getParameter("field");
		String search = request.getParameter("search");
		if(request.getParameter("field") == null) { //검색어가 없을 때
			field = "";
		}
		if(request.getParameter("search") == null) {
			search = "";
		}
		
		//총 회원 수
		int count = dao.adminMemberCount(field,search);
		
		//넘버링
		int number = count - (pageNum - 1) * pageSize;
		
		//limit 값 설정
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		
		ArrayList<Member> list = dao.adminMemberList(startRow,endRow,field,search); //회원 리스트 출력 - 전체,검색
		
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("field", field);
		request.setAttribute("search", search);
		RequestDispatcher dis = request.getRequestDispatcher("memberList.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
