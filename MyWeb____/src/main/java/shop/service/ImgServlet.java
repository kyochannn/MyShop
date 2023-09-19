package shop.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.ProductRepository;
import shop.dto.Product;

/**
 * Servlet implementation class imgServlet
 */
@WebServlet("/shop/img")
public class ImgServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

/**
* @see HttpServlet#HttpServlet()
*/
public ImgServlet() {
super();
// TODO Auto-generated constructor stub
}

/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
*      response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
String id = request.getParameter("id");
System.out.println(id);
ProductRepository productDAO = new ProductRepository();

Product product = productDAO.getProductById(id);
String file = product.getFile();

// 상품 이미지가 없을 때, 기본이미지로 응답!
if(file ==null || file.equals("")) {
	file="/Users/kookyochan/eclipse-workspace/MyWeb____/src/main/webapp/img/no-image.jpg";
}

String ext = file.substring(file.lastIndexOf(".")+1).toUpperCase();

String mediaType = "image/jpeg";

switch(ext) {
case "JPG" :
	case "JPEG" : mediaType="image/jpeg"; break;
	case "PNG" : mediaType="image/png"; break;
	case "GIF" : mediaType="image/gif"; break;
	case "WEBP" : mediaType="image/webp"; break;
}

response.setContentType(mediaType);

try (FileInputStream fis = new FileInputStream(file); OutputStream out = response.getOutputStream()) {
byte[] buffer = new byte[1024]; //빈 byte 배열 생성
int bytesRead;

while ((bytesRead = fis.read(buffer)) != -1) {
	out.write(buffer, 0, bytesRead);
}
} catch (IOException e) {
	e.printStackTrace();
}

}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
*      response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
// TODO Auto-generated method stub
	doGet(request, response);
}

}