<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*, com.model.employee"%>
<jsp:useBean id = "employee" class = "com.process.employeeForm" scope ="request"/>
<jsp:setProperty name="employee" property="*"/>
<%
List<employee> lstEmployee= new ArrayList<employee>();
String message= "";
String searchFirstName="";
String searchLastName="";
String maleChecked="";
String femaleChecked="";
String fromBirthDate="";
String toBirthDate="";

String action=(String)request.getParameter("action");
if(action==null)action= "";
System.out.println("Action  >> "+ action);

	if(!action.equals(""))
	{
		if(action.equals("SAVE"))
	{
		message= employee.insertEmployeeDetails(action);
	}
		else if(action.equals("DELETE"))
			{
			String employeeId=(String)request.getParameter("employeeId");
			System.out.println("employee Id  >> "+ employeeId);
			message=employee.deleteEmployeeDetails(Integer.parseInt(employeeId));
			}
		else if(action.equals("UPDATE"))
			{
			message=employee.updateEmployeeDetails();
			}
		else if(action.equals("SEARCH"))
		{
			searchFirstName = (String)request.getParameter("searchFirstName");
			searchLastName	=  (String)request.getParameter("searchLastName");
			String searchGender = (String)request.getParameter("searchGender");
			fromBirthDate = (String)request.getParameter("fromBirthDate");
			toBirthDate = (String)request.getParameter("toBirthDate");
			if(searchGender == null)searchGender ="";
			if(searchGender.equals("1"))
			{
				maleChecked = "checked";
				femaleChecked = "";
			}
			else if(searchGender.equals("2"))
			{
				femaleChecked = "checked";
				maleChecked = "";
			}
			
			lstEmployee.clear();
			lstEmployee=employee.searchEmployeeDetails();
		}
	}
		if(!action.equals("SEARCH"))
			{
			
			lstEmployee = employee.getEmployeeDetails();
			}




%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Form</title>
<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../css/font.css" type="text/css">
<link rel="stylesheet" href="../css/fontawesome/all.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-datepicker.css"  type="text/css">

<script type='text/javascript' src="../js/jquery-v3.6.0.js"></script>
<script type="text/javascript" src="../js/bootstrap-tooltip.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>  
<script type="text/javascript" src="../js/bootstrap-datepicker.js"></script>
</head>
<body class="body-white">
<form name="employeeRegistration" id="employeeRegistration" method="post" >
<!-- *****************************************************MODAL**************************************************************** -->
<div class="modal fade" id="employeeModal">
<div class="container">
<div class="modal-content">
<div class="modal-header">
<div class="text-right">
        <input type="button" class="close btn btn-sm" data-toggle="tooltip" data-placement="bottom" title="Click to Close" data-dismiss="modal" value="X">
        </div>
<h1 class="text-left">Employee Form</h1>
</div>
<div class="modal-body">
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>First Name&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<input type="text" name="firstName" id="firstName" placeholder="Enter your First Name" class="form-control" maxlength="50"/>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Last Name&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<input type="text" name="lastName" id="lastName" placeholder="Enter your Last Name" class="form-control" maxlength="50"/>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Date Of Birth&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<div class="input-group">
<input type="text" name="birthDate" id="birthDate" placeholder="Select your Date of bith" class="form-control" readonly/>
<span class="input-group-addon" id="calendar">
            <i class="far fa-calendar-alt"></i>
        </span>
</div>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Gender&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12 text-left">
<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
<input type="radio" name="gender" id="genderMale" value="1" class="gender"/>&nbsp; <font class="">Male</font>
</div>
<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
<input type="radio" name="gender" id="genderFemale" value="2" class="gender"/>&nbsp; <font class="">Female</font>
</div>
</div>
<span class="col col-lg-1 col-md-1 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Country&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<div class="form-group">
    <select class="form-control" id="country" name="country">
      <option value="">Select</option>
      <option value="INDIA">INDIA</option>
      <option value="USA">USA</option>
      <option value="AUSTRALIA">AUSTRALIA</option>
      <option value="SRILANKA">SRILANKA</option>
    </select>
  </div>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Email&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<input type="text" name="email" id="email" placeholder="Enter your Email" class="form-control" maxlength="50"/>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Phone Number&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<input type="text" name="phoneNumber" id="phoneNumber" placeholder="Enter your Phone Number" class="form-control" maxlength="10"/>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Password&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<input type="password" name="password" id="password" placeholder="Enter your Password" class="form-control" maxlength="20"/>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-3 col-md-3 col-sm-0 col-xs-0">
&nbsp;
</span>
<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
<label>Confirm Password&nbsp;&nbsp;<font class="text-danger">*</font></label>
</div>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm your Password" class="form-control" maxlength="20"/>
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
<div class='row form-group'>
<span class="col col-lg-5 col-md-5 col-sm-0 col-xs-0 text-left">
</span>
<div class="col col-lg-5 col-md-5 col-sm-12 col-xs-12 text-left">
<input type="checkbox" name="agreeTermsCondition" id="agreeTermsCondition" value="1"/> &nbsp; I agree to the terms and conditions
</div>
<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
&nbsp;
</span>
</div>
</div>
<div class="modal-footer">
<div class="row text-center">
<div class="col col-lg-12 col-sm-12 col-md-12 col-xs-12">
<input type="button" name="btnSave" id="btnSave" value="Save" class="btn btn-primary btn-lg" data-toggle="tooltip" title="Click to Save">&nbsp;
<input type="button" name="btnClear" id="btnClear" value="Clear" class="btn btn-warning btn-lg" data-toggle="tooltip" title="Click to clear">&nbsp;
<input type="button" name="btnCancel" id="btnCancel" value="Cancel" class="btn btn-secondary btn-lg" data-dismiss="modal" data-toggle="tooltip" title="Click to Cancel">
</div>
</div>
</div>
</div>
</div>
</div>
<!-- *****************************************************MODAL-LOG**************************************************************** -->
<div class="modal fade" id="logModal">
<div class="container">
<div class="modal-content">
<div class="modal-header">
<div class="text-right">
        <input type="button" class="close btn btn-sm" data-toggle="tooltip" data-placement="bottom" title="Click to Close" data-dismiss="modal" value="X">
        </div>
<h1 class="text-left"><span id="logEmployeeName"></span>&nbsp;Log Details</h1>
</div>

<div class="modal-body">
<div id="loadModalContent">
</div>
</div>

<div class="modal-footer">
<div class="row text-center">
<div class="col col-lg-12 col-sm-12 col-md-12 col-xs-12">
<input type="button" name="btnClose" id="btnClose" value="Close" class="btn btn-secondary btn-lg" data-dismiss="modal" data-toggle="tooltip" title="Click to Close">
</div>
</div>
</div>
</div>
</div>
</div>
<!--------------------------------------------Employee List------------------------------------------------------------------------------------->
<%
if(!message.equals("")&&!lstEmployee.isEmpty())
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
<div class="table bg-success">
<div class="row">&nbsp;</div>
<div class="h1 text-success">SACHINA</div>
<div class="row">&nbsp;</div>
</div>
<div class="text-right">
<input type="button" name="createEmployee" id="createEmployee" value="Create Employee" class="btn btn-danger btn-md" data-toggle="modal" data-target="#employeeModal">
</div>
		
<br>
<div class="panel panel-default">
			<div class="panel-heading">
				<div class='row form-group'>
					<div class="col col-lg-10 col-md-10 col-sm-10 col-xs-10 h3">Search By</div>
					<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 text-right">
						<span data-toggle="collapse" data-target="#collapsePanel">
                          <i class="fas fa-caret-square-down fa-2x h3" id="iconCollapse"></i>						
						</span>
					</div>
				</div>	
			</div>
			<div class="collapse" id="collapsePanel">
		 	 <div class="panel-body">
			  	<div class='row form-group'>
					<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
						<label>First Name</label>
					</div>
					<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12 text-left">
						<input type="text" name="searchFirstName" id="searchFirstName" placeholder="Enter the FirstName" class="form-control" maxlength="50"/>
					</div>
					<span class="col col-lg-4 col-md-4 col-sm-0 col-xs-0">
						&nbsp;
					</span>
				</div>
				<div class='row form-group'>
					<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
						&nbsp;
					</span>
					<div class="col col-lg-10 col-md-10 col-sm-12 col-xs-12 text-left text-danger">
						--------------------------OR--------------------------------
					</div>
				</div>
				<div class='row form-group'>
					<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
						<label>Last Name</label>
					</div>
					<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12 text-left">
						<input type="text" name="searchLastName" id="searchLastName" placeholder="Enter the LastName" class="form-control" maxlength="50"/>
					</div>
					<span class="col col-lg-4 col-md-4 col-sm-0 col-xs-0">
						&nbsp;
					</span>
				</div>
				<div class='row form-group'>
					<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
						&nbsp;
					</span>
					<div class="col col-lg-10 col-md-10 col-sm-12 col-xs-12 text-left text-danger">
						--------------------------OR--------------------------------
					</div>
				</div>
				<div class='row form-group'>
						<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
							<label>Gender</label>
						</div>
							<div class="col col-lg-1 col-md-2 col-sm-12 col-xs-12">
								<input type="radio" name="searchGender" id="searchGenderMale" value="1" class="searchGender"/>&nbsp; <font class="">Male</font>
							</div>
							<div class="col col-lg-1 col-md-2 col-sm-12 col-xs-12">
								<input type="radio" name="searchGender" id="searchGenderFemale" value="2" class="searchGender"/>&nbsp; <font class="">Female</font>
							</div>
						<span class="col col-lg-6 col-md-6 col-sm-0 col-xs-0">
						&nbsp;
						</span>
				</div>
				 <div class='row form-group'>
					<span class="col col-lg-2 col-md-2 col-sm-0 col-xs-0">
						&nbsp;
					</span>
					<div class="col col-lg-10 col-md-10 col-sm-12 col-xs-12 text-left text-danger">
						--------------------------OR--------------------------------
					</div>
				</div>
			  	<div class='row form-group'>
					<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
						<label>Date Of Birth</label>
					</div>
					<div class="col col-lg-1 col-md-2 col-sm-12 col-xs-12 text-left">
						<label>From</label>
					</div>
					<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
						<div class="input-group">
							<input type="text" name="fromBirthDate" id="fromBirthDate" placeholder="Select from Date of birth" class="form-control text-left" readonly/>
							<span class="input-group-addon" id="fromBirthDateCalendar">
	            					<i class="far fa-calendar-alt"></i>
      							</span>
						</div>
					</div>
					<div class="col col-lg-1 col-md-2 col-sm-12 col-xs-12 text-left">
						<label>To</label>
					</div>
					<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
						<div class="input-group">
							<input type="text" name="toBirthDate" id="toBirthDate" placeholder="Select to Date of birth" class="form-control text-left" readonly/>
							<span class="input-group-addon" id="toBirthDateCalendar">
	            					<i class="far fa-calendar-alt"></i>
    						</span>
						</div>
					</div>
				</div>
				<span class="col col-lg-4 col-md-4 col-sm-0 col-xs-0">
						&nbsp;
					</span>
		  	</div>
		  	<div class="panel-footer row form-group">
					<div class="col col-lg-2 col-md-2 col-sm-12 col-xs-12 text-left">
						
					</div>
					<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12 text-left">
						<input type="button" name="btnSearch" id="btnSearch" value="Search" class="btn btn-primary btn-lg" data-toggle="tooltip" title="Click to Search">
						<input type="button" name="btnSearchClear" id="btnSearchClear" value="Clear" class="btn btn-lg btn-warning" data-toggle="tooltip" title="Click to Clear">
					</div>
					
					<span class="col col-lg-4 col-md-4 col-sm-0 col-xs-0">
						&nbsp;
					</span>
				</div>
		  </div>
		</div>
<%
if(lstEmployee.isEmpty())
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
<th class="text-center"><label>Date Of Birth</label></th>
<th class="text-center"><label>Gender</label></th>
<th class="text-center"><label>Country</label></th>
<th class="text-center"><label>Email</label></th>
<th class="text-center"><label>Phone Number</label></th>
<th class="text-center"><label>Action</label></th>
</tr>
</thead>
<tbody>
<%
Iterator<employee> itrEmployee = lstEmployee.iterator();

while(itrEmployee.hasNext())
{
employee objItr= itrEmployee.next();
%>
<tr>
<td><%=objItr.getFirstName() %></td>
<td><%=objItr.getLastName() %></td>
<td><%=employee.dateConversion(objItr.getBirthDate())%></td>
<td><%=objItr.getGenderVal() %></td>
<td><%=objItr.getCountry() %></td>
<td><%=objItr.getEmail() %></td>
<td><%=objItr.getPhoneNumber()%></td>
<td class="text-center">
<a href="#" onclick="javascript: funEdit('<%=objItr.getEmployeeId() %>');" data-placement="top" data-toggle="tooltip" title="Click to Edit" ><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
<a href="#" onclick="javascript: funLog('<%=objItr.getEmployeeId() %>','<%=objItr.getFirstName()%>','<%=objItr.getLastName()%>');" data-placement="top" data-toggle="tooltip" title="Click to view Log" ><i class="far fa-list-alt text-success"></i></a>&nbsp;&nbsp;
<a href="#" onclick="javascript: funDelete('<%=objItr.getEmployeeId() %>');" data-placement="top" data-toggle="tooltip" title="Click to Delete"><i class="fas fa-trash-alt text-danger"></i></a>
</td>
</tr>
<%
}
}
%>
</tbody>
</table>
<input type="hidden" name="action" id="action" value="" />
<input type="hidden" name="employeeId" id="employeeId" value="" />
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
		$('#fromBirthDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
        });
		$('#toBirthDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
        });

		$("#btnSave").click(function(e)
		{
			funSave();
		});
		
		$("#createEmployee").click(function(e)
		{
			funClear();
			$("#btnSave").val("Save");
			$("#btnSave").attr('data-original-title','Click to Save');
		});
		
		$("#btnSearch").click(function(e)
				{
					funSearch();
				});
				
		
		$("#btnClear").click(function(e)
		{
			funClear();
		});

		$("#calendar").click(function(e)
		{
		$("#birthDate").focus();
		});
		
		$("#searchFirstName").keyup(function(e)
		{   
			var key = e.keyCode;
			if(key!=9&&key!=13){
			$("#searchLastName").val("");
			$("#fromBirthDate").val("");
			$("#toBirthDate").val("");
			$("input[name='searchGender']").prop('checked', false);
			}
		});
		
		$("#searchLastName").keyup(function(e)
		{
			var key = e.keyCode;
			if(key!=9&&key!=13){
			$("#searchFirstName").val("");
			$("#fromBirthDate").val("");
			$("#toBirthDate").val("");
			$("input[name='searchGender']").prop('checked', false);
			}
		});
		$(".searchGender").change(function(e)
		{
			$("#searchFirstName").val("");
			$("#searchLastName").val("");
			$("#fromBirthDate").val("");
			$("#toBirthDate").val("");
		});
		$("#fromBirthDate").click(function(e)
		{
			$("#searchFirstName").val("");
			$("#searchLastName").val("");
			$("input[name='searchGender']").prop('checked', false);
		});
		$("#toBirthDate").click(function(e)
		{
			$("#searchFirstName").val("");
			$("#searchLastName").val("");
			$("input[name='searchGender']").prop('checked', false);
		});
		
		$("#collapsePanel").on("show.bs.collapse",function(){
			$("#iconCollapse").addClass("fa-caret-square-up").removeClass("fa-caret-square-down");
		});
		$("#collapsePanel").on("hidden.bs.collapse",function(){
			$("#iconCollapse").addClass("fa-caret-square-down").removeClass("fa-caret-square-up");
		});
	});

function funSave()
{
var firstName= $.trim($("#firstName").val());
$("#firstName").val(firstName);

var lastName= $.trim($("#lastName").val());
$("#lastName").val(lastName);

var birthDate= $.trim($("#birthDate").val());
$("#birthDate").val(birthDate);

var gender= $("input[name='gender']").is(":checked");

var country= $.trim($("#country").val());
$("#country").val(country);

var email= $.trim($("#email").val());
var pattern= /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
$("#email").val(email);

var phoneNumber= $.trim($("#phoneNumber").val());
var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
$("#phoneNumber").val(phoneNumber);

var password= $.trim($("#password").val());
$("#password").val(password);

var confirmPassword= $.trim($("#confirmPassword").val());
$("#confirmPassword").val(confirmPassword);

var agreeTermsCondition= $("input[name='agreeTermsCondition']").is(":checked");

var btntoggle=$("#btnSave").val();

if(firstName==""){
alert("Please enter the First Name");
$("#firstName").focus();
}
else if(lastName==""){
alert("Please enter Last Name");
$("#lastName").focus();
}
else if(birthDate==""){
alert("Please enter your Date Of Birth");
$("#birthDate").focus();
}
else if(gender==false){
alert("Please select gender");
}
else if(country==""){
alert("Please enter Country");
$("#country").focus();
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
else if(password==""){
alert("Please enter the Password");
$("#password").focus();
}
else if(confirmPassword==""){
alert("Please enter the Confirm Password");
$("#confirmPassword").focus();
}
else if(password!=confirmPassword){
alert("Password does not match");
}
else if(agreeTermsCondition== false){
alert("Please agree to the terms and conditions to proceed");
}
else if(btntoggle=="Save")
{
$("#action").val("SAVE");
$("#employeeRegistration").attr("action","employeeform.jsp");
$("#employeeRegistration").submit();
}
else{
$("#action").val("UPDATE");
$("#employeeRegistration").attr("action","employeeform.jsp");
$("#employeeRegistration").submit();
}

}
function funClear(){
$("#firstName").val("");
$("#lastName").val("");
$("#birthDate").val("");
$(".gender").prop('checked', false);
$("#country").val("");
$("#email").val("");
$("#phoneNumber").val("");
$("#password").val("");
$("#confirmPassword").val("");
$("#agreeTermsCondition").prop('checked', false);
$("#firstName").focus();
}
function funEdit(employeeId){
$("#employeeModal").modal('show');
$("#btnSave").val("Update");
var action="EDIT";
$("#btnSave").attr('data-original-title','Click to Update');
$("#employeeId").val(employeeId);
$.ajax({
type : "post",
async : false,
url : "employeeformmgmt.jsp",
data : "employeeId="+employeeId+"&action="+action,
beforeSend : function() {
},
complete : function() {
},
success : function(info){
var projectDataRes= $.trim(info);
var project= projectDataRes.split("<~>");
var firstName = $.trim(project[0]);
var lastName = $.trim(project[1]);
var birthDate = $.trim(project[2]);
var gender = $.trim(project[3]);
var country=$.trim(project[4]);
var email = $.trim(project[5]);
var phoneNumber = $.trim(project[6]);
var password = $.trim(project[7]);
var confirmPassword = $.trim(project[8]);
var agreeTermsCondition= $.trim(project[9]);

$("#firstName").val(firstName);
$("#lastName").val(lastName);
$("#birthDate").val(birthDate);
if(gender==1){
$("#genderMale").prop('checked', true);
}
else{
$("#genderFemale").prop('checked', true);
}
$("#country").val(country);
$("#email").val(email);
$("#phoneNumber").val(phoneNumber);
$("#password").val(password);
$("#confirmPassword").val(confirmPassword);
if(agreeTermsCondition==1){
$("#agreeTermsCondition").prop('checked', true);
}
}
});
}
function funDelete(employeeId){
if (confirm("Are you sure to delete ?")) {
$("#employeeId").val(employeeId);
$("#action").val("DELETE");
$("#employeeRegistration").attr("action","employeeform.jsp");
$("#employeeRegistration").submit();
 }
else {
$("#employeeRegistration").attr("action","employeeform.jsp");
$("#employeeRegistration").submit();
 }
}
function funSearch()
{
	var searchFirstName= $.trim($("#searchFirstName").val());
	$("#searchFirstName").val(searchFirstName);
	
	var searchLastName= $.trim($("#searchLastName").val());
	$("#searchLastName").val(searchLastName);
	
	var fromBirthDate= $.trim($("#fromBirthDate").val());
	$("#fromBirthDate").val(fromBirthDate);
	
	var toBirthDate= $.trim($("#toBirthDate").val());
	$("#toBirthDate").val(toBirthDate);
	
	var searchGender= $("input[name='searchGender']").is(":checked");
	
	var startDate = new Date(fromBirthDate);
	var endDate = new Date(toBirthDate);
	
	if(searchFirstName==""&&searchLastName==""&&fromBirthDate==""&&toBirthDate==""&&searchGender==false){
		alert("Please enter a Detail to begin Search");
		$("#searchFirstName").focus();
	}
	else if(fromBirthDate !="" && toBirthDate =="")
		{
		alert("Invalid Date entry. Please enter to date");
		}
	else if(fromBirthDate =="" && toBirthDate !="")
	{
	alert("Invalid Date entry. Please enter from date");
	}
	else if(startDate > endDate)
		{
		alert("To date should be greater than or equal to From date");
		}
	
	else{
		$("#action").val("SEARCH");
		$("#employeeRegistration").attr("action","employeeform.jsp");
		$("#employeeRegistration").submit();
	}
}
function funLog(employeeId,logFirstName,logLastName)
{
var logEmployeeName=logFirstName+" "+logLastName;
$("#logEmployeeName").text(logEmployeeName);
$("#logModal").modal('show');
$.ajax({
type : "post",
async : false,
url : "employeeformmgmt.jsp",
data : "employeeId="+employeeId+"&action=LOG",
beforeSend : function() {
},
complete : function() {
},
success : function(info){
var projectDataRes= $.trim(info);
$("#loadModalContent").html(projectDataRes);
}
});
}
</script>
</body>
</html>