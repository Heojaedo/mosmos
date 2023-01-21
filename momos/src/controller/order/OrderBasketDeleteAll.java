package controller.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyShopDao;
import dao.OrderDao;


@WebServlet("/order/basket_deleteall")
public class OrderBasketDeleteAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderBasketDeleteAll() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String session_cart = (String)session.getAttribute("cart");
		
		OrderDao dao = new OrderDao();
		dao.cartListDeleteAll(session_cart);
		
		response.sendRedirect("/order/basket");		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
