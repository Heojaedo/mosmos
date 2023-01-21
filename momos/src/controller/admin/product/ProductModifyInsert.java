package controller.admin.product;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import dao.AdminDao;
import dao.ProductDao;
import model.Item;

@WebServlet("/admin/itemModify_insert")
public class ProductModifyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductModifyInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String uploadPath = "C:\\jsp_project\\momos\\WebContent\\upload";
		int size = 10*1024*1024; //10메가

		MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		
		String item_uid = multi.getParameter("item_uid");
		//이미지 수정 없을 시 원래 이미지, 썸네일 파일명 넣기
		ProductDao dao2 = new ProductDao();
		Item i2 = dao2.filenameSelect(item_uid);
		
		
		String file_name = multi.getParameter("file_name");
		
		String file1 = (String)files.nextElement();;
		String file1_name = i2.getFile1();
		String filename2 = i2.getFile1_s();
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
		
		String cate1 = multi.getParameter("productCate1");
		String cate2 = "";
		String cate3 = "";
		
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
		
		if(cate1.equals("beans")) { //카테고리1이 원두일때
			if(multi.getParameter("productCate3") != null) { //카테고리2만 수정
				cate3 = multi.getParameter("productCate3");
				
				Item i = new Item();
				i.setCategory1(cate1);
				i.setCategory2(cate3);
				i.setGift(productGift);
				i.setName(productName);
				i.setSubname(productSubname);
				i.setPrice(productPrice);
				i.setDelivery(productDelivery);
				i.setFile1(file1_name);
				i.setFile1_s(filename2);
				
				AdminDao dao = new AdminDao();
				dao.itemModify(i,item_uid);
				
				response.sendRedirect("/admin/itemList");
			} else {
				if(multi.getParameter("productCate2") == null) {
					out.print("<script>");
					out.print("alert('상세 분류는 필수 항목입니다.');");
					out.print("history.back();");
					out.print("</script>");
				} else {
					cate2 = multi.getParameter("productCate2");
					
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
					
					AdminDao dao = new AdminDao();
					dao.itemModify(i,item_uid);
					
					response.sendRedirect("/admin/itemList");
				}
			}
		} else { //카테고리1이 원두가 아닐때
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
			
			AdminDao dao = new AdminDao();
			dao.itemModify(i,item_uid);
			
			response.sendRedirect("/admin/itemList");
		}
		

	}//void

}
