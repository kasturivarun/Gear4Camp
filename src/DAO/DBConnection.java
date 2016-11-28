package DAO;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

	public static Connection getConnection() {
		Properties props = new Properties();
		FileInputStream fis = null;
		InputStream propertiesInputStream = Thread.currentThread()
			    .getContextClassLoader().getResourceAsStream("config.properties");
		Connection con = null;
		try {
			//fis = new FileInputStream("/Gear4Camp/resources/config.properties");
			//props.load(fis);
			props.load(propertiesInputStream);
			// load the Driver Class
			Class.forName(props.getProperty("dbDriver"));
			
			// create the db connection 
			con = DriverManager.getConnection(props.getProperty("dbConnectionURL"),
					props.getProperty("dbUser"),
					props.getProperty("dbPassword"));
		} catch (IOException | ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
		return con;
	}
}
