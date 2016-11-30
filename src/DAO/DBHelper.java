package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Ad;
import model.User;

public class DBHelper {
	
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
			con.close();
		}
		catch(Exception e){System.out.println(e);}  
		
		
	}
	
	public static boolean validate(String name,String pass){  
		boolean status=false;  
		try{  
			Connection con = DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(  
					"select * from users where password=? and email=?");
			ps.setString(2,name);  
			ps.setString(1,pass);

			ResultSet rs=ps.executeQuery();  
			status=rs.next();  
			System.out.println("In model");
			con.close();
		}catch(Exception e){System.out.println(e);}  
		return status;  
	}  
	
	public void rent(int adId, String email) {
		try{  
			Connection con = DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement( "select user_id from users where email=?");
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			int renterId = 0;
			while(rs.next()){
				renterId = rs.getInt("user_id");
			}
			ps=con.prepareStatement( "select user_id,user_email from ads where ad_id=?");
			ps.setInt(1,adId);
			ResultSet rs2=ps.executeQuery();
			int userId = 0;
			String userEmail = "";
			while(rs2.next()){
				userId = rs2.getInt("user_id");
				userEmail = rs2.getString("user_email");
			}
			
			String sql="update ads set is_available=? where ad_id=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, adId);
			ps.executeUpdate();
			
			sql="insert into rentals(ad_user_id,renter_id,ad_id,renter_email,ad_user_email) values(?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1,userId);
			ps.setInt(2, renterId);
			ps.setInt(3, adId);
			ps.setString(4,email);
			ps.setString(5,userEmail);
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e){System.out.println(e);}  
		
	}
	
	public static void updateAdToDb(Ad newUser){ 
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gear4camp","root","Varun123.");
			String sql="update ads set title=?,description=?,rent_cost=?,image_link=? where ad_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, newUser.getTitle());
			ps.setString(2, newUser.getDesc());
			ps.setInt(3, newUser.getRentCost());
			ps.setString(4, newUser.getImageLink());
			ps.setInt(5,newUser.getAdId());
			System.out.println(newUser.getRentCost());
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e){System.out.println(e);}  
	}
	
	public void updateUserInDb(User newUser,String email){
		try{  
			
			Connection con = DBConnection.getConnection();
			
			String sql="update users set fname=?,lname = ?,email=?,password=?,city=?,state=?,country=?,address=?,zipcode=?,phone_number=? where email = ? ";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,newUser.getfName());
			ps.setString(2,newUser.getlName());
			ps.setString(3,newUser.getEmail());
			ps.setString(4,newUser.getPassword());
			ps.setString(5,newUser.getCity());
			ps.setString(6,newUser.getState());
			ps.setString(7,"USA");
			ps.setString(8,newUser.getAddress());
			ps.setString(9,newUser.getZipCode());//zip code is varchar in DB table
			ps.setString(10,newUser.getContactNo());
			ps.setString(11,email);
			int query1=ps.executeUpdate();
			con.close();
		}catch(SQLException e){
			System.out.println("Error in updating user account details"+e.getMessage());
		}
			
			
	}
	
	public static void insertUserToDb(User newUser){
		try{  
			Connection con = DBConnection.getConnection();
			String sql="insert into users(fname,lname,email,password,city,state,country,address,zipcode,phone_number) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,newUser.getfName());
			ps.setString(2,newUser.getlName());
			ps.setString(3,newUser.getEmail());
			ps.setString(4,newUser.getPassword());
			ps.setString(5,newUser.getCity());
			ps.setString(6,newUser.getState());
			ps.setString(7,"USA");
			ps.setString(8,newUser.getAddress());
			ps.setInt(9,Integer.parseInt(newUser.getZipCode()));
			ps.setString(10,newUser.getContactNo());
			int query1=ps.executeUpdate();
			con.close();
		}catch(Exception e){System.out.println(e);}  
	}
}
