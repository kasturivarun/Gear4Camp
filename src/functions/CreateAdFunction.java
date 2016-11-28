package functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.DBConnection;
import model.Ad;
import model.User;

public class CreateAdFunction {

	public static void insertAdToDb(Ad newAd){ 
		try{  
			Connection con = DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement( "select user_id from users where email=?");
			ps.setString(1,newAd.getEmail());
			ResultSet rs=ps.executeQuery();
			System.out.println();
			int userId = 0;
			while(rs.next()){
				userId = rs.getInt("user_id");
			}
			
			String sql="insert into ads(user_id,title,description,rent_cost,image_link,user_email,item_name,category) values(?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, newAd.getTitle());
			ps.setString(3, newAd.getDesc());
			ps.setInt(4, newAd.getRentCost());
			ps.setString(5, newAd.getImageLink());
			ps.setString(6, newAd.getEmail());
			ps.setString(7, newAd.getName());
			ps.setString(8, newAd.getCategory());
			ps.executeUpdate();
		}
		catch(Exception e){System.out.println(e);}  
	}
}
