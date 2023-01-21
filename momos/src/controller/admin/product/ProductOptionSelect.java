package controller.admin.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/optionSelect")
public class ProductOptionSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductOptionSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String itemName = request.getParameter("name");
		String itemPrice = request.getParameter("price");
		String itemOption = request.getParameter("option");
		
		System.out.println(itemName+itemPrice+itemOption);
	}

}
