<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<jsp:useBean id = "emp" class = "com.process.Employee" scope ="request"/>
<%
Vector vectEmployee=null;

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

String message="";

String action=(String)request.getParameter("action");
if(action==null)action="";

System.out.println("action  >> "+action);

if(!action.equals(""))
{
	
	if(action.equals("DELETE"))
	{
		String empId=(String)request.getParameter("employeeId");
		System.out.println("empId  >> "+empId);
		message=emp.deleteEmployeeDetails(empId);
	}
}
vectEmployee = emp.getEmployeeDetails();

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Employee Details</title>
		<style>
			.employeeDetails ,th, tr
			 {
				 font-size:17px;
				 padding:12px 15px;
			 }
			 .employeeDetails tbody tr:nth-of-type(even){
			    background-color: #f3f3f3;
			 }
			.employeeDetails {
			    border-collapse: collapse;
			    margin:auto;
			    font-size:13px;
			    font-family: sans-serif;
			    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
			    width:95%;
			    margin-top:25px;
			 }
			 .button{
				 position:relative;
				 left:91%;
				 padding:7px;
				 margin-top:10px;
				 background-color:rgba(255, 0, 0, 0.8);
				 color:white;
				 border-radius:10px;
				 
			 }
			 img{
				 width:20px;
				 height:35px;
			 }
			 th{
				 background-color: #009879;
				 color:white;
				 font-size:20px;
			 }
			 
			 .message{
			    	width: 95%;
			    	margin-right: auto;
					margin-left: auto;
			    	background-color: #F1C40F;
			    	color: #000000;
			    	font-family: monospace;
			    	font-size: 18px;
			    	padding: 10px;
                 }
                 td{
                 padding-left:20px;
                 }
                 div{
		color:#009879;
		font-size:30px;
		background-color:#DBF9DB;
		height:100px;
		padding:5px 5px;
		font-family:fantasy;
	}
			 
		</style>
	</head>
	<body>
	<form id="frmEmployeeList" name="frmEmployeeList" method="post">
	<div>
<h2>SACHINA</h2>
</div>
<hr>
	<%
		if(!message.equals("") || vectEmployee.isEmpty())
		{
		%>	
		<table class="message">
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
	<input type="button" class="button" name="button" value="Create Employee" id="myButton" onclick="javascript:funCreateEmployee();"/><br/>
	<%
		if(vectEmployee.isEmpty())
		{
		%>
		<br>&nbsp;
		<table class="message" style="width:95%">
			<tbody>
				<tr>
					<td align="center">No Employee details available. Please create employee.</td>
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
		else
		{
		%>
		
		<table class="employeeDetails" align="center" border="1px" >
			<thead>
				<tr>
					<th width="15%" align="center">First Name</th>
					<th width="15%" align="center">Last Name</th>
					<th width="10%" align="center">Date of Birth</th>
					<th width="10%" align="center">Gender</th>
					<th width="20%" align="center">Email</th>
					<th width="10%" align="center">Country</th>
					<th width="10%" align="center">Phone Number</th>
					<th width="10%" align="center">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				Enumeration enu = vectEmployee.elements();
				String genderData="";
				while(enu.hasMoreElements())
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
					 
					 if(gender==1){
							genderData="Male";
						}
						else{
							genderData="Female";
						}
				%>
				<tr>
					<td align="left"><%=firstName%></td>
					<td align="left"><%=lastName%></td>
					<td align="left"><%=dateOfMonth%>/<%=dateOfDay%>/<%=dateOfYear%></td>
					<td align="left"><%=genderData%></td>
					<td align="left"><%=email%></td>
					<td align="left"><%=country%></td>
					<td align="left"><%=phoneNumber%></td>
					<td align="center"><a href="#" onclick="javascript:funEditEmployee(<%=employeeId%>);"><img alt="action" src="images/pen.png" title="Click to Edit" ></a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:funDeleteEmployee(<%=employeeId%>);"><img class="delete" alt="delete" src="images/trash1.png" style="padding-left:20px;" title="Click to Delete"></a></td>
				</tr>
				<%
				}
				%>
				<%
				}
				%>
			</tbody>
		</table>
		<input type="hidden" name="employeeId" id="employeeId" value=0/>
		<input type="hidden" name="action" id="action"/>
		</form>
	</body>
</html>
		<script type="text/javascript">
		function funCreateEmployee(){
			document.frmEmployeeList.action="employee.jsp";
			document.frmEmployeeList.submit();
		}
		
		function  funEditEmployee(empId) 
		{
			document.getElementById("employeeId").value=empId;
			document.getElementById("action").value="EDIT";
			document.frmEmployeeList.action="employee.jsp";
			document.frmEmployeeList.submit();
		}
		function  funDeleteEmployee(empId) 
		{
			if(confirm("Are you sure to delete"))
				{
			document.getElementById("employeeId").value=empId;
			document.getElementById("action").value="DELETE";
			document.frmEmployeeList.action="employeelist.jsp";
			document.frmEmployeeList.submit();
				}
			else{
				document.frmEmployeeList.action="employeelist.jsp";
				  document.frmEmployeeList.submit();
			}
		}
		
		</script>
