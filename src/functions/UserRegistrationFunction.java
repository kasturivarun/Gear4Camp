package functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class UserRegistrationFunction {

	public static void insertToDb(User newUser){
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gear4camp","root","Varun123.");  
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
		}catch(Exception e){System.out.println(e);}  
	}

}
