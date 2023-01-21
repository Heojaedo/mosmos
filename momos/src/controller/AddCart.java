package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyShopDao;
import dao.OrderDao;
import dao.ProductDao;
import model.Cart;
import model.Item;

@WebServlet("/product/addcart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("session_id") == "") {
			out.print("<script>");
			out.print("alert('로그인 후 이용하세요.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
		
			int item_uid = Integer.parseInt(request.getParameter("item_uid"));
			String category = request.getParameter("category");
			String item_name = request.getParameter("itemName");
			String cart_session = request.getParameter("cart_session");
			String user_id = request.getParameter("session_id");
			int item_delivery = Integer.parseInt(request.getParameter("item_delivery"));
			int item_price = Integer.parseInt(request.getParameter("item_price2"));
			 
			//썸네일 불러오기
			ProductDao dao2 = new ProductDao();
			String file_s = dao2.thumbnail(item_uid);
			
			String[] io = request.getParameterValues("item_option");
			String[] ic = request.getParameterValues("item_count");
			String[] ip = request.getParameterValues("item_price");
			
			
			int[] int_ic = null;
			int_ic = new int[ic.length];
			
			int[] int_ip = null;
			int_ip = new int[ip.length];
			
			for(int i=0;i<io.length;i++) {
				System.out.println(item_name);
				System.out.println(io[i]);
				System.out.println(ic[i]);
				System.out.println(ip[i]);
				
				int_ic[i] = Integer.parseInt(ic[i]);
				int_ip[i] = Integer.parseInt(ip[i].replaceAll("[^0-9]", ""));
				
				Cart c = new Cart();
				c.setCart_session(cart_session);
				c.setUserid(user_id);
				c.setItem_uid(item_uid);
				c.setItem_name(item_name);
				c.setItem_option(io[i]);
				c.setItem_num(int_ic[i]);
				c.setPrice(item_price);
				c.setTotal(int_ip[i]);
				c.setDelivery(item_delivery);
				c.setFile1_s(file_s);
				
				OrderDao dao = new OrderDao();
				dao.cartInsert(c);
			} //for
			
				out.print("<script>");
				out.print("alert('장바구니 담기 성공');");
				out.print("location.href='/product/"+category+"?no="+item_uid+"'");
				out.print("</script>");
			}//else
	}

}
