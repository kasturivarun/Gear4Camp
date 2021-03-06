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
    <meta name="description" content="Gear4Camp user account details.">
	<meta name="keywords" content="Gear4Camp, Outdoor, Gear, Equipment">
    <link href="index.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Gear4Camp - My Account</title>
</head>
 <script type="text/javascript">
function enableSave(){
document.getElementById("btnEdit").style.display = "none";
document.getElementById("btnSave").style.display = "block";
document.getElementById("btnCancel").style.display = "block";

document.getElementById("first_name").disabled = '';
document.getElementById("last_name").disabled = '';
document.getElementById("password").disabled = '';
document.getElementById("confirm_password").disabled = '';
document.getElementById("phone_number").disabled = '';
document.getElementById("state").disabled = '';
document.getElementById("city").disabled = '';
document.getElementById("zip").disabled = '';
}
</script>

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
                        <a href="create-ad.jsp">Create Ad</a>
						<!--First have to check if user has an account and is logged in-->
						<!--If not, send to login page first-->
                    </li>
                </ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row well">
        <ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="#home">My Profile</a></li>
		    <li><a data-toggle="tab" href="#menu1">My Ads</a></li>
		    <li><a data-toggle="tab" href="#menu2">My Rentals</a></li>
		    <li><a data-toggle="tab" href="#menu3">Rental Requests</a></li>
		  </ul>
		  
		  <div class="tab-content">
		    <div id="home" class="tab-pane fade in active">
		      <h3>My Profile</h3>
		      <div class="col-md-5">
		            <%HttpSession hs=request.getSession(true);%>
						<h1 class="text-center" id="ad_title">Account Details for <%=hs.getAttribute("uname") %></h1>
						
						
						<%String id = (String)hs.getAttribute("uname");
						Connection connection = DBConnection.getConnection();
						Statement statement = null;
						ResultSet resultSet = null;
						try{ 
						statement=connection.createStatement();
						String sql ="SELECT * FROM users where email='"+id+"'";
						
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
		                <div class="row">
		
		                    <div class="container">
								
								<form class="form-horizontal" action="../servlet1" method="post" id="contact_form">
								
								<input type="hidden" name="param" value=userUpdate>
									<fieldset>
										
										<!-- Text input for required first name-->
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label class="control-label">First Name*</label>
													<div class="input-group">
														<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
														<input id="first_name" name="first_name" disabled="disabled" value=<%=resultSet.getString("fname")%> class="form-control" type="text">
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
														<input id="last_name" name="last_name" disabled="disabled" value=<%=resultSet.getString("lname")%> class="form-control" type="text">
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
														<input id="email" name="email" readonly value=<%=resultSet.getString("email")%> class="form-control" type="text">
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
														<input type="password" disabled="disabled" class="form-control" name="password" value=<%=resultSet.getString("password")%> id="password">
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
														<input type="password" disabled="disabled" class="form-control" name="confirm_password" value=<%=resultSet.getString("password")%> id="confirm_password" placeholder="Confirm new password">
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
														<input id="phone_number" name="phone_number" disabled="disabled" value=<%=resultSet.getString("phone_number")%> class="form-control" type="text">
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
														<select id="state" name="state" disabled="disabled" class="form-control selectpicker">
															<option selected="selected"><%=resultSet.getString("state")%></option>
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
														<input id="city" name="city" disabled="disabled" value=<%=resultSet.getString("city")%> class="form-control" type="text">
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
														<input id="zip" name="zip" disabled="disabled" value=<%=resultSet.getString("zipcode")%> class="form-control" type="text">
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
													<div class="btn-group">
														<button id="btnEdit"  onclick="enableSave(); return false;" class="btn btn-warning ">Edit <span class="glyphicon glyphicon-send"></span></button>											
													</div>
													<div class="btn-group">
														<button  id="btnSave" type="submit" style="display: none;" class="btn btn-warning ">Save <span class="glyphicon glyphicon-send"></span></button>												
													</div>
													<div class="btn-group">
													<button  id="btnCancel"  style="display: none;" onclick="window.location.reload();" class="btn btn-warning ">Cancel <span class="glyphicon glyphicon-send"></span></button>
													</div>
												</div>
											
											</div>
										</div>
		
									</fieldset>
								</form>
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
		    <div id="menu1" class="tab-pane fade">
		      <h3>My Ads</h3>
		      <div class="col-md-5">
				
				
				<%
				try{ 
				String sql2 ="SELECT * FROM ads where user_email='"+id+"' ORDER BY ad_id DESC";
				Statement statement2 = connection.createStatement();;
				ResultSet resultSet10 = statement2.executeQuery(sql2);
				while(resultSet10.next()){
				%>
					<div class="col-sm-12 col-lg-12 col-md-12">
		                      <div class="thumbnail">
		                          <img src=<%=resultSet10.getString("image_link") %> alt="">
		                          <div class="caption">
		                              <h4 class="pull-right">$<%=resultSet10.getString("rent_cost") %>/day</h4>
		                              <h4><a href="ad-edit.jsp?adId=<%=resultSet10.getInt("ad_id") %>"><%=resultSet10.getString("title") %></a>
		                              </h4>
		                              <p><%=resultSet10.getString("description") %></p>
		                          </div>
		                          <div class="ratings">
		                              <p class="pull-right"><a href="#"><%=resultSet10.getString("user_email") %></a></p>
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
		    <div id="menu2" class="tab-pane fade">
		      <h3>My Rentals</h3>
		     <div class="col-md-5">
				
				
				<%
				try{ 
				String sql3 ="SELECT ad_id,is_approved FROM rentals where renter_email='"+id+"' ORDER BY rent_id DESC";
				Statement statement3 = connection.createStatement();
				ResultSet resultSet3 = statement3.executeQuery(sql3);
				while(resultSet3.next()){
					Statement statement4 = connection.createStatement();
					int rentalStatus = resultSet3.getInt("is_approved");
					String status = "";
					if(rentalStatus == 0){
						status = "Pending with owner";
					}
					else if(rentalStatus == 1){
						status = "Approved by owner";
					}
					else{
						status = "Rejected by owner";
					}
					ResultSet resultSet2 = statement4.executeQuery("SELECT * FROM ads where ad_id='"+resultSet3.getInt("ad_id")+"'");
					while(resultSet2.next()){
				%>
					
					<div class="col-sm-12 col-lg-12 col-md-12">
		                      <div class="thumbnail">
		                          <img src=<%=resultSet2.getString("image_link") %> alt="">
		                          <div class="caption">
		                              <h4 class="pull-right">$<%=resultSet2.getString("rent_cost") %>/day</h4>
		                              <h4><%=resultSet2.getString("title") %>
		                              </h4>
		                              <p class="pull-right"><a href="#"><%=resultSet2.getString("user_email")%></a></p>
		                              <p>
		                              Renter Email:
		                              </p>
		                              <p class="pull-right"><a href="#"><%=resultSet2.getString("user_number")%></a></p>
		                              <p>
		                              Renter Phone Number:
		                              </p>
		                          </div>
		                          <div class="ratings">
		                              <p class="pull-right"><a href="#"><%=status%></a></p>
		                              <p>
		                              Status:
		                              </p>
		                          </div>
		                      </div>
		                  </div>
		                  
		                <%
				}
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
		              %>  
					
				
			</div>
		     </div>
		   
		   
		   
		   <div id="menu3" class="tab-pane fade">
		      <h3>Rental Requests</h3>
		     <div class="col-md-5">
				
				
				<%
				try{ 
				String sql3 ="SELECT ad_id,renter_email,rent_id,is_approved FROM rentals where ad_user_email='"+id+"' ORDER BY rent_id DESC";
				Statement statement5 = connection.createStatement();;
				ResultSet resultSet4 = statement5.executeQuery(sql3);
				while(resultSet4.next()){
					Statement statement6 = connection.createStatement();
					String renterEmail = resultSet4.getString("renter_email");
					int rentId = resultSet4.getInt("rent_id");
					int isApproved = resultSet4.getInt("is_approved");
					Statement statement10 = connection.createStatement();
					String renterPhn = "";
					ResultSet phnNo = statement10.executeQuery("SELECT phone_number FROM users where email ='"+renterEmail+"'");
					while(phnNo.next()){
						renterPhn = phnNo.getString("phone_number");
					}
					ResultSet resultSet2 = statement6.executeQuery("SELECT * FROM ads where ad_id='"+resultSet4.getInt("ad_id")+"'");
					while(resultSet2.next()){
				%>
					
					<div class="col-sm-12 col-lg-12 col-md-12">
		                      <div class="thumbnail">
		                          <img src=<%=resultSet2.getString("image_link") %> alt="">
		                          <div class="caption">
		                              <h4 class="pull-right">$<%=resultSet2.getString("rent_cost") %>/day</h4>
		                              <h4><a href="ad-edit.jsp?adId=<%=resultSet2.getInt("ad_id") %>"><%=resultSet2.getString("title") %></a>
		                              </h4>
		                              <p class="pull-right"><a href="#"><%=renterEmail%></a></p>
		                              <p>
		                              Renter Email:
		                              </p>
		                              <p class="pull-right"><a href="#"><%=renterPhn%></a></p>
		                              <p>
		                              Renter Phone Number:
		                              </p>
		                              <div class="ratings">
		                              <%if(isApproved == 0){ %>
		                              <button type="button" class="btn btn-default"><a href="process-rent.jsp?adId=<%=resultSet2.getInt("ad_id")%>&rentId=<%=rentId%>">Process Request</a></button>
		                              <%}else{ %>
		                              <p>Request already processed</p>
		                              <%} %>
		                              </div>
		                          </div>
		                          
		                      </div>
		                  </div>
		                  
		                <%
				}
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
		              %>  
					
				
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
