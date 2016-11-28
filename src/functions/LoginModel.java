package functions;


import java.sql.*;

import DAO.DBConnection;  

public class LoginModel {  
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

		}catch(Exception e){System.out.println(e);}  
		return status;  
	}  
}  