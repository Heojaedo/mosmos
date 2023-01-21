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
import dao.BoardDao;
import dao.MemberDao;
import dao.ProductDao;
import model.Board;
import model.Item;

@WebServlet("/admin/itemList")
public class ItemList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminDao dao = new AdminDao();
		
		String category = "";
		if(request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		
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
		
		//총 상품 갯수
		int count = dao.adminItemCount(field,search,category);
		
		//넘버링
		int number = count - (pageNum - 1) * pageSize;
		
		//limit 값 설정
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		
		ArrayList<Item> list = dao.adminItemList(startRow,endRow,field,search,category); //상품 리스트 출력 - 전체,검색,카테고리
		
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("field", field);
		request.setAttribute("search", search);
		request.setAttribute("category", category);
		RequestDispatcher dis = request.getRequestDispatcher("itemList.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
