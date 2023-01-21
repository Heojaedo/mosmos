package controller.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyShopDao;
import dao.OrderDao;


@WebServlet("/order/basket_delete")
public class OrderBasketDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderBasketDelete() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("str");
		
		String[] aaa = str.split(",");
		for(int i = 0; i < aaa.length; i++) {
			System.out.println("=====aaa:"+aaa[i]);
		}
		
		OrderDao dao = new OrderDao();
		dao.cartListDelete(aaa);
		
		response.sendRedirect("/order/basket");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
