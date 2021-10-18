<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*, com.model.employee"%>
<jsp:useBean id = "employee" class = "com.process.employeeForm" scope ="request"/>

<%
String action= (String)request.getParameter("action");
System.out.println("action >> "+action);


if(action.equals("EDIT")){
		String employeeId= (String)request.getParameter("employeeId");
		if(employeeId==null || employeeId.equals(""))employeeId="0";
		String projectData= "";
		String firstName= "";
		String lastName= "";
		String birthDate= "";
		String country="";
		int gender= 0;
		String email= "";
		long phoneNumber= 0;
		String password= "";
		String confirmPassword= "";
		int agreeTermsConditions=0;
		String dateConverted="";
		
		List<employee> lstEditEmployee= employee.editEmployeeDetails(Integer.parseInt(employeeId));
		
		Iterator<employee> ItrEdit= lstEditEmployee.iterator();
		
		if(ItrEdit.hasNext()){
				employee objItr= ItrEdit.next();
				
				firstName= objItr.getFirstName();
				lastName= objItr.getLastName();
				birthDate= objItr.getBirthDate();
				country=objItr.getCountry();
				gender= objItr.getGender();
				email= objItr.getEmail();
				phoneNumber= objItr.getPhoneNumber();
				password= objItr.getPassword();
				confirmPassword= objItr.getConfirmPassword();
				agreeTermsConditions= objItr.getAgreeTermsCondition();
				dateConverted=employee.dateConversion(birthDate);
				
				projectData= firstName + "<~>" + lastName + "<~>" + dateConverted + "<~>" + gender + "<~>" + country +"<~>" + email + "<~>" + phoneNumber + "<~>" + password + "<~>" + confirmPassword + "<~>" + agreeTermsConditions;
				out.println(projectData);
            }
}
else if(action.equals("LOG")){
	String employeeId= (String)request.getParameter("employeeId");
	if(employeeId==null || employeeId.equals(""))employeeId="0";
	String projectData= "";
	String tableContent="";
	
	String tableStart="<table class='table table-striped table-bordered'><thead><tr><th class='text-center'><label>Action</label></th><th class='text-center'><label>Action By</label></th><th class='text-center'><label>Log Date</label></th></tr></thead><tbody>";
	
	List<employee> lstEmployeeLog= new ArrayList<employee>();
	 lstEmployeeLog= employee.getEmployeeLogDetails(Integer.parseInt(employeeId));
	 Iterator<employee> itrEmployee = lstEmployeeLog.iterator(); 
	 while(itrEmployee.hasNext())
	 {
		 employee objItr= itrEmployee.next();
		 tableContent=tableContent+"<tr><td class='text-left'>"+objItr.getLogAction()+"</td><td class='text-left'>"+objItr.getLogActionBy()+"</td><td class='text-center'>"+objItr.getLogDate()+"</td></tr>";
	}
	 
	String tableBottom="</tbody></table>";
	projectData=tableStart+tableContent+tableBottom;
	out.println(projectData);
}
 %>
 
 