package controller.blend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Board;
import model.Item;

@WebServlet("/category/blend")
public class BlendList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BlendList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = "blend";
		
		//한 페이지 출력 게시물 수
		int pageSize = 8;
		
		//현재 페이지 수
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) { //get 방식으로 값이 넘어 왔다면
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		//limit 값 설정
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		if(request.getParameter("sort_method") == null) {
			ProductDao dao = new ProductDao();
			int count = dao.beanscategoryCount(category);
			ArrayList<Item> list = dao.beanscategoryList(category,startRow,endRow);
			
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("category",category);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pageNum", pageNum);
			RequestDispatcher dis = request.getRequestDispatcher("List.jsp");
			dis.forward(request, response);
		} else {
			String sort = request.getParameter("sort_method");
			
			ProductDao dao = new ProductDao();
			int count = dao.beanscategoryCount(category);
			ArrayList<Item> list = dao.beanscategorysortList(category,sort,startRow,endRow);
			
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("category",category);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pageNum", pageNum);
			RequestDispatcher dis = request.getRequestDispatcher("List.jsp");
			dis.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
