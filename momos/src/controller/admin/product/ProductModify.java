package controller.admin.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import model.Item;

@WebServlet("/admin/itemModify")
public class ProductModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_uid = request.getParameter("item_uid");
		
		AdminDao dao = new AdminDao();
		Item i = dao.itemInfo(item_uid); //수정 페이지에 상품 정보 불러오기
		
		request.setAttribute("item_uid", item_uid);
		request.setAttribute("item_name", i.getName());
		request.setAttribute("item_subname", i.getSubname());
		request.setAttribute("item_price", i.getPrice());
		request.setAttribute("item_delivery", i.getDelivery());
		request.setAttribute("item_cate1", i.getCategory1());
		request.setAttribute("item_cate2", i.getCategory2());
		request.setAttribute("item_gift", i.getGift());
		request.setAttribute("item_file", i.getFile1());
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}

}
