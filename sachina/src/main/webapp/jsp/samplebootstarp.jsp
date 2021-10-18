<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Covid Vaccine Registration form</title>
<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../css/font.css" type="text/css">

<script type='text/javascript' src="../js/jquery-1.9.1.js"></script>
<style>
.container{
margin-top:50px;
margin-bottom:50px;
border: 4px solid #1F618D;
border-radius:10px;
}
</style>
<script type='text/javascript' src="../js/jquery-1.9.1.js"></script>
</head>
<body class="body-white">
		<form>
			 <div class="container">
			 <div class="modal-header">
				 <div class="text-center page-header text-primary col col-lg-12 col-md-12 col-sm-12 col-xs-12">
				 	<h1>COVID-19 Vaccine Registration Form</h1>
				 </div>
				 </div>
				 <div class="modal-body">
				 <div  class="row">
			 		<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
			 			<label class="text-primary">First Name</label>
			 			<br>
						<input type="text" name="firstName" id="firstName" placeholder="First name" class="form-control"/>
						<br>
					</div>
					<div class=" col col-lg-3 col-md-3 col-sm-12 col-xs-12"> 
						<label class="text-primary">Last Name</label>
			 			<br>
						<input type="text" name="lastName" id="lastName" placeholder="Last name" class="form-control"/>
						<br>
					</div>
					<div class=" col col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<label class="text-primary">Aadhar Number</label>
			 			<br>
						<input type="text" name="aadhar" id="aadhar" placeholder="Enter your aadhar number" class="form-control"/>
						<br>
			 	   </div>
				</div>
				<div  class="row">
					<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<label class="text-primary">Birth Date</label>
							<div class="input-group">
								<input type="date" name="date" id="date" placeholder="MM-DD-YYYY" class="form-control"/>
							<span class="input-group-btn">
										<button class="btn btn-default">
		            						<i class="far fa-calendar"></i>
		        						</button>
	        						</span>
					</div>
					</div>
					<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<label class="text-primary">Gender</label>
							<br>
							<div class="row">
								<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12"> 
									<input type="radio" name="gender" id="gender" class=""/>&nbsp;
									<font class="text-primary">Male</font>
								</div>
								<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
									<input type="radio" name="gender" id="gender" class=""/>&nbsp;
									<font class="text-primary">Female</font>
								</div>
					 	    </div>
					</div>
				</div>
				<div  class="row">
				 		<div class=" col col-lg-6 col-md-6 col-sm-12 col-xs-12">
				 			<label class="text-primary">Email</label>
				 			<br>
							<input type="text" name="email" id="email" placeholder="Enter your email address" class="form-control"/>
							<br>
						</div>
						<div class=" col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<label class="text-primary">Phone Number</label>
				 			<br>
							<input type="text" name="phoneNumber" id="phoneNumber" placeholder="Enter your phone number" class="form-control"/>
							<br>
				 	   </div>
				</div>
				<div  class="row">
				 		<div class=" col col-lg-12 col-md-12 col-sm-12 col-xs-12">
				 			<label class="text-primary">Address</label>
				 			<br>
							<input type="text" name="address1" id="address1" placeholder="Enter your Street Address" class="form-control"/>
							<br>
						</div>
				</div>
				<div  class="row">
				 		<div class=" col col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<input type="text" name="address2" id="address2" placeholder="Street Address Line 2" class="form-control"/>
							<br>
						</div>
				</div>
				<div  class="row">
				 		<div class=" col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<input type="text" name="city" id="city" placeholder="City" class="form-control"/>
							<br>
						</div>
						<div class=" col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<input type="text" name="state" id="state" placeholder="State / Province" class="form-control"/>
							<br>
				 	   </div>
				</div>
				<div  class="row">
				 		<div class=" col col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<input type="text" name="zip" id="zip" placeholder="Postal / Zip Code" class="form-control"/>
							<br>
						</div>
				</div>
				<div  class="row">
				 		<div class=" col col-lg-6 col-md-6 col-sm-12 col-xs-12">
				 			<label class="text-primary">Insurance Company</label>
				 			<br>
							<input type="text" name="insuranceCompany" id="insuranceCompany" placeholder="Insurance company name" class="form-control"/>
							<br>
						</div>
						<div class=" col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<label class="text-primary">Insurance ID</label>
				 			<br>
							<input type="text" name="insuranceId" id="insuranceId" placeholder="Insurance ID number" class="form-control"/>
							<br>
				 	   </div>
				</div>
				</div>
				<div  class="modal-footer ">
						<div class=" col col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
							<input type="button" name="save" id="save" value="Save" class="btn btn-primary">
							<input type="button" name="clear" id="clear" value="Clear" class="btn btn-warning">
							<input type="button" name="cancel" id="cancel" value="Cancel" class="btn btn-secondary">
							<br>
				 	   </div>
				</div>
				<div  class="row">
						<div class=" col col-lg-12 col-md-12 col-sm-12 col-xs-12">
						&nbsp;&nbsp;
				 	   </div>
				</div>
			</div>
	</form>
<script src="../js/bootstrap.min.js"></script>
<script type='text/javascript'>

</script>
</body>
</html>