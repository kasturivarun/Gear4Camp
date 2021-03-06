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
	<script   src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<title>Gear4Camp - Register</title>
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
					<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
						<input type="hidden" name="param" value="Register">
							<fieldset>

								<!-- Form Name -->
								<legend>Register</legend>

								<!-- Text input for required first name-->
								<div class="form-group">
									<label class="col-md-4 control-label">First Name*</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input name="first_name" placeholder="First Name" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input for required last name-->
								<div class="form-group">
									<label class="col-md-4 control-label">Last Name*</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input name="last_name" placeholder="Last Name" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input for required email-->
								<div class="form-group">
									<label class="col-md-4 control-label">E-Mail*</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
											<input name="email" placeholder="E-Mail Address" class="form-control" type="text">
										</div>
									</div>
								</div>
								
								<!-- Input for password-->
								<div class="form-group">
									<label class="col-md-4 control-label">Password*</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
											<input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
										</div>
									</div>
								</div>
								
								<!-- Input for password-->
								<div class="form-group">
									<label class="col-md-4 control-label">Confirm Password*</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
											<input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="Confirm password">
										</div>
									</div>
								</div>

								<!-- Text input for optional phone number-->
								<div class="form-group">
									<label class="col-md-4 control-label">Phone #</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
											<input name="phone_number" placeholder="(123) 456-7890" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Select Basic for required State-->
								<div class="form-group">
									<label class="col-md-4 control-label">State*</label>
										<div class="col-md-4 selectContainer">
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
												<select name="state" class="form-control selectpicker">
													<option value=" " >Please select your state</option>
													<option>Alabama</option>
													<option>Alaska</option>
													<option >Arizona</option>
													<option >Arkansas</option>
													<option >California</option>
													<option >Colorado</option>
													<option >Connecticut</option>
													<option >Delaware</option>
													<option >District of Columbia</option>
													<option> Florida</option>
													<option >Georgia</option>
													<option >Hawaii</option>
													<option >Idaho</option>
													<option >Illinois</option>
													<option >Indiana</option>
													<option >Iowa</option>
													<option> Kansas</option>
													<option >Kentucky</option>
													<option >Louisiana</option>
													<option>Maine</option>
													<option >Maryland</option>
													<option> Mass</option>
													<option >Michigan</option>
													<option >Minnesota</option>
													<option>Mississippi</option>
													<option>Missouri</option>
													<option>Montana</option>
													<option>Nebraska</option>
													<option>Nevada</option>
													<option>New Hampshire</option>
													<option>New Jersey</option>
													<option>New Mexico</option>
													<option>New York</option>
													<option>North Carolina</option>
													<option>North Dakota</option>
													<option>Ohio</option>
													<option>Oklahoma</option>
													<option>Oregon</option>
													<option>Pennsylvania</option>
													<option>Rhode Island</option>
													<option>South Carolina</option>
													<option>South Dakota</option>
													<option>Tennessee</option>
													<option>Texas</option>
													<option> Uttah</option>
													<option>Vermont</option>
													<option>Virginia</option>
													<option >Washington</option>
													<option >West Virginia</option>
													<option>Wisconsin</option>
													<option >Wyoming</option>
												</select>
											</div>
										</div>
								</div>
	  
								<!-- Text input for required City-->
								<div class="form-group">
									<label class="col-md-4 control-label">City*</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
											<input name="city" placeholder="city" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input for optional Zip Code-->
								<div class="form-group">
									<label class="col-md-4 control-label">Zip Code</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
											<input name="zip" placeholder="Zip Code" class="form-control" type="text">
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-4 control-label"></label>
									<div class="col-md-4 inputGroupContainer">
										<p>* = Required</p>
									</div>
								</div>
								
								<!-- Button -->
								<div class="form-group">
									<label class="col-md-4 control-label"></label>
									<div class="col-md-4">
										<button type="submit" class="btn btn-warning">Register <span class="glyphicon glyphicon-send"></span></button>
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