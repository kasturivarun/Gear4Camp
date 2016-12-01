<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Gear4Camp view ad in more detail.">
	<meta name="keywords" content="Gear4Camp, Outdoor, Gear, Equipment">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="index.css" rel="stylesheet" type="text/css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<title>Gear4Camp - View Ad</title>
</head>
<body>

<%
String id = request.getParameter("adId");
String rentId = request.getParameter("rentId");
System.out.println(rentId);
Connection connection = DBConnection.getConnection();
Statement statement = null;
ResultSet resultSet = null;
HttpSession hs=request.getSession(true);
%>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="http://localhost:8080/Gear4Camp/">Gear4Camp</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <%if(hs.getAttribute("uname")!= null) 
	                {
	                %>
                    <li>
                        <a href="JSP/create-ad.jsp">Create Ad</a>
						<!--First have to check if user has an account and is logged in-->
						<!--If not, send to login page first-->
                    </li>
                    <%
					}
					%>
                </ul>
                <%if(hs.getAttribute("uname")!= null) 
                {
                %>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="my-account.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> logout
					
					</a></li>
				</ul>
				<%}
                else{
                %>
                <ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> login</a></li>
				</ul>
				<%
				}
				%>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    <%
		try{ 
		statement=connection.createStatement();
		String sql ="SELECT * FROM ads where ad_id='"+id+"'";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-2"></div>

            <div class="col-md-8">
				<h1 id="ad_title"><%=resultSet.getString("title") %></h1>
				
                <div class="row">

                    <div>
						<img src=<%=resultSet.getString("image_link") %> alt="Picture of equipment" style="width:50%;height:50%;">
						<div>
							<h3 class="pull-right" style="margin-right:30%;">$<%=resultSet.getString("rent_cost") %>*</h3>
							<h3><%=resultSet.getString("title") %></h3>
						</div>
						<div>
							<p>Ad ID#<%=resultSet.getInt("ad_id") %></p>
							
						</div>
						<form action="../servlet1" method="post" id="rent_request_form">
							<div class="form-group">
							<div class="radio">
							  <label><input type="radio" name="requestStatus" value="approve">Approve</label>
							</div>
							<div class="radio">
							  <label><input type="radio" name="requestStatus" value="reject">Reject</label>
							</div>
							<input type="hidden" name="adId" value="<%=resultSet.getInt("ad_id") %>">
							<input type="hidden" name="rentId" value="<%=rentId%>">
							<input type="hidden" name="param" value="rentStatus">
									<button type="submit" class="btn btn-warning">Submit <span class="glyphicon glyphicon-send"></span></button>
							</div>
						</form>
                    </div>
                </div>
            </div>
			
			<div class="col-md-2"></div>
			
        </div>
    </div>
    <!-- /.container -->
    
    <% 
	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

    <div class="container">
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
					<p>* = price negotiable</p>
                    <p>Copyright &copy; Gear4Camp 2016</p>
                </div>
            </div>
        </footer>
    </div>
    <!-- /.container -->
</body>

</html>
