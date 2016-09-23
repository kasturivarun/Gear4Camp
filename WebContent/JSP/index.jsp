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
    <link href="index.css" rel="stylesheet" type="text/css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script   src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<title>Gear4Camp - Rent Outdoor Equipment</title>
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
                <a class="navbar-brand" href="#">Gear4Camp</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="JSP/create-ad.html">Create Ad</a>
						<!--First have to check if user has an account and is logged in-->
						<!--If not, send to login page first-->
                    </li>
                </ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="JSP/login.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
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

				<!--Maybe implement this in later iterations for a featured equipment
                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
				-->
				
				<h1>Rent Outdoor Equipment</h1>
				
                <div class="row">
				
					<%
						try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM ads";

						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$<%=resultSet.getString("rent_cost") %>/day</h4>
                                <h4><a href="#"><%=resultSet.getString("title") %></a>
                                </h4>
                                <p>Example Short Equipment Description. Real equipment info will be added and displayed dynamically.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 Reviews for renter</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
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

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$64.99/day*</h4>
                                <h4><a href="#">Equipment 2</a>
                                </h4>
                                <p>Example Short Equipment Description.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">12 Reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$74.99/day</h4>
                                <h4><a href="#">Equipment 3</a>
                                </h4>
                                <p>Example Short Equipment Description</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 Reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$84.99/day*</h4>
                                <h4><a href="#">Equipment 4</a>
                                </h4>
                                <p>Example Short Equipment Description</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">6 Reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$94.99/day</h4>
                                <h4><a href="#">Equipment 5</a>
                                </h4>
                                <p>Example Short Equipment Description</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 Reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
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
