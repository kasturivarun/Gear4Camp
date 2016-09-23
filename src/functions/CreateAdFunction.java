package functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Ad;
import model.User;

public class CreateAdFunction {

	public static void insertAdToDb(Ad newAd, String email){ 
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gear4camp","root","Varun123.");
			PreparedStatement ps=con.prepareStatement( "select user_id from users where email=?");
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			System.out.println();
			int userId = 0;
			while(rs.next()){
				userId = rs.getInt("user_id");
				
			}
			System.out.println(userId);
			String sql="insert into ads(user_id,title,description,rent_cost,image_link) values(?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, newAd.getTitle());
			ps.setString(3, newAd.getDesc());
			ps.setInt(4, newAd.getRentCost());
			ps.setString(5, newAd.getImageLink());
			int query1=ps.executeUpdate();
		}
		catch(Exception e){System.out.println(e);}  
	}
}
