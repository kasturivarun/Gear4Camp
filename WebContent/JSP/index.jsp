<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Gear4Camp home page for renting outdoor equipment.">
	<meta name="keywords" content="Gear4Camp, Outdoor, Gear, Equipment">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="JSP/index.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/WebContent/JSP/index.js" type="text/javascript"></script>
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
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "gear4camp";
String userId = "root";
String password = "Varun123.";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
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
                	<li><a href="JSP/my-account.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="JSP/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
				<%
				}
				%>
				<% %>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row" style="margin-top:5%;margin-left:30px;">

            <div class="col-md-3">
                <p class="lead">Categories</p>
                <div class="list-group">
                    <a href="#" class="list-group-item">Camping &amp; Hiking</a>
                    <a href="#" class="list-group-item">Water Sports</a>
                    <a href="#" class="list-group-item">Snow Sports</a>
                </div>
            </div>

            <div class="col-md-9">
				
				<h1>Rent Outdoor Equipment</h1>
				
				<div class="row" id="testinglol">    
					<div class="col-md-12">
						<div class="input-group">
							<div class="input-group-btn search-panel">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									<span id="search_concept">Sort by</span> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#relevance">Relevance</a></li>
									<li><a href="#highest_cost">Cost: High to Low</a></li>
									<li><a href="#lowest_cost">Cost: Low to High</a></li>
									<li><a href="#ratings">Ratings</a></li>
									<li><a href="#newest">Newest</a></li>
								</ul>
							</div>
							<input type="hidden" name="search_param" value="all" id="search_param">         
							<input type="text" class="form-control" name="x" placeholder="Search for equipment...">
							<span class="input-group-btn">
								<button class="btn btn-default" onclick="" type="button"><span class="glyphicon glyphicon-search"></span></button>
							</span>
						</div>
					</div>
				</div>
				
                <div class="row">
				
					<%
						try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM ads ORDER BY ad_id DESC";

						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>

                    <div class="col-sm-4 col-lg-4 col-md-4 panel">
                        <div class="thumbnail">
                            <img src=<%=resultSet.getString("image_link") %> alt="">
                            <div class="caption">
                                <h4 class="pull-right">$<%=resultSet.getString("rent_cost") %>/day</h4>
                                <h4><a href="JSP/ad-view.jsp"><%=resultSet.getString("title") %></a>
                                </h4>
                                <p><%=resultSet.getString("description") %></p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right"><a href="#"><%=resultSet.getString("user_email") %></a></p>
                                <p>
                                Posted By:
                                    <!-- <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span> -->
                                </p>
                            </div>
                        </div>
                    </div>
					
					<% 
					}

					} catch (Exception e) {
					e.printStackTrace();
					}
					%>

                    
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

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
