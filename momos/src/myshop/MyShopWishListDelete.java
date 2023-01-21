package myshop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyShopDao;


@WebServlet("/myshop/wish_list_delete")
public class MyShopWishListDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MyShopWishListDelete() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str = request.getParameter("str");
		String[] aaa = str.split(",");
		for(int i = 0; i < aaa.length; i++) {
			System.out.print(aaa[i]);
		}
	
		MyShopDao dao = new MyShopDao();
		dao.wishListDelete(aaa);
		
		response.sendRedirect("/myshop/wish_list");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
