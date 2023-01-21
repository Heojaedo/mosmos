package controller.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;


@WebServlet("/order/order_insert")
public class OrderOrderInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderOrderInsert() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String session_cart = (String)session.getAttribute("cart");
		String str = request.getParameter("str");
		
		OrderDao dao = new OrderDao();
		if(str == null) {
			
			dao.orderInsertAll(session_cart);
			response.sendRedirect("/order/orderform");
			
		}else if(str != null && str != "") {
			
			String[] aaa = str.split(",");
			
			for(int i = 0; i < aaa.length; i++) {
				System.out.print("=======aaa:"+aaa[i]);
			}
			
			dao.orderInsert(aaa,session_cart);
			response.sendRedirect("/order/orderform");
		}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
