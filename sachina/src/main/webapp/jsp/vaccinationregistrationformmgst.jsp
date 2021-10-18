<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*, com.model.covid"%>
<jsp:useBean id = "covid" class = "com.process.covidregistration" scope ="request"/>

<%
String action= (String)request.getParameter("action");
System.out.println("action >> "+action);


if(action.equals("EDIT")){
	String registrationId= (String)request.getParameter("regitrationIds");
	if(registrationId==null || registrationId.equals(""))registrationId="0";
String projectData= "";
String firstName= "";
String lastName= "";
String aadhar= "";
String birthDate= "";
int gender= 0;
String email= "";
long phoneNumber= 0;
String address1= "";
String address2= "";
String city= "";
String state= "";
int zipcode= 0;
String insuranceCompany= "";
String insuranceId= "";
String dateConverted="";

List<covid> lstEdit= covid.editRegistationDetails(Integer.parseInt(registrationId));

Iterator<covid> ItrEdit= lstEdit.iterator();

if(ItrEdit.hasNext()){
	covid objItr= ItrEdit.next();
	
	firstName= objItr.getFirstName();
	lastName= objItr.getLastName();
	aadhar= objItr.getAadhar();
	birthDate= objItr.getBirthDate();
	gender= objItr.getGender();
	email= objItr.getEmail();
	phoneNumber= objItr.getPhoneNumber();
	address1= objItr.getAddress1();
	address2= objItr.getAddress2();
	city= objItr.getCity();
	state= objItr.getState();
	zipcode= objItr.getZipcode();
	insuranceCompany= objItr.getInsuranceCompany();
	insuranceId= objItr.getInsuranceId();
	dateConverted=covid.dateConversion(birthDate);
	
	projectData= firstName + "<~>" + lastName + "<~>" + aadhar + "<~>" + dateConverted + "<~>" + gender + "<~>" + email + "<~>" + phoneNumber + "<~>" + address1 + "<~>" + address2 + "<~>" + city + "<~>" + state + "<~>" + zipcode + "<~>" + insuranceCompany + "<~>" + insuranceId;
	out.println(projectData);
                     }
}
else if(action.equals("SAVE")){
	String aadharmgmt= (String)request.getParameter("aadhar");
	System.out.println("aaadhar >> "+aadharmgmt);
	boolean saveExist=covid.validateAadharNum(aadharmgmt);
	System.out.println("saveExist >> "+saveExist);
	out.println(saveExist);
}

else if(action.equals("UPDATE")){
	String aadharmgmt= (String)request.getParameter("aadhar");
	System.out.println("aaadhar >> "+aadharmgmt);
	String registrationId= (String)request.getParameter("regitrationIds");
	if(registrationId==null || registrationId.equals(""))registrationId="0";
	System.out.println("registrationId >> "+registrationId);
	boolean saveExist=covid.validateAadharNumEdit(aadharmgmt,Integer.parseInt(registrationId));
	System.out.println("saveExist >> "+saveExist);
	out.println(saveExist);
}
%>