package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import model.CartItem;
import model.Order;

@WebServlet("/admin/orderModify")
public class OrderModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cart_session = request.getParameter("cart_session");
		
		AdminDao dao = new AdminDao();
		Order o = dao.adminorderModify(cart_session);
		List<CartItem> list = dao.adminordermodifyItemList(cart_session);
		
		request.setAttribute("o", o);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("order_modify.jsp");
		dis.forward(request, response);
		
	}

}
