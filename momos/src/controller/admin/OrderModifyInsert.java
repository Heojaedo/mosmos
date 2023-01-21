package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import model.Order;

@WebServlet("/admin/orderModifyInsert")
public class OrderModifyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderModifyInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cart_session = request.getParameter("cart_session");
		String order_status = request.getParameter("order_status");
		String re_name = request.getParameter("re_name");
		String re_zipcode = request.getParameter("zipcode2");
		String re_address = request.getParameter("address2");
		String re_detailaddr = request.getParameter("detailaddress3");
		String re_phone1 = request.getParameter("re_phone1");
		String re_phone2 = request.getParameter("re_phone2");
		String re_phone3 = request.getParameter("re_phone3");
		String shippingmsg = request.getParameter("shippingmsg");
		
		Order o = new Order();
		o.setOrder_status(order_status);
		o.setRe_name(re_name);
		o.setRe_zipcode(re_zipcode);
		o.setRe_address(re_address);
		o.setRe_detailaddr(re_detailaddr);
		o.setRe_phone1(re_phone1);
		o.setRe_phone2(re_phone2);
		o.setRe_phone3(re_phone3);
		o.setShippingmsg(shippingmsg);
		o.setOr_status(order_status);
		o.setOr_cart_session(cart_session);
		
		AdminDao dao = new AdminDao();
		dao.adminorderModifyInsert1(o);
		dao.adminorderModifyInsert2(o);
		
		response.sendRedirect("/admin/orderList");
	}

}
