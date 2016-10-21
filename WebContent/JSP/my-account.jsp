<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Gear4Camp user account details.">
	<meta name="keywords" content="Gear4Camp, Outdoor, Gear, Equipment">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="index.css" rel="stylesheet" type="text/css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<title>Gear4Camp - My Account</title>
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

        <div class="row well">

            <div class="col-md-5">
				<h1 class="text-center" id="ad_title">Account Details</h1>
				
                <div class="row">

                    <div class="container">

						<form class="form-horizontal" action="../servlet1" method="post" id="contact_form">
						<input type="hidden" name="param" value="Save">
							<fieldset>
								
								<!-- Text input for required first name-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">First Name*</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
												<input name="first_name" value="User's current First Name (pulled from DB)" class="form-control" type="text">
											</div>
										</div>
									</div>
								</div>

								<!-- Text input for required last name-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">Last Name*</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
												<input name="last_name" value="User's current Last Name" class="form-control" type="text">
											</div>
										</div>
									</div>
								</div>

								<!-- Text input for required email-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">E-mail*</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
												<input name="email" value="User's current Email Address" class="form-control" type="text">
											</div>
										</div>
									</div>
								</div>
								
								<!-- Input for password-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">Password*</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
												<input type="password" class="form-control" name="password" id="password" placeholder="Change password">
											</div>
										</div>
									</div>
								</div>
								
								<!-- Input for password-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">Confirm Password*</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
												<input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="Confirm new password">
											</div>
										</div>
									</div>
								</div>

								<!-- Text input for optional phone number-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">Phone #</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
												<input name="phone_number" value="User's current phone number" class="form-control" type="text">
											</div>
										</div>
									</div>
								</div>

								<!-- Select Basic for required State-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">State*</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
												<select name="state" class="form-control selectpicker">
													<option value=" " >User's Current State</option>
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
								</div>
	  
								<!-- Text input for required City-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">City*</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
												<input name="city" value="User's current City" class="form-control" type="text">
											</div>
										</div>
									</div>
								</div>

								<!-- Text input for optional Zip Code-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">Zip Code</label>
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
												<input name="zip" value="User's current Zip Code" class="form-control" type="text">
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-5">
										<label class="control-label"></label>
										<p>* = Required</p>
									</div>
								</div>
								
								<!-- Button -->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label class="col-md-5 control-label"></label>
											<div class="input-group">
												<button type="submit" class="btn btn-warning">Save <span class="glyphicon glyphicon-send"></span></button>
											</div>
										</div>
									</div>
								</div>

							</fieldset>
						</form>
					</div>
					
                </div>
            </div>
			
			<div class="col-md-2"></div>
			
			<div class="col-md-5">
				<h1 class="text-center" id="ad_title">Ad Postings</h1>
				
					<div class="col-sm-12 col-lg-12 col-md-12">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$24.99/day</h4>
                                <h4><a href="ad-edit.html">Equipment 1</a>
                                </h4>
                                <p>Example Short Equipment Description. Real equipment info will be added and displayed dynamically.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 Reviews</p>
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
					
					<div class="col-sm-12 col-lg-12 col-md-12">
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
					
					<div class="col-sm-12 col-lg-12 col-md-12">
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
					
					<div class="col-sm-12 col-lg-12 col-md-12">
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
					
					<div class="col-sm-12 col-lg-12 col-md-12">
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