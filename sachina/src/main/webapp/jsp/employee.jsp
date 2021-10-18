<!DOCTYPE html>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id = "emp" class = "com.process.Employee" scope ="request"/>
<%


Vector vectDateOfMonth=new Vector();
vectDateOfMonth=emp.getDateofMonth();
int datOfMonthVal=0;
String dateOfMonthText="";
String dateOfMonthSelected="";
System.out.println("DateOfMonth  >> "+vectDateOfMonth);

Vector vectDateOfDay=new Vector();
vectDateOfDay=emp.getDateofDay();
int dateOfDayVal=0;
String dateOfDaySelected="";
System.out.println("DateOfDay  >> "+vectDateOfDay);

Vector vectDateOfYear=new Vector();
vectDateOfYear=emp.getDateofYear();
int dateOfYearVal=0;
String dateOfYearSelected="";
System.out.println("DateOfYear  >> "+vectDateOfYear);

Vector vectcountry=new Vector();
vectcountry=emp.getCountry();
String countryVal="";
String countryText="";
String countrySelected="";

String maleChecked="";
String femaleChecked="";

String agreeterms="";

String message="";



Vector vectEditEmployee= new Vector();

String action=(String)request.getParameter("action");
if(action==null)action="";
System.out.println("action  >> "+action);

if(!action.equals(""))
{
	
	if(action.equals("SAVE"))
	{
		String firstName=(String)request.getParameter("firstName");
		System.out.println("firstName  >> "+firstName);
		
		String lastName=(String)request.getParameter("lastName");
		System.out.println("lastName  >> "+lastName);
		
		String dobdate=(String)request.getParameter("dobDate");
		String dobmonth=(String)request.getParameter("dobMonth");
		String dobyear=(String)request.getParameter("dobYear");
		System.out.println("D.O.B >> "+ dobmonth +" "+ dobdate +" "+ dobyear);
		
		String gender=(String)request.getParameter("gender");
		System.out.println("gender >> "+gender);
		
		String email=(String)request.getParameter("email");
		System.out.println("email >> "+email);
		
		String phoneNumber=(String)request.getParameter("phoneNumber");
		System.out.println("phoneNumber >> "+phoneNumber);
		
		String password=(String)request.getParameter("password");
		System.out.println("password  >> "+password);
		
		String confirmPassword=(String)request.getParameter("confirmPassword");
		System.out.println("confirmPassword >> "+confirmPassword);
		
		String country=(String)request.getParameter("country");
		System.out.println("country  >> "+country);
		
		String agreeTermsConditions=(String)request.getParameter("agreeTermsConditions");
		System.out.println("agreeTermsConditions  >> "+agreeTermsConditions);
		
		message=emp.insertEmployeeDetails(firstName, lastName, dobmonth, dobdate, dobyear, gender, country, email, phoneNumber, password, confirmPassword, agreeTermsConditions);
	}
	else if(action.equals("EDIT"))
	{
		
		String employeeId=(String)request.getParameter("employeeId");
	    System.out.println("employeeId  >> "+employeeId);
	    
	    vectEditEmployee= emp.editEmployeeDetails(employeeId);
	    System.out.println("vectEditEmployee >>"+vectEditEmployee);
	}
	else if(action.equals("UPDATE"))
		
		{
			String firstName=(String)request.getParameter("firstName");
			System.out.println("firstName  >> "+firstName);
			
			String lastName=(String)request.getParameter("lastName");
			System.out.println("lastName  >> "+lastName);
			
			String dobdate=(String)request.getParameter("dobDate");
			String dobmonth=(String)request.getParameter("dobMonth");
			String dobyear=(String)request.getParameter("dobYear");
			System.out.println("D.O.B >> "+ dobmonth +" "+ dobdate +" "+ dobyear);
			
			String gender=(String)request.getParameter("gender");
			System.out.println("gender >> "+gender);
			
			String email=(String)request.getParameter("email");
			System.out.println("email >> "+email);
			
			String phoneNumber=(String)request.getParameter("phoneNumber");
			System.out.println("phoneNumber >> "+phoneNumber);
			
			String password=(String)request.getParameter("password");
			System.out.println("password  >> "+password);
			
			String confirmPassword=(String)request.getParameter("confirmPassword");
			System.out.println("confirmPassword >> "+confirmPassword);
			
			String country=(String)request.getParameter("country");
			System.out.println("country  >> "+country);
			
			String agreeTermsConditions=(String)request.getParameter("agreeTermsConditions");
			System.out.println("agreeTermsConditions  >> "+agreeTermsConditions);
			
			String employeeId=(String)request.getParameter("employeeId");
			System.out.println("employeeId  >> "+employeeId);
			
			message=emp.updateEmployeeDetails(firstName, lastName, dobmonth, dobdate, dobyear, gender, country, email, phoneNumber, password, confirmPassword, agreeTermsConditions,employeeId);
			vectEditEmployee= emp.editEmployeeDetails(employeeId);
		}
	
}

%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>My form</title>
<link href="../css/sachina.css" rel="stylesheet" type="text/css"/>
<style>
.message{
    	width: 60%;
    	margin-right: auto;
		margin-left: auto;
    	background-color: #F1C40F;
    	color: #000000;
    	font-family: monospace;
    	font-size: 18px;
    	padding: 10px;
    }
</style>
</head>
<body>
	
<form class="frmemployee" name="frmemployee" method="post">
<div>
<h2>SACHINA</h2>
</div>
<hr>
<br/>
<%
		if(!message.equals(""))
		{
		%>
		<table class="message" style="
    	width: 60%;
    	margin-right: auto;
		margin-left: auto;
    	background-color: #F1C40F;
    	color: #000000;
    	font-family: monospace;
    	font-size: 18px;
    	padding: 10px;
    ">
			<tbody>
				<tr>
					<td align="center"><%=message%></td>
				</tr>
			</tbody>
		</table>
		<table width="60%" align="center" cellpadding="5px">
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
		<%
		}
		%>
	<table class="style-table">
			<thead>
			    <tr>
			    <th colspan="3" align="center">Employee Form</th>
			    </tr>
			</thead>
			<tbody>
			 <%
				 int employeeId=0;
				 String firstName="";
				 String lastName="";
				 int dateOfMonth=0;
				 int dateOfDay=0;
				 int dateOfYear=0;
				 int gender=0;
				 String country="";
				 String email="";
				 long phoneNumber=0;
				 String password="";
				 String confirmPassword="";
				 int agreeTermsCondition=0;
				 
				Enumeration enu = vectEditEmployee.elements();
				if(enu.hasMoreElements())
				{
				    employeeId=(Integer)enu.nextElement();
				    firstName=(String)enu.nextElement();
				    lastName=(String)enu.nextElement();
					 dateOfMonth=(Integer)enu.nextElement();
					 dateOfDay=(Integer)enu.nextElement();
					 dateOfYear=(Integer)enu.nextElement();
					 gender=(Integer)enu.nextElement();
					 country=(String)enu.nextElement();
					 email=(String)enu.nextElement();
					 phoneNumber=(Long)enu.nextElement();
					 password=(String)enu.nextElement();
					 confirmPassword=(String)enu.nextElement();
					 agreeTermsCondition=(Integer)enu.nextElement();
					 System.out.println("agreeTermsCondition >>"+agreeTermsCondition);
					 if(agreeTermsCondition == 1)
					 {
						 agreeterms="checked";
					 }
					 else
					 {
						 agreeterms="";
					 }
					 
					 if(gender == 1)
					 {
						 maleChecked="checked";
						 femaleChecked="";
					 }
					 else
					 {
						 maleChecked="";
						 femaleChecked="checked";
					 }
					 
					
			    }
				%>
			
	           <tr>    
	              <td width="30%" align="right"><label class="label">First Name&nbsp;<font class="mandatory">*</font></label></td> 
	              <td width="10%"></td>   
	              <td width="60%" align="left"><input type="text" placeholder="first name" name="firstName" id="firstName" class="textbox" maxlength="20" value="<%=firstName%>" /></td> 
	            </tr>   
	            <tr> 
	               <td align="right"><label  class="label">Last Name&nbsp;<font class="mandatory">*</font></label></td>
	               <td></td>   
	               <td align="left"><input type="text" placeholder="last name" name="lastName" id="lastName" class="textbox" maxlength="20" value="<%=lastName%>"/></td> 
	            </tr>  
	            <tr>
	              <td align="right"><label  class="label">Date of Birth&nbsp;<font class="mandatory">*</font></label></td>
	              <td></td>   
	              <td align="left">
	              
	              
	              	<select class="selectbox" id="dobmonth" name="dobMonth" >
	              	    <option value="0">--select--</option>
	              	      <%
	              Enumeration e = vectDateOfMonth.elements();
					while(e.hasMoreElements())
					{
						 datOfMonthVal=(Integer)e.nextElement();
						 dateOfMonthText=(String)e.nextElement();
						 
						 if(datOfMonthVal==dateOfMonth)
						 {
							 dateOfMonthSelected="selected";
						 }
						 else{
							 dateOfMonthSelected="";
						 }
						 out.println(datOfMonthVal+" <====> "+dateOfMonth+" = "+dateOfMonthSelected);
					%>   
			            <option value="<%=datOfMonthVal%>" <%=dateOfMonthSelected%>><%=dateOfMonthText%></option>    
			          <%
					}
			          %>        
		            </select>&nbsp;&nbsp;
		            <select class="selectbox" id="dobdate" name="dobDate">
		            <option value="0">--select--</option>
		                <%
	              Enumeration enuDay = vectDateOfDay.elements();
					while(enuDay.hasMoreElements())
					{
						 dateOfDayVal=(Integer)enuDay.nextElement();
						 if(dateOfDayVal==dateOfDay)
						 {
							 dateOfDaySelected="selected";
						 }
						 else{
							 dateOfDaySelected="";
						 }
						 out.println(dateOfDayVal+"  = "+dateOfDaySelected);
					%>   
			            <option value="<%=dateOfDayVal%>" <%=dateOfDaySelected%>><%=dateOfDayVal%></option>    
			          <%
					}
			          %>            
		            </select>&nbsp;&nbsp;
		            <select class="selectbox"name="dobYear" id="dobyear" >
		            <option value="0">--select--</option>
		                <%
	              Enumeration enuYear = vectDateOfYear.elements();
					while(enuYear.hasMoreElements())
					{
						dateOfYearVal=(Integer)enuYear.nextElement();
						 if(dateOfYearVal==dateOfYear)
						 {
							 dateOfYearSelected="selected";
						 }
						 else{
							 dateOfYearSelected="";
						 }
						 
					%>   
			            <option value="<%=dateOfYearVal%>" <%=dateOfYearSelected%>><%=dateOfYearVal%></option>    
			          <%
					}
			          %>          
		            </select>
		           </td>
	             </tr>
	             <tr>
		             <td align="right"><label  class="label"> Gender&nbsp;<font class="mandatory">*</font></label></td>
		             <td></td>   
		             <td align="left">
		                <input type="radio"  name="gender" id="genderMale" value="1" class="radio-button" <%=maleChecked%>/>
						<label for="male">Male</label>
						<input type="radio"  name="gender"  id="genderFemale" value="2" class="radio-button"<%=femaleChecked%> />
						<label for="female">Female</label>
					 </td>
	             </tr>
	             <tr>
		             <td align="right"><label  class="label">Country&nbsp;<font class="mandatory">*</font></label></td>
		             <td></td>   
		             <td align="left">
			             <select class="selectbox" id="country" name="country"  style="width:60%;" >  
			              <option value="">--select--</option>  
				           <%
	              Enumeration enuCountry = vectcountry.elements();
					while(enuCountry.hasMoreElements())
					{
						countryVal=(String)enuCountry.nextElement();
						countryText=(String)enuCountry.nextElement();
						 if(countryVal.equals(country))
						 {
							 countrySelected="selected";
						 }
						 else{
							 countrySelected="";
						 }
						 
					%>   
			            <option value="<%=countryVal%>" <%=countrySelected%>><%=countryText%></option>    
			          <%
					}
			          %>        
			             </select> 
		             </td>
	             </tr>
	             <tr>
		             <td align="right"><label  class="label">Email&nbsp;<font class="mandatory">*</font></label></td>
		             <td></td>   
		             <td align="left"><input type="text" placeholder="example@gmail.com" name="email" id="email" class="textbox" value="<%=email%>"/></td>
	             </tr>
	             <tr>
		             <td align="right"><label  class="label">Phone Number&nbsp;<font class="mandatory">*</font></label></td>
		             <td></td>   
		            <%
				if(phoneNumber!=0)
				{
				%>
				<td align="left"><input name="phoneNumber" id="phoneNumber" class="textbox" type="text" placeholder="+91 (#####)(#####)" value="<%=phoneNumber%>" maxlength="10"></td>
				<%
				}
				else
				{
				%>
				<td align="left"><input name="phoneNumber" id="phoneNumber" class="textbox" type="text" placeholder="+91 (#####)(#####)" maxlength="10"></td>
				<%
				}
				%>
	             </tr>
	             <tr>
		             <td align="right"><label  class="label">Password&nbsp;<font class="mandatory">*</font></label></td>
		             <td></td>   
		             <td align="left"><input type="password" placeholder="enter your password" name="password" id="password" class="textbox" maxlength="20" value="<%=password%>"/></td>
	             </tr>
	              <tr>
		             <td align="right"><label  class="label">Confirm password&nbsp;<font class="mandatory">*</font></label></td>
		             <td></td>   
		             <td align="left"><input type="password" placeholder="Confirm your password" name="confirmPassword" id="confirmPassword" class="textbox" maxlength="20"value="<%=confirmPassword%>"/></td>
	             </tr>
	             <tr>
					<td align="right"></td>
					<td></td>   
					<td align="left"><input type="checkbox" name="agreeTermsConditions" value="1" id="agreeTermsConditions" class="checkbox" <%=agreeterms%>/>&nbsp;&nbsp;I agree to the terms and conditions</td>
			     </tr>
			    
		      </tbody>
	</table>
	<table class="button-table" >
			<tr>
				<td width="30%" align="left"></td>
				<td width="10%"></td>
				<td width="0%" align="left">
				<% 
				if(action.equals("EDIT") || action.equals("UPDATE"))
				{
				%>
				&nbsp;&nbsp;
				<input type="button" name="update" id="update" class="button save" value="Update"	onclick="javascript:funProcess('UPDATE');"/>&nbsp;&nbsp;
				<input type="button" name="create" id="create" class="button create" value="Create Employee" style="font-size:18px;background-color:green;color:white;width:160px"onclick="Javascipt:funCreateEmployee();"/>&nbsp;&nbsp;
				<%
				}
				else
				{
				%>
				<input type="button" name="SAVE" id="SAVE" class="button save" value="Save" onclick="javascript:funProcess('SAVE');"/>&nbsp;&nbsp;
				<%
				}
				%>
				<input type="button" value="Clear" name="clear" id="clear" class="button clear" style="background-color:#FFFF00;" onclick="javscript:clearform();"/>&nbsp;&nbsp;
				<input type="button" value="Cancel" name="cancel" id="cancel" class="button cancel" onclick="javscript:funCancel();" />
				</td>
		  </tr>
	</table>
<hr>
<br/>
<br/>
<br/>
<br/>
<input type="hidden" name="action" id="action"/>
<input type="hidden" name="employeeId" id="employeeId" value="<%=employeeId%>"/>
</form>
</body>
</html>
<script type="text/javascript">
function funProcess(action)
{
	var firstName= trim(document.frmemployee.firstName.value);
	document.frmemployee.firstName.value=firstName;
	
	var lastName=trim(document.frmemployee.lastName.value);
	document.frmemployee.lastName.value=lastName;
	
	var dobDate=document.frmemployee.dobDate.value;
	var dobMonth=document.frmemployee.dobMonth.value;
	var dobYear=document.frmemployee.dobYear.value;
	
	var gendermale=document.getElementById("genderMale").checked;
	var genderfemale=document.getElementById("genderFemale").checked;
	
	var country=document.frmemployee.country.value;
	
	var email=trim(document.frmemployee.email.value);
	var pattern= /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
	document.frmemployee.email.value=email;
	
	var phoneNumber=trim(document.frmemployee.phoneNumber.value);
	document.frmemployee.phoneNumber.value=phoneNumber;
	var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
	
	var password=trim(document.frmemployee.password.value);
	document.frmemployee.password.value=password;
	
	var confirmPassword=trim(document.frmemployee.confirmPassword.value);
	document.frmemployee.confirmPassword.value=confirmPassword;
	
	var agreeTermsConditions=document.frmemployee.agreeTermsConditions.checked;
	


	if(firstName=="")
		{
		alert("Enter the First Name");
		document.frmemployee.firstName.focus();
		}
	else if(lastName=="")
		{
		alert("Enter the Last Name");
		document.frmemployee.lastName.focus();
		}
	else if((dobDate=="0")&&(dobMonth=="0")&&(dobYear=="0"))
		{
		alert("Enter the Date of Birth");
		}
	else if(dobDate=="0")
		{
		alert("Enter the Date");
		}
	else if(dobMonth=="0")
		{
		alert("Enter the Month");
		}
	else if(dobYear=="0")
		{
		alert("Enter the year");
		}
	else if(gendermale==false && genderfemale==false)
		{
		alert("Enter the Gender");
		}
	else if(country=="")
		{
		alert("Enter the Country");
		document.frmemployee.country.focus();
		}
	else if(email=="")
		{
		alert("Enter the Email");
		document.frmemployee.email.focus();
		}
	else if(!email.match(pattern))
		{
		alert("Invalid email");
		document.getElementById("email").value="";
		}
	else if(phoneNumber=="")
		{
		alert("Enter the Phone Number");
		document.frmemployee.phoneNumber.focus();
		}
	
	else if(!phoneNumber.match(filter)|| !(phoneNumber.length=="10"))
		{
		alert("invalid phoneNumber");
		document.getElementById("phoneNumber").value="";
		}
	else if(password=="")
		{
		alert("Enter the Password");
		document.frmemployee.password.focus();
		}
	else if(confirmPassword=="")
		{
		alert("Enter the Confirm Password");
		document.frmemployee.confirmPassword.focus();
		}
	else if(password!=confirmPassword)
		{
		alert("Password and confirmPassword does not match");
		}
	else if(!agreeTermsConditions)
		{
		alert("Enter the checkbox");
		}
	else
		{
		document.getElementById("action").value=action;
		document.frmemployee.action="employee.jsp";
		document.frmemployee.submit();
		}
	}
function clearform()
{	
	document.getElementById("firstName").value="";
	document.getElementById("lastName").value="";
	document.getElementById("dobmonth").value="0";
	document.getElementById("dobdate").value="0";
	document.getElementById("dobyear").value="0";
	document.getElementById("genderMale").checked=false;
	document.getElementById("genderFemale").checked=false;
	document.getElementById("country").value=0;
	document.getElementById("email").value="";
	document.getElementById("phoneNumber").value="";
	document.getElementById("password").value="";
	document.getElementById("confirmPassword").value="";
	document.getElementById("agreeTermsConditions").checked=false;
	document.getElementById("genderMale").checked=false;
	document.getElementById("genderFemale").checked=false;
	document.getElementById("firstName").focus();
	}
function trim(stringTrim)
{
	return stringTrim.replace(/^\s+|\s+$/g,"");
}
function funCancel()
{
	document.frmemployee.action="employeelist.jsp";
	document.frmemployee.submit();
	}
	
function funCreateEmployee(){
	document.frmEmployee.action="employee.jsp";
	document.frmEmployee.submit();
}
</script>