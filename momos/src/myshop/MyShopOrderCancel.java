package myshop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyShopDao;
import model.Order;


@WebServlet("/myshop/order/cancel")
public class MyShopOrderCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MyShopOrderCancel() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("userid");
		int uid = Integer.parseInt(request.getParameter("or_uid"));
		
		MyShopDao dao = new MyShopDao();
		
		dao.orderCancel(uid);
		
		response.sendRedirect("/myshop/order/list");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
