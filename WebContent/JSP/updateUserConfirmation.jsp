<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.DBConnection"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Gear4Camp home page for renting outdoor equipment.">
	<meta name="keywords" content="Gear4Camp, Outdoor, Gear, Equipment">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="index.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="index.js" type="text/javascript"></script>
	<title>Gear4Camp - Rent Outdoor Equipment</title>
	<script>
	$(function(){
		 $('.row').masonry({
		   // options
		   itemSelector : '.thumbnail, #box, h1',
		   columnWidth : 240,
		    isAnimated: true
		 });
		});
	</script>
</head>
<body>

<%
String id = request.getParameter("userId");
Connection con = DBConnection.getConnection();
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
					<li><a href="JSP/my-account.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="JSP/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> logout
					<%-- <%hs.removeAttribute("uname");
						
					%> --%>
					
					</a></li>
				</ul>
				<%}
                else{
                %>
                <ul class="nav navbar-nav navbar-right">
					<li><a href="JSP/login.jsp"><span class="glyphicon glyphicon-log-in"></span> login</a></li>
				</ul>
				<%
				}
				%>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="container" style="margin-top:10%;margin-left:15%;">

        <div class="row">
        <h3>User information has been updated</h3>
        <a href="JSP/my-account.jsp">&lt back to My Account page</a>
        </div>
   </div>

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
