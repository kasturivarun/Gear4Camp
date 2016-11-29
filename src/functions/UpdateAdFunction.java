package functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.DBConnection;
import model.Ad;
import model.User;

public class UpdateAdFunction {
	public static void insertAdToDb(Ad newUser){ 
		try{  
			Connection con = DBConnection.getConnection();
			String sql="update ads set title=?,description=?,rent_cost=?,image_link=? where ad_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, newUser.getTitle());
			ps.setString(2, newUser.getDesc());
			ps.setInt(3, newUser.getRentCost());
			ps.setString(4, newUser.getImageLink());
			ps.setInt(5,newUser.getAdId());
			System.out.println(newUser.getRentCost());
			ps.executeUpdate();
		}
		catch(Exception e){System.out.println(e);}  
	}
}
