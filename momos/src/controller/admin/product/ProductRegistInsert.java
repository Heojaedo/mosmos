package controller.admin.product;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDao;
import model.Item;

@WebServlet("/admin/regist_insert")
public class ProductRegistInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductRegistInsert() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String uploadPath = "C:\\jsp_project\\momos\\WebContent\\upload";
		int size = 10*1024*1024; //10메가

		MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		
		String file1 = (String)files.nextElement();;
		String file1_name = "";
		String filename2 = "";
		if(multi.getFilesystemName(file1) != null) {
			file1_name = multi.getFilesystemName(file1);
			
			//썸네일
			ParameterBlock pb = new ParameterBlock();
			pb.add(uploadPath + "/" + file1_name);
			RenderedOp rOp = JAI.create("fileload",pb);

			BufferedImage bi = rOp.getAsBufferedImage();
			BufferedImage thumb = new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);

			Graphics2D g = thumb.createGraphics();
			g.drawImage(bi,0,0,100,100,null);

			filename2 = "sm_" + file1_name;
			File file = new File(uploadPath + "/" + filename2);
			ImageIO.write(thumb,"jpg",file);
		}
		System.out.println("file1:"+file1);
		System.out.println("file1_name:"+file1_name);
		
		System.out.println("카테고리:"+multi.getParameter("productCate1"));
		

				
		String cate1 = "";
		if(multi.getParameter("productCate1") == null) {
			out.print("<script>");
			out.print("alert('카테고리는 필수 항목입니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else if(multi.getParameter("productCate1") != null) { //카테고리1 선택 후
			cate1 = multi.getParameter("productCate1");
			
			String cate2 = "";
			
			if(multi.getParameter("productCate1").equals("beans")) { //원두 선택
				if(multi.getParameter("productCate2") == null) { //상세 분류를 선택 안하면
					out.print("<script>");
					out.print("alert('상세 분류는 필수 항목입니다.');");
					out.print("history.back();");
					out.print("</script>");
				} else { //상세 분류 선택
					cate2 = multi.getParameter("productCate2");
					
					String productGift = "";
					if(multi.getParameter("productGiftset") != null) {
						productGift = multi.getParameter("productGiftset");
					}
					String productName = multi.getParameter("productName");
					String productSubname = multi.getParameter("productSubname");
					int productPrice = 0;
					if(multi.getParameter("productPrice") != null) {
						productPrice = Integer.parseInt(multi.getParameter("productPrice"));
					}
					int productDeposit = 0;
					int productDelivery = 0;
					if(multi.getParameter("productDelivery") != null) {
						productDelivery = Integer.parseInt(multi.getParameter("productDelivery"));
					}
					int count = 0;
					
					Item i = new Item();
					i.setCategory1(cate1);
					i.setCategory2(cate2);
					i.setGift(productGift);
					i.setName(productName);
					i.setSubname(productSubname);
					i.setPrice(productPrice);
					i.setDelivery(productDelivery);
					i.setFile1(file1_name);
					i.setFile1_s(filename2);
					
					ProductDao dao = new ProductDao();
					dao.productRegist(cate1,i);
					
					response.sendRedirect("/category/"+cate1);
				}
			} else { //다른 항목 선택
				String productGift = "";
				if(multi.getParameter("productGiftset") != null) {
					productGift = multi.getParameter("productGiftset");
				}
				String productName = multi.getParameter("productName");
				String productSubname = multi.getParameter("productSubname");
				int productPrice = 0;
				if(multi.getParameter("productPrice") != null) {
					productPrice = Integer.parseInt(multi.getParameter("productPrice"));
				}
				int productDelivery = 0;
				if(multi.getParameter("productDelivery") != null) {
					productDelivery = Integer.parseInt(multi.getParameter("productDelivery"));
				}
				
				Item i = new Item();
				i.setCategory1(cate1);
				i.setCategory2(cate2);
				i.setGift(productGift);
				i.setName(productName);
				i.setSubname(productSubname);
				i.setPrice(productPrice);
				i.setDelivery(productDelivery);
				i.setFile1(file1_name);
				i.setFile1_s(filename2);
				
				ProductDao dao = new ProductDao();
				dao.productRegist(cate1,i);
				
				response.sendRedirect("/category/"+cate1);
			}
			
		}
		
	} //void

} //class
