<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Gear4Camp home page for renting outdoor equipment.">
	<meta name="keywords" content="Gear4Camp, Outdoor, Gear, Equipment">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="index.css" rel="stylesheet" type="text/css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<title>Gear4Camp - Login</title>
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
                   	
                </ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="my-account.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-9">							
                <div class="row">
					
					<div class="container">

						<form class="well form-horizontal" action="../servlet1" method="post" id="contact_form">
							<fieldset>

								<!-- Form Name -->
								<legend>Login</legend>

								<!--Input for Username, which is the user's email address-->
								<div class="form-group">
									<label class="col-md-4 control-label">E-mail</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
											<input type="email" class="form-control" name="username" id="username" placeholder="Enter email">
											<input type="hidden" name="param" value="Login">
										</div>
									</div>
								</div>
  
								<!-- Input for password-->
								<div class="form-group">
									<label class="col-md-4 control-label">Password</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
											<input type="password" class="form-control" name="userpass" id="password" placeholder="Enter password">
										</div>
									</div>
								</div>
	
								<!--Remember Me checkbox-->
								<div class="form-group">
									<label class="col-md-4 control-label"></label>
									<div class="col-md-4 inputGroupContainer">
										<div class="checkbox">
											<label><input type="checkbox" id="rememberMeCheckbox"> Remember me</label>
										</div>
									</div>
								</div>

								<!-- Button -->
								<div class="form-group">
									<label class="col-md-4 control-label"></label>
									<div class="col-md-4">
										<button type="submit" class="btn btn-warning">Login <span class="glyphicon glyphicon-log-in"></span></button>
									</div>
								</div>
								
								<!-- Register if no account-->
								<div class="form-group">
									<label class="col-md-4 control-label"></label>
									<div class="col-md-4 inputGroupContainer">
										<p>No account? <a href="register.jsp">Register now</a></p>
									</div>
								</div>

							</fieldset>
						</form>
					</div>
					<!-- /.container -->
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
                    <p>Copyright &copy; Gear4Camp 2016</p>
                </div>
            </div>
        </footer>
    </div>
    <!-- /.container -->
</body>

</html>