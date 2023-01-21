package controller.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import model.CartItem;
import model.Member;
import model.Order;


@WebServlet("/order/orderform")
public class OrderOrderForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderOrderForm() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("userid");
		String session_cart = (String)session.getAttribute("cart");
		
		OrderDao dao = new OrderDao();
		Member m = dao.orderInfo(session_id);
		
		List<CartItem> list = dao.cartOrderList(session_cart);
		
		request.setAttribute("list", list);
		request.setAttribute("user", m);
		
		RequestDispatcher dis = request.getRequestDispatcher("orderform.jsp");
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("userid");
		String session_cart = (String)session.getAttribute("cart");
		
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		Order o = new Order();
		
		o.setOr_cart_session(session_cart);
		o.setDate(signdate);
		o.setUserid(session_id);
		o.setOr_name(request.getParameter("name2"));
		o.setOr_zipcode(request.getParameter("zipcode"));
		o.setOr_address(request.getParameter("address"));
		o.setOr_detailaddr(request.getParameter("detailaddress"));
		o.setOr_phone1(request.getParameter("phone1"));
		o.setOr_phone2(request.getParameter("phone2"));
		o.setOr_phone3(request.getParameter("phone3"));
		o.setOr_email(request.getParameter("email"));
		o.setRe_name(request.getParameter("name3"));
		o.setRe_zipcode(request.getParameter("zipcode2"));
		o.setRe_address(request.getParameter("address2"));
		o.setRe_detailaddr(request.getParameter("detailaddress3"));
		o.setRe_phone1(request.getParameter("phone4"));
		o.setRe_phone2(request.getParameter("phone5"));
		o.setRe_phone3(request.getParameter("phone6"));
		o.setShippingmsg(request.getParameter("shippingmsg"));
		o.setPay_method(request.getParameter("pay_method"));
		o.setPay_name(request.getParameter("pay_name"));
		o.setPay_bank(request.getParameter("pay_bank"));
		o.setCash_receipt(request.getParameter("cash_receipt"));
		o.setTax_request(request.getParameter("tax_request"));
		o.setPurchase_agreement(request.getParameter("purchase_agreement"));
		o.setPayprice(Integer.parseInt(request.getParameter("payprice")));
		
		OrderDao dao = new OrderDao();
		dao.orderInsert(o);
		dao.orderStatusChange(session_id, session_cart);
		
		//카트 세션 초기화
		session.removeAttribute("cart");
		
		//카트 세션 재생성
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 10;
		String resultNum = "";
		
		for (int i = 0; i < letter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;
		}
		
		session.setAttribute("cart", resultNum);
		
		response.sendRedirect("/");
		
	}

}




