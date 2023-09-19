package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection{

	public List<Product> getProductList(){
		List<Product> productList = new ArrayList<Product>();
	
		String sql = "SELECT * FROM product;";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(rs.getInt("units_in_stock"));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.err.println("리스트 조회 시 오류 발생 By - DAO.getProductList()");
			e.printStackTrace();
		}
		
		return productList;
	}
	
	public List<Product> getProductList(String orderName, String isDESC){
		List<Product> productList = new ArrayList<Product>();
	
		String sql = "SELECT * FROM product ORDER BY ? ?;";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, orderName);
			psmt.setString(2, isDESC);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(rs.getInt("units_in_stock"));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				
				productList.add(product);
			}
			
		} catch (SQLException e) {
			System.err.println("리스트 조회 시 오류 발생 By - DAO.getProductList(order by)");
			e.printStackTrace();
		}
		
		return productList;
	}
	
	public List<Product> getProductList(String search){
		List<Product> productList = new ArrayList<Product>();
	
		String sql = "SELECT * FROM product WHERE "
				+ "product_id LIKE '%?%' OR "
				+ "name LIKE '%?%' OR "
				+ "CAST(unit_price AS CHAR) LIKE '%?%' OR "
				+ "description LIKE '%?%' OR "
				+ "manufacturer LIKE '%?%' OR "
				+ "category LIKE '%?%' OR "
				+ "CAST(units_in_stock AS CHAR) LIKE '%?%' OR "
				+ "condition LIKE '%?%';";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, search);
			psmt.setString(2, search);
			psmt.setString(3, search);
			psmt.setString(4, search);
			psmt.setString(5, search);
			psmt.setString(6, search);
			psmt.setString(7, search);
			psmt.setString(8, search);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(rs.getInt("units_in_stock"));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				
				productList.add(product);
			}
			
		} catch (SQLException e) {
			System.err.println("리스트 조회 시 오류 발생 By - DAO.getProductList(search)");
			e.printStackTrace();
		}
		
		return productList;
	}
	
	
	

	
	public Product getProductById(String productId) {
		Product product = new Product();
		
		
		String sql = "SELECT * FROM product WHERE product_id= ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(rs.getInt("units_in_stock"));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				
			}
			
			
		} catch (SQLException e) {
			System.err.println("상품 조회 시 오류 발생 By - DAO.getProduct()");
			e.printStackTrace();
		}
		
		
		return product;
	}
	
	
	public int deleteProduct(String productId) {
		int result = 0;
		String sql = "DELETE FROM product WHERE product_id=?;";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("상품 삭제 시 오류 발생 By - DAO.deleteProduct()");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateProduct(int productId,Product product) {
		int result = 0;
		String sql = "UPDATE product SET name=?, unit_price=?, description=?, manufacturer=?, category=?, units_in_stock=?, condition=?, file=?;";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, product.getName());
			psmt.setInt(2, product.getUnitPrice());
			psmt.setString(3, product.getDescription());
			psmt.setString(4, product.getManufacturer());
			psmt.setString(5, product.getCategory());
			psmt.setLong(6, product.getUnitsInStock());
			psmt.setString(7, product.getCondition());
			psmt.setString(8, product.getFile());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("상품 수정 시 오류 발생 By - DAO.deleteProduct()");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insert(Product product) {
		int result = 0;
		String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?,?,?);";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getName());
			psmt.setInt(3, product.getUnitPrice());
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setLong(7, product.getUnitsInStock());
			psmt.setString(8, product.getCondition());
			psmt.setString(9, product.getFile());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
}
