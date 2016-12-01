package functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.DBConnection;
import model.Ad;
import model.User;

public class UpdateAdFunction {
	public static void updateAdInDb(Ad ad){ 
		try{  
			Connection con = DBConnection.getConnection();
			String sql="update ads set title=?,description=?,rent_cost=?,image_link=? where ad_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, ad.getTitle());
			ps.setString(2, ad.getDesc());
			ps.setInt(3, ad.getRentCost());
			ps.setString(4, ad.getImageLink());
			ps.setInt(5,ad.getAdId());
			System.out.println(ad.getRentCost());
			ps.executeUpdate();
		}
		catch(Exception e){System.out.println(e);}  
	}
}
