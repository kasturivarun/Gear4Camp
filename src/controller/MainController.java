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
import functions.UpdateAdFunction;
import functions.UpdateUserFunction;
import functions.UserRegistrationFunction;
import functions.rentProduct;


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
		else if(jspName.equalsIgnoreCase("Register"))
		{
			UserRegister(request,response);
		}		
		else if(jspName.equalsIgnoreCase("CreateAd"))
		{
			CreateNewAd(request,response);
		}
		else if(jspName.equalsIgnoreCase("userUpdate"))
		{
			EditAccountDetails(request,response);
		}
		else if(jspName.equalsIgnoreCase("editAd"))
		{
			adUpdate(request,response);
		}
		else if(jspName.equalsIgnoreCase("searchAd"))
		{
			String s = request.getParameter("searchWord");
			request.setAttribute("searchWord",s);
			RequestDispatcher rd=request.getRequestDispatcher("JSP/index.jsp");
	        rd.forward(request,response);
		}
		
		else if(jspName.equalsIgnoreCase("rentAd"))
		{
			rent(request,response);
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
	 		HttpSession hs=request.getSession(true);
			hs.setAttribute("uname", newUser.getEmail());
	 		RequestDispatcher rd=request.getRequestDispatcher("JSP/registrationConfirmation.jsp");
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
    	newAd.setCategory(request.getParameter("category"));
    	newAd.setName(request.getParameter("name"));
    	newAd.setCondition(request.getParameter("condition"));
    	newAd.setPhn_no(request.getParameter("phone_number"));
    	HttpSession hs=request.getSession(true);
    	newAd.setEmail((String) hs.getAttribute("uname"));
    	System.out.println(newAd.getEmail());
    	try
	 	{
    		CreateAdFunction ur = new CreateAdFunction();
	 		ur.insertAdToDb(newAd);
	 		RequestDispatcher rd=request.getRequestDispatcher("JSP/createAdConfirmation.jsp");
	 		rd.include(request,response);
	 	}

	 	catch(Exception e1)
	 	{
	 		System.out.println("error occured");
	 	}
    }
    public void EditAccountDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	User user = new User();
    	user.setfName(request.getParameter("first_name"));
    	user.setlName(request.getParameter("last_name"));
    	user.setEmail(request.getParameter("email"));
    	user.setPassword(request.getParameter("password"));
    	user.setContactNo(request.getParameter("phone_number"));
    	user.setState(request.getParameter("state"));
    	user.setCity(request.getParameter("city"));
    	user.setZipCode(request.getParameter("zip"));
    	
    	//get user from session
    	HttpSession hs=request.getSession(true);
		String email = (String) hs.getAttribute("uname");
		
    	try
	 	{
    		UpdateUserFunction uuf = new UpdateUserFunction();
	 		uuf.updateUserInDb(user,email);
	 		RequestDispatcher rd=request.getRequestDispatcher("JSP/my-account.jsp");
	 		//rd.include(request,response);
	 		rd.forward(request, response);
	 	}

	 	catch(Exception e1)
	 	{
	 		System.out.println("error occured");
	 	}
    }
    
    public void adUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	User newUser = new User();
    	System.out.println("In adupdate function");
    	Ad newAd = new Ad();
    	newAd.setTitle(request.getParameter("ad_title"));
    	newAd.setDesc(request.getParameter("description"));
    	newAd.setRentCost(Integer.parseInt(request.getParameter("cost")));
    	newAd.setImageLink(request.getParameter("picture_link"));
    	newAd.setAdId(Integer.parseInt(request.getParameter("adId")));
    	
    	try
	 	{
    		UpdateAdFunction ur = new UpdateAdFunction();
	 		ur.insertAdToDb(newAd);
	 		RequestDispatcher rd=request.getRequestDispatcher("JSP/updateAdConfirmation.jsp");
	 		rd.include(request,response);
	 	}

	 	catch(Exception e1)
	 	{
	 		System.out.println("error occured");
	 	}
    	
    }
    
    public void rent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	int adId = Integer.parseInt(request.getParameter("adId"));
    	
    	try
	 	{
    		rentProduct ur = new rentProduct();
	 		ur.rent(adId);
	 		RequestDispatcher rd=request.getRequestDispatcher("JSP/rentConfirmation.jsp");
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
