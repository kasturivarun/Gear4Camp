package functions;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import DAO.DBConnection;
import model.User;

public class UpdateUserFunction {

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
		}catch(SQLException e){
			System.out.println("Error in updating user account details"+e.getMessage());
		}
			
			
	}
}

			
			
			
			
			
			
		


