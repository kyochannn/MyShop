<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<%	
	request.setCharacterEncoding("UTF-8");
	String path = "C:\\KKC\\jsp\\MyWeb____\\src\\main\\webapp\\img";
	//파일을 가져올 수 있는 객체를 생성
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(10*1000*1000); //10mb 만큼을 가져올 수 잇음
	upload.setSizeThreshold(4*1024);	//메모리상 4mb의 최대크기
	upload.setRepositoryPath(path);	//임시저장경로를 지정
	
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator params =  items.iterator();
	Product product = new Product();
	
	//파일리스트가 있을때까지 반복문 돌리기
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		String value = item.getString("utf-8");
		//파일아이템(파람)이 일반일 경우
		//예를 들어, 상품명일 경우에 상품명을 가진 변수를 생성해서
		//그 변수를 서버에 넣어주면 됨. ?어떻게? 
		//값을 변수에 저장
		if (item.isFormField()){
		//getName은 업로드된 경로포함파일이름을 가져오는거고, getFieldName은 요청파라미터의 이름을 가지고 옴. 
			switch (item.getFieldName()) {
				case "productId": {
					//요청파라미터의 값을 가지고 옴. 
					product.setProductId(value);  break;
				}
				case "name": {
					product.setName(value);  break;
				}
				case "unitPrice": {
					product.setUnitPrice(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
				}
				case "description": {
					product.setDescription(value);  break;
				}
				case "manufacturer": {
					product.setManufacturer(value);  break;
				}
				case "category": {
					product.setCategory(value);  break;
				}
				case "unitsInStock": {
					product.setUnitsInStock(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
				}
				case "condition": {
					product.setCondition(value);  break;
				}
			}
			
		}
		//파일아이템(파람)이 파일일 경우
		//그 파일을 이미지라는 폴더에 넣기
		//서버에 이미지경로를 넣어주기
		
		else {
			String imgname = item.getName(); //이미지파일 이름 
			if (item==null || imgname=="" || imgname==null) continue;
			//String pathname = path + "/"+ imgname;		//이거랑, imgfile.getPath()랑 똑같지 않을까...만약에 안되면 
			File imgfile = new File(path + "/"+ imgname);		//경로포함한 이름
			item.write(imgfile);	//이미지를 이미지폴더에 저장
			String pathname2 = imgfile.getPath();
			//product.setFile(pathname);
			product.setFile(pathname2);
		}
	}
		int result = productDAO.insert(product);
		response.sendRedirect("products.jsp");
%>