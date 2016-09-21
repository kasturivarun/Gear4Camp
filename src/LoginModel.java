import java.sql.*;  
  
public class LoginModel {  
public static boolean validate(String name,String pass){  
boolean status=false;  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://sql9.freemysqlhosting.net/sql9136014","sql9136014","u2JsXLcsgW");  

System.out.println("con"+name+"pass"+pass);
PreparedStatement ps=con.prepareStatement(  
"select * from User where email=? and passward=?");  
ps.setString(1,name);  
ps.setString(2,pass);  
      
ResultSet rs=ps.executeQuery();  
status=rs.next();  
          
}catch(Exception e){System.out.println(e);}  
return status;  
}  
}  