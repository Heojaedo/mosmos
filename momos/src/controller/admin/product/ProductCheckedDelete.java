package controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;

@WebServlet("/admin/CheckedItemDelete")
public class ProductCheckedDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductCheckedDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_no = request.getParameter("no");
		
		AdminDao dao = new AdminDao();
		
		String[] item_uid_arr = item_no.split(",");
		
		String item_uid = "";
		
		for(int i=0;i<item_uid_arr.length;i++) {
			item_uid = item_uid_arr[i];
			dao.itemDelete(item_uid);
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('삭제 완료');");
		out.print("location.href='/admin/itemList';");
		out.print("</script>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
