<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*, com.model.covid"%>
<jsp:useBean id = "covid" class = "com.process.covidregistration" scope ="request"/>
<jsp:setProperty name="covid" property="*"/>
<%
List<covid> lstCovid= new ArrayList<covid>();

String message= "";

String action=(String)request.getParameter("action");
if(action==null)action= "";
System.out.println("Action  >> "+ action);

if(!action.equals(""))
{
	if(action.equals("SAVE"))
	{
		message= covid.insertRegistationDetails();
	}
	else if(action.equals("UPDATE")){
		message=covid.updateRegistationDetails();
	}
	else if(action.equals("DELETE"))
	{
		String registrationId=(String)request.getParameter("registrationId");
		System.out.println("Registration Id  >> "+ registrationId);
		message= covid.deleteRegistrationDetails(registrationId);
	}
}

lstCovid = covid.getRegistationDetails();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vaccination Records</title>
<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../css/font.css" type="text/css">
<link rel="stylesheet" href="../css/fontawesome/all.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-datepicker.css"  type="text/css">
<style>

</style>
<script type='text/javascript' src="../js/jquery-v3.6.0.js"></script>
<script type="text/javascript" src="../js/bootstrap-tooltip.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>  
<script type="text/javascript" src="../js/bootstrap-datepicker.js"></script>
</head>
<body class="body-white">
	<form name="frmRegistration" id="frmRegistration" method="post">
	<!-- ****************************************************MODAL*************************************************************** -->
		<div class="modal fade" id="myModal">
			<div class="container vaccForm">
				<!-- <div class="modal-dialog"> -->
					<div class="modal-content">
						<div class="modal-header">
							<div class="text-right">
		        				<input type="button" class="close btn btn-sm" data-toggle="tooltip" data-placement="bottom" title="Close" data-dismiss="modal" value="X">
		        			</div>
							<h3>COVID-19 Vaccine Registration Form</h3> 
						</div>
						<div class="modal-body">
							<div class='row'>
								<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
									<label class="text-primary">First Name&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="firstName" id="firstName" placeholder="Enter your First Name" class="form-control"/><br>
								</div>
								<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
									<label class="text-primary" >Last Name&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="lastName" id="lastName" placeholder="Enter your Last Name" class="form-control"/><br>
								</div>
								<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="text-primary" >Aadhar Number&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="aadhar" id="aadhar" placeholder="0000-0000-0000" class="form-control" maxlength="14"/><br>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="text-primary" >Birth Date&nbsp;<font class="text-danger">*</font></label><br>
									<div class="input-group">
										<input type="text" name="birthDate" id="birthDate" placeholder="MM/DD/YYYY" class="form-control" readonly/>
										<span class="input-group-addon" id="calendar">
			            					<i class="far fa-calendar-alt"></i>
	        							</span>
									</div>
								</div>
								<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="text-primary" >Gender&nbsp;<font class="text-danger">*</font></label><br>
									<div class="row">
										<div class="col col-lg-2 col-md-3 col-sm-12 col-xs-12">
											<input type="radio" name="gender" id="genderMale" value="1" class="gender"/>&nbsp; <font class="">Male</font>
										</div>
										<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
											<input type="radio" name="gender" id="genderFemale" value="2" class="gender"/>&nbsp; <font class="">Female</font>
										</div>
									</div>
								</div>
							</div>	
							
							<div class="row">
								<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="text-primary" >Email&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="email" id="email" placeholder="example@example.com" class="form-control"/><br>
								</div>
								<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="text-primary" >Phone Number&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="phoneNumber" id="phoneNumber" placeholder="Please enter a valid phone number"  maxlength="10" class="form-control"/>
								</div>
							</div>
							
							<div class="row">
								<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<label class="text-primary" >Address&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="address1" id="address1" placeholder="Street Address" class="form-control"/><br>
									<input type="text" name="address2" id="address2" placeholder="Street Address Line 2" class="form-control"/><br>
								</div>
							</div>
							<div class="row">
								<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<input type="text" name="city" id="city" placeholder="City" class="form-control"/><br>
									</div>
									<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<input type="text" name="state" id="state" placeholder="State / Province" class="form-control"/><br>
								</div>
							</div>
							<div class="row">
								<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<input type="text" name="zipcode" id="zipcode" placeholder="Postal / Zip Code" maxlength="10" class="form-control"/><br>
								</div>
							</div>
							
							<div class="row">
								<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="text-primary" >Insurance Company&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="insuranceCompany" id="insuranceCompany" placeholder="Enter the name of the Insurance Company" class="form-control"/>
								</div>
								<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="text-primary" >Insurance ID&nbsp;<font class="text-danger">*</font></label><br>
									<input type="text" name="insuranceId" id="insuranceId" placeholder="Enter a valid Insurance ID" class="form-control"/>
								</div>
							</div>		
						</div>
						<div class="modal-footer">
							<div class="row text-right">
								<div class="col col-lg-12 col-sm-12 col-md-12 col-xs-12">
									<input type="button" name="btnSave" id="btnSave" value="Save" class="btn btn-primary btn-lg" data-toggle="tooltip" title="Click to Save">&nbsp;
									<input type="button" name="btnClear" id="btnClear" value="Clear" class="btn btn-warning btn-lg" data-toggle="tooltip" title="Click to clear">&nbsp;
									<input type="button" name="btnCancel" id="btnCancel" value="Cancel" class="btn btn-secondary btn-lg" data-dismiss="modal" data-toggle="tooltip" title="Click to Cancel">
								</div>
							</div>
						</div>
					</div>
				<!-- </div> -->
			</div>
		</div>
<!-- **************************************************************************************************************************** -->
		<!-- <div class="container"> -->
			<%
			if(!message.equals("")&&!lstCovid.isEmpty())
			{
			%>
			<table class="table bg-warning">
				<thead>
					<tr>
						<th class="text-center"><%=message%></th>
					</tr>
				</thead>
			</table>
			<%
			}
			%>
			
			<div class="text-right">
				<br><input type="button" name="register" id="register" value="Register Now" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal">
			</div>
			<br>
			<%
			if(lstCovid.isEmpty())
			{
			%>
			<table class="table bg-warning">
				<thead>
					<tr>
						<th class="text-center">No Registration Details to display</th>
					</tr>
				</thead>
			</table>
			<%
			}
			else
			{
			%>
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th class="text-center"><label>First Name</label></th>
						<th class="text-center"><label>Last Name</label></th>
						<th class="text-center"><label>Aadhar Number</label></th>
						<th class="text-center"><label>Date Of Birth</label></th>
						<th class="text-center"><label>Gender</label></th>
						<th class="text-center"><label>Phone Number</label></th>
						<th class="text-center"><label>Insurance ID</label></th>
						<th class="text-center"><label>Action</label></th>
					</tr>
				</thead>
				<tbody>
					<%
					Iterator<covid> itrCovid = lstCovid.iterator();
					
					while(itrCovid.hasNext())
					{
						covid objItr= itrCovid.next();
					%>
					<tr>
						<td><%=objItr.getFirstName() %></td>
						<td><%=objItr.getLastName() %></td>
						<td><%=objItr.getAadhar() %></td>
						<td><%=covid.dateConversion(objItr.getBirthDate()) %></td>
						<td><%=objItr.getGenderVal()%></td>
						<td><%=objItr.getPhoneNumber()%></td>
						<td><%=objItr.getInsuranceId() %></td>
						<td class="text-center">
							<a href="#" onclick="javascript: funEdit('<%=objItr.getRegistrationId()%>');" data-placement="top" data-toggle="tooltip" title="Click to Edit" ><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
							<a href="#" onclick="javascript: funDelete('<%=objItr.getRegistrationId()%>');" data-placement="top" data-toggle="tooltip" title="Click to Delete"><i class="fas fa-trash-alt text-danger"></i></a>
						</td>
					</tr>
				<%
					}
			}
				%>
				</tbody>
			</table>
			<input type="hidden" name="action" id="action" value="" />
			<input type="hidden" name="registrationId" id="registrationId" value="0"/>
		<!-- </div> -->
	</form>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function ()
		{
			$('[data-toggle="tooltip"]').tooltip({container: 'body'});
			
			$('#birthDate').datepicker({
                format: "mm/dd/yyyy",
                autoclose: true,
            });
			
			$("#calendar").click(function(e)
			{
				$("#birthDate").focus();
			});
			
			$("#btnSave").click(function(e)
			{
				funSave();
			});
			
			$("#btnClear").click(function(e)
			{
				funClear();
			});
			
			$("#register").click(function(e)
			{
				funClear();
				$("#btnSave").val("Save");
				$("#btnSave").attr('data-original-title','Click to Save');
			});
		});
		
		function funSave()
		{
			var firstName= $.trim($("#firstName").val());
			$("#firstName").val(firstName);
			
			var lastName= $.trim($("#lastName").val());
			$("#lastName").val(lastName);
			
			var aadhar= $.trim($("#aadhar").val());
			$("#aadhar").val(aadhar);
			var patternAadhar= /^[2-9]{1}[0-9]{3}\-[0-9]{4}\-[0-9]{4}$/;
			
			
			var birthDate= $.trim($("#birthDate").val());
			$("#birthDate").val(birthDate);
			
			var gender= $("input[name='gender']").is(":checked");
			
			var email= $.trim($("#email").val());
			var pattern= /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
			$("#email").val(email)
;
			
			var phoneNumber= $.trim($("#phoneNumber").val());
			var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
			$("#phoneNumber").val(phoneNumber);
			
			var address1= $.trim($("#address1").val());
			$("#address1").val(address1);
			
			var address2= $.trim($("#address2").val());
			$("#address2").val(address2);
			
			var city= $.trim($("#city").val());
			$("#city").val(city);
			
			var state= $.trim($("#state").val());
			$("#state").val(state);
			
			var zipcode= $.trim($("#zipcode").val());
			$("#zipcode").val(zipcode);
			
			var insuranceCompany= $.trim($("#insuranceCompany").val());
			$("#insuranceCompany").val(insuranceCompany);
			
			var insuranceId= $.trim($("#insuranceId").val());
			$("#insuranceId").val(insuranceId);
			
			var btntoggle=$("#btnSave").val();
			
			if(firstName==""){
				alert("Please enter First Name");
				$("#firstName").focus();
			}
			else if(lastName==""){
				alert("Please enter Last Name");
				$("#lastName").focus();
			}
			else if(aadhar==""){
				alert("Please enter a valid Aadhar Number");
				$("#aadhar").focus();
			}
			else if(!aadhar.match(patternAadhar) || !(aadhar.length==14)){
				alert("Invalid Format or Length for Aadhar(Eg: 1234-1234-1234)");
				$("#aadhar").val("");
				$("#aadhar").focus();
			}
			else if(birthDate==""){
				alert("Please enter your Date Of Birth");
				$("#birthDate").focus();
			}
			else if(gender==false){
				alert("Please select gender");
			}
			else if(email==""){
				alert("Please enter a valid Email ID");
				$("#email").focus();
			}
			else if(!email.match(pattern)){
				alert("Invalid E-Mail pattern");
				$("#email").val("");
				$("#email").focus();
			}
			else if(phoneNumber==""){
				alert("Please enter your Phone Number");
				$("#phoneNumber").focus();
			}
			else if(!phoneNumber.match(filter) || !(phoneNumber.length==10)){
				alert("Invalid Numerical Format or Length for phone number");
				$("#phoneNumber").val("");
				$("#phoneNumber").focus();
			}
			else if(address1==""){
				alert("Please provide Street Address");
				$("#address1").focus();
			}
			else if(address2==""){
				alert("Please provide Street Address Line 2");
				$("#address2").focus();
			}
			else if(city==""){
				alert("Please enter your City");
				$("#city").focus();
			}
			else if(state==""){
				alert("Please enter your State");
				$("#state").focus();
			}
			else if(zipcode==""){
				alert("Please enter Zipcode");
				$("#zipcode").focus();
			}
			else if(!zipcode.match(filter)){
				alert("Invalid Numerical Format or Length for zipcode");
				$("#zipcode").val("");
				$("#zipcode").focus();
			}
			else if(insuranceCompany==""){
				alert("Please provide name of Insurance Company");
				$("#insuranceCompany").focus();
			}
			else if(insuranceId==""){
				alert("Please enter a vaild Insurance ID");
				$("#insuranceId").focus();
			}
			else if(btntoggle=="Save"){
				$("#action").val("SAVE");
				var action="SAVE";
				$.ajax({
					type: 	"post",
					async : false,
					url: 	"vaccinationregistrationformmgst.jsp",
					data: 	"action="+action+"&aadhar="+aadhar,
					beforeSend: function() {									
					},
					complete: function() {																			
					},
					success:	function(msg)
					{		
						var saveExist=$.trim(msg);
						if(saveExist=="false"){
						$("#frmRegistration").attr("action","vaccinationregistrationform.jsp");
						$("#frmRegistration").submit();	
						}
						else{
							alert("Aadhar Number already exists. Please enter new Aadhar Number");
							$("#aadhar").focus();
						}
					}
					});
				
				}
			else{
				$("#action").val("UPDATE");
				var action="UPDATE";
				var registrationId= $.trim($("#registrationId").val());
				$.ajax({
					type: 	"post",
					async : false,
					url: 	"vaccinationregistrationformmgst.jsp",
					data: 	"action="+action+"&aadhar="+aadhar+"&regitrationIds="+registrationId,
					beforeSend: function() {									
					},
					complete: function() {																			
					},
					success:	function(msg)
					{		
						var saveExist=$.trim(msg);
						if(saveExist=="false"){
						$("#frmRegistration").attr("action","vaccinationregistrationform.jsp");
						$("#frmRegistration").submit();	
						}
						else{
							alert("Aadhar Number already exists. Please enter new Aadhar Number");
							$("#aadhar").focus();
						}
					}
					});
			}
		}
		function funClear(){
			$("#firstName").val("");
			$("#lastName").val("");
			$("#aadhar").val("");
			$("#birthDate").val("");
			$(".gender").prop('checked', false);		 //using class
			//$("#genderFemale").prop('checked', false); //using ID
			$("#email").val("");
			$("#phoneNumber").val("");
			$("#address1").val("");
			$("#address2").val("");
			$("#city").val("");
			$("#state").val("");
			$("#zipcode").val("");
			$("#insuranceCompany").val("");
			$("#insuranceId").val("");
		}
		
		function funEdit(registrationId){
			$("#myModal").modal('show');
			$("#btnSave").val("Update");
			var action="EDIT";
			$("#btnSave").attr('data-original-title','Click to Update');
			$("#registrationId").val(registrationId);
			$.ajax({
				type : "post",
				async : false,
				url : "vaccinationregistrationformmgst.jsp",
				data : "regitrationIds="+registrationId+"&action="+action,
				beforeSend : function() {									
				},
				complete : function() {																			
				},
				success : function(info){	
					var projectDataRes= $.trim(info)
;
					var project= projectDataRes.split("<~>");
					//alert(projectDataRes);
					var firstName = $.trim(project[0]);
					var lastName = $.trim(project[1]);
					var aadhar = $.trim(project[2]);
					var birthDate = $.trim(project[3]);
					var gender = $.trim(project[4]);
					var email = $.trim(project[5]);
					var phoneNumber = $.trim(project[6]);
					var address1 = $.trim(project[7]);
					var address2 = $.trim(project[8]);
					var city = $.trim(project[9]);
					var state = $.trim(project[10]);
					var zipcode = $.trim(project[11]);
					var insuranceCompany = $.trim(project[12]);
					var insuranceId = $.trim(project[13]);
					
					
					$("#firstName").val(firstName);
					$("#lastName").val(lastName);
					$("#aadhar").val(aadhar);
					$("#birthDate").val(birthDate);
					if(gender==1){
						$("#genderMale").prop('checked', true);
					}
					else{
						$("#genderFemale").prop('checked', true);
					}
					$("#email").val(email)
;
					$("#phoneNumber").val(phoneNumber);
					$("#address1").val(address1);
					$("#address2").val(address2);
					$("#city").val(city);
					$("#state").val(state);
					$("#zipcode").val(zipcode);
					$("#insuranceCompany").val(insuranceCompany);
					$("#insuranceId").val(insuranceId);
					//alert(gender);
				}
			});
		}
		function funDelete(registrationId){
			if (confirm("Are you sure to delete ?")) {
				$("#registrationId").val(registrationId);
				$("#action").val("DELETE");
				$("#frmRegistration").attr("action","vaccinationregistrationform.jsp");
				$("#frmRegistration").submit();
				  }
				  else {
					  $("#frmRegistration").attr("action","vaccinationregistrationform.jsp");
					  $("#frmRegistration").submit();
					  }
		}
	</script>
</body>
</html>