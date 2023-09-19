package shop.dao;

import java.sql.SQLException;

public class UserManagement extends JDBConnection{
	
	public int login(String id, String pw) {
		int result = 0;
		
		String sql = "SELECT user_id, user_pw FROM userManagement WHERE user_id = ?;";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(pw.equals(rs.getString("user_pw"))) {
					result = 1;
				} else{
					result = 0;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public int signUp(String id, String pw, String name) {
		int result = 0;
		
		String sql = "INSERT INTO userManagement (user_id,user_pw,user_name) VALUES (?,?,?);";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
}
