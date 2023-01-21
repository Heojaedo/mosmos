package controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/regist_category1")
public class ProductRegistCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductRegistCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category1 = request.getParameter("category1");
		
		System.out.println("상품등록카테고리:"+category1);
		
		String text = "";
		
		if(category1.equals("beans")) {
			text = "<select name=\"productCate2\" style=\"height:25px\">\r\n" + 
					"			<option selected disabled>- [필수] 상세 카테고리를 선택해 주세요 -</option>\r\n" + 
					"			<option disabled>---------------</option>\r\n" + 
					"			<option value=\"blend\">시그니처 블렌드</option>\r\n" + 
					"			<option value=\"estate\">싱글 에스테이트</option>\r\n" + 
					"			<option value=\"easytomake\">EASY TO MAKE</option>\r\n" + 
					"		</select>";
		} 
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(text);
	}

}
