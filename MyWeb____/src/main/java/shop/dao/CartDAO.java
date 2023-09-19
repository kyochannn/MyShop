package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Cart;
import shop.dto.Product;

public class CartDAO extends JDBConnection {

	public List<Cart> getCart(String user_id) {
		List<Cart> cartList = new ArrayList<Cart>();

		String sql = "SELECT * FROM cart WHERE user_id=?;";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				Cart cart = new Cart();

				cart.setCartId(rs.getInt("cart_id"));
				cart.setProductId(rs.getString("product_id"));
				cart.setName(rs.getString("name"));
				cart.setUnitPrice(rs.getInt("unit_price"));
				cart.setDescription(rs.getString("description"));
				cart.setManufacturer(rs.getString("manufacturer"));
				cart.setCategory(rs.getString("category"));
				cart.setUnitsInStock(rs.getInt("units_in_stock"));
				cart.setCondition(rs.getString("condition"));
				cart.setFile(rs.getString("file"));

				cartList.add(cart);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cartList;
	}

	public int addProduct(String user_id,Product product) {
		int result = 0;
		String sql = "INSERT INTO cart (product_id, name, unit_price, description, manufacturer, category, units_in_stock, condition, file, user_id)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?);";
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
			psmt.setString(10, user_id);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public int delProduct(int cartId) {
		int result = 0;
		
		String sql = "DELETE FROM cart WHERE cart_id=?;";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, cartId);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int delAll(String user_id) {
		int result = 0;
		
		String sql = "DELETE FROM cart WHERE user_id=?;";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
