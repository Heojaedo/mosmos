package myshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyShopDao;
import model.CartItem;
import model.Order;


@WebServlet("/myshop/order/detail")
public class MyShopOrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MyShopOrderDetail() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("userid");	
		int uid = Integer.parseInt(request.getParameter("or_uid"));
		int cart_uid = Integer.parseInt(request.getParameter("cart_uid"));
		
		MyShopDao dao = new MyShopDao();
		
		Order o = dao.orderView(uid);
		Order s = dao.orderStatus(cart_uid);
		
		List<CartItem> list = dao.orderItemList(uid);
		
		request.setAttribute("order", o);
		request.setAttribute("status", s);
		request.setAttribute("list", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("detail.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
