package myshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyShopDao;
import model.Order;



@WebServlet("/myshop/order/list")
public class MyShopOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MyShopOrderList() {
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
			
		}else {
			
			//한 페이지 출력 게시물 수 
			int pageSize = 10;
			
			//현재 페이지 수 
			int pageNum = 1;
			if(request.getParameter("pageNum") != null) {//get방식으로 값이 넘어왔다면 
				pageNum = Integer.parseInt(request.getParameter("pageNum"));			
			}
					
			MyShopDao dao = new MyShopDao();
		
			//총 주문 수 
			int count = dao.getAllOrderCount(session_id);		
			
			//넘버링
			int number = count - (pageNum - 1) * pageSize;
					
			//limit 값 설정
			int startRow = (pageNum - 1) * pageSize;
			int endRow = pageSize;
					
			List<Order> list = dao.orderList(session_id, startRow, endRow);
			
			request.setAttribute("list", list);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("count", count);
			request.setAttribute("number", number);
			
			RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
			dis.forward(request, response);
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
