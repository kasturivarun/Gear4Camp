<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                    <li>
                        <a href="create-ad.html">Create Ad</a>
						<!--First have to check if user has an account and is logged in-->
						<!--If not, send to login page first-->
                    </li>
                </ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="my-account.html"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-2"></div>

            <div class="col-md-8">
				<h1 id="ad_title">Title of Ad</h1>
				
                <div class="row">

                    <div>
						<img src="http://placehold.it/320x150" alt="Picture of equipment">
						<div>
							<h3 class="pull-right">$24.99/day*</h3>
							<h3>Name of the Equipment / Item for rent</h3>
						</div>
						<div>
							<p>Ad ID #: Ad ID Number goes here</p>
							<p>Category: Category goes here</p>
							<p>Example Equipment Description here...</p>
							<p>Condition here</p>
							<p>Contact email here. Ad poster can include phone number here if they want.</p>
						</div>
						<form action="../servlet1" method="post" id="rent_request_form">
							<div class="form-group">
									<button type="submit" class="btn btn-warning">Request to Rent <span class="glyphicon glyphicon-send"></span></button>
							</div>
						</form>
                    </div>
                </div>
            </div>
			
			<div class="col-md-2"></div>
			
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
