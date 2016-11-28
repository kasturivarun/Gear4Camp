package functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import DAO.DBConnection;

public class rentProduct {

	public void rent(int adId) {
		try{  
			Connection con = DBConnection.getConnection();
			String sql="update ads set is_available=? where ad_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, adId);
			ps.executeUpdate();
		}
		catch(Exception e){System.out.println(e);}  
		
	}
	
}
