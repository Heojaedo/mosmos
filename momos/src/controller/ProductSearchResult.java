package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Item;

@WebServlet("/product/search_result")
public class ProductSearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductSearchResult() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String category = "";
		String field = "";
		String search = "";
		String minprice = "";
		String maxprice = "";
		String sort = "";
		if(request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		if(request.getParameter("field") != null) {
			field = request.getParameter("field");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if(request.getParameter("minprice") != null) {
			minprice = request.getParameter("minprice");
		}
		if(request.getParameter("maxprice") != null) {
			maxprice = request.getParameter("maxprice");
		}
		if(request.getParameter("sort") != null) {
			sort = request.getParameter("sort");
		}
		
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
		
		ProductDao dao = new ProductDao();
		int count = dao.searchItemCount(category,field,search,minprice,maxprice,sort);
		ArrayList<Item> list = dao.searchItem(category,field,search,minprice,maxprice,sort,startRow,endRow);
		
		request.setAttribute("count", count);
		request.setAttribute("field", field);
		request.setAttribute("search", search);
		request.setAttribute("minprice", minprice);
		request.setAttribute("maxprice", maxprice);
		request.setAttribute("sort", sort);
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		RequestDispatcher dis = request.getRequestDispatcher("search.jsp");
		dis.forward(request, response);

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
