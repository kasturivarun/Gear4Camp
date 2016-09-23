package functions;


import java.sql.*;  

public class LoginModel {  
	public static boolean validate(String name,String pass){  
		boolean status=false;  
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gear4camp","root","Varun123.");  

			PreparedStatement ps=con.prepareStatement(  
					"select * from users where password=? and email=?");
			ps.setString(2,name);  
			ps.setString(1,pass);

			ResultSet rs=ps.executeQuery();  
			status=rs.next();  

		}catch(Exception e){System.out.println(e);}  
		return status;  
	}  
}  