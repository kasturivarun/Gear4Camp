package controller;




import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Ad;
import model.User;
import functions.CreateAdFunction;
import functions.LoginModel;
import functions.UserRegistrationFunction;


/**
 * Servlet implementation class FristServlet
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String jspName=request.getParameter("param");
		
		if(jspName.equalsIgnoreCase("Login"))
		{
			Login(request,response);
		}
		
		if(jspName.equalsIgnoreCase("Register"))
		{
			UserRegister(request,response);
		}
		
		if(jspName.equalsIgnoreCase("CreateAd"))
		{
			CreateNewAd(request,response);
		}
		
		
	}
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    public void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	          
	    String n=request.getParameter("username");  
	    String p=request.getParameter("userpass");  
	    LoginModel lm = new LoginModel();
	          
	    if(LoginModel.validate(n, p)){
	    	request.setAttribute("name",n);
	    	HttpSession hs=request.getSession(true);
			hs.setAttribute("uname", n);
	        RequestDispatcher rd=request.getRequestDispatcher("JSP/index.jsp");
	        rd.forward(request,response);
	    }  
	    else{  
	        RequestDispatcher rd=request.getRequestDispatcher("JSP/login.jsp");
	        rd.include(request,response);  
	    }  
	          
	    out.close();  
    }
    
    public void UserRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	User newUser = new User();
    	newUser.setfName(request.getParameter("first_name"));
    	newUser.setlName(request.getParameter("last_name"));
    	newUser.setEmail(request.getParameter("email"));
    	newUser.setPassword(request.getParameter("password"));
    	newUser.setContactNo(request.getParameter("phone_number"));
    	newUser.setState(request.getParameter("state"));
    	newUser.setCity(request.getParameter("city"));
    	newUser.setZipCode(request.getParameter("zip"));
    	
    	try
	 	{
	 		UserRegistrationFunction ur = new UserRegistrationFunction();
	 		ur.insertToDb(newUser);
	 		RequestDispatcher rd=request.getRequestDispatcher("JSP/index.jsp");
	 		rd.include(request,response);
	 	}

	 	catch(Exception e1)
	 	{
	 		System.out.println("error occured");
	 	}
    	
    }
    
    public void CreateNewAd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	Ad newAd = new Ad();
    	newAd.setTitle(request.getParameter("title"));
    	newAd.setDesc(request.getParameter("description"));
    	newAd.setRentCost(Integer.parseInt(request.getParameter("cost")));
    	newAd.setImageLink(request.getParameter("picture_link"));
    	String email = request.getParameter("email");
    	
    	try
	 	{
    		CreateAdFunction ur = new CreateAdFunction();
	 		ur.insertAdToDb(newAd,email);
	 		RequestDispatcher rd=request.getRequestDispatcher("JSP/index.jsp");
	 		rd.include(request,response);
	 	}

	 	catch(Exception e1)
	 	{
	 		System.out.println("error occured");
	 	}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	    }  
	

}
