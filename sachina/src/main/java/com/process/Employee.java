package com.process;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import com.DB.DBConnection;
import com.DB.DBException;

public class Employee {


	public Connection returnconnection()throws DBException
	{
		Connection con=null;
		try
		{
			DBConnection db = new DBConnection();
			con = db.initconnection();
		}
		catch(Exception e)
		{
			throw new DBException(e.getMessage());
		}
		return con;
	}
	
	public String insertEmployeeDetails(String firstName, String lastName, String dateOfMonth, String dateOfDay, String dateOfYear, String gender, String country, String email, String phoneNumber, String password, String confirmPassword, String agreeTermsConditions)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int agreeTermsConditionsvalue=0;
		String message="";
		try
		{
			/***************************************************************/
			if(dateOfMonth==null || dateOfMonth.equals(""))
			{
				dateOfMonth="0";
			}
			if(dateOfDay==null || dateOfDay.equals(""))
			{
				dateOfDay="0";
			}
			if(dateOfYear==null || dateOfYear.equals(""))
			{
				dateOfYear="0";
			}
			if(gender==null || gender.equals(""))
			{
				gender="0";
			}
			if(phoneNumber==null || phoneNumber.equals(""))
			{
				phoneNumber="0";
			}
			if(agreeTermsConditions==null || agreeTermsConditions.equals(""))
			{
				agreeTermsConditionsvalue=0;
			}
			else {
				agreeTermsConditionsvalue=Integer.parseInt(agreeTermsConditions);
			}
			/***************************************************************/
			if(firstName==null)
			{
				firstName="";
			}
			/***************************************************************/
			con=returnconnection();
			pst=con.prepareStatement("insert into mst_employee(first_name, last_name, date_of_month, date_of_day, date_of_year, gender, country, email, phone_number, password, confirm_password, agree_terms_conditions) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pst.setString(1, validateNull(firstName).trim());
			pst.setString(2, validateNull(lastName).trim());
			pst.setInt(3, Integer.parseInt(dateOfMonth));
			pst.setInt(4, Integer.parseInt(dateOfDay));
			pst.setInt(5, Integer.parseInt(dateOfYear));
			pst.setInt(6, Integer.parseInt(gender));
			pst.setString(7, validateNull(country).trim());
			pst.setString(8, validateNull(email).trim());
			pst.setLong(9, Long.parseLong(phoneNumber));
			pst.setString(10, validateNull(password).trim());
			pst.setString(11, validateNull(confirmPassword).trim());
			pst.setInt(12, agreeTermsConditionsvalue);
			pst.executeUpdate();
			message="Created successfully";
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Execption while inserting using method insertEmployeeDetails in employee class::"+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(con!=null)con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while closing the connection when inserting the employee details using method insertEmployeeDetails in Employee class :: "+ec.getMessage());
			}
		}
		return message;
	}
	
	public Vector getEmployeeDetails()
	{
		Vector vect =  new Vector();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try
		{
			
			con=returnconnection();
			pst=con.prepareStatement("select  employee_id, ltrim(rtrim(isnull(first_name,''))) as first_name, ltrim(rtrim(isnull(last_name,''))) as last_name, isnull(date_of_month,0) as date_of_month, isnull(date_of_day,0) as date_of_day, isnull(date_of_year,0) as date_of_year, isnull(gender,0) as gender, ltrim(rtrim(isnull(country,''))) as country, ltrim(rtrim(isnull(email,''))) as email, isnull(phone_number,0) as phone_number, ltrim(rtrim(isnull(password,''))) as password,ltrim(rtrim(isnull(confirm_password,''))) as confirm_password, isnull(agree_terms_conditions,0) as agree_terms_conditions from mst_employee order by employee_id");
			rs=pst.executeQuery();
			while(rs.next())
			{
				vect.add(rs.getInt("employee_id"));
				vect.add(validateNull(rs.getString("first_name")).trim());
				vect.add(validateNull(rs.getString("last_name")).trim());
				vect.add(rs.getInt("date_of_month"));
				vect.add(rs.getInt("date_of_day"));
				vect.add(rs.getInt("date_of_year"));
				vect.add(rs.getInt("gender"));
				vect.add(validateNull(rs.getString("country")).trim());
				vect.add(validateNull(rs.getString("email")).trim());
				vect.add(rs.getLong("phone_number"));
				vect.add(validateNull(rs.getString("password")).trim());
				vect.add(validateNull(rs.getString("confirm_password")).trim());
				vect.add(rs.getInt("agree_terms_conditions"));
				
				//System.out.println("vect >> "+vect);
			}
			//System.out.println("vector >> "+vect);	
		}
		catch(Exception e)
		{
			System.out.println("Execption while selecting the employee details using method getEmployeeDetails in employee class :: "+e.getMessage());
		}
		
		return vect;
	}
	
	public Vector editEmployeeDetails(String employeeId)
	{
		Vector vect =  new Vector();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try
		{
			if(employeeId==null || employeeId.equals(""))
		{
			employeeId="0";
		}
			
			con=returnconnection();
			pst=con.prepareStatement("select  employee_id, ltrim(rtrim(isnull(first_name,''))) as first_name, ltrim(rtrim(isnull(last_name,''))) as last_name, isnull(date_of_month,0) as date_of_month, isnull(date_of_day,0) as date_of_day, isnull(date_of_year,0) as date_of_year, isnull(gender,0) as gender, ltrim(rtrim(isnull(country,''))) as country, ltrim(rtrim(isnull(email,''))) as email, isnull(phone_number,0) as phone_number, ltrim(rtrim(isnull(password,''))) as password,ltrim(rtrim(isnull(confirm_password,''))) as confirm_password, isnull(agree_terms_conditions,0) as agree_terms_conditions from mst_employee where employee_id=?");
			pst.setInt(1, Integer.parseInt(employeeId));
			rs=pst.executeQuery();
			if(rs.next())
			{
				vect.add(rs.getInt("employee_id"));
				vect.add(validateNull(rs.getString("first_name")).trim());
				vect.add(validateNull(rs.getString("last_name")).trim());
				vect.add(rs.getInt("date_of_month"));
				vect.add(rs.getInt("date_of_day"));
				vect.add(rs.getInt("date_of_year"));
				vect.add(rs.getInt("gender"));
				vect.add(validateNull(rs.getString("country")).trim());
				vect.add(validateNull(rs.getString("email")).trim());
				vect.add(rs.getLong("phone_number"));
				vect.add(validateNull(rs.getString("password")).trim());
				vect.add(validateNull(rs.getString("confirm_password")).trim());
				vect.add(rs.getInt("agree_terms_conditions"));
				System.out.println("vect >> "+vect);
			}
			System.out.println("vector >> "+vect);	
		}
		catch(Exception e)
		{
			System.out.println("Execption while selecting the employee details using method editEmployeeDetails in employee class :: "+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(con!=null)con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while closing the connection when inserting the employee details using method insertEmployeeDetails in Employee class :: "+ec.getMessage());
			}
		}
		return vect;
	}
	public Vector getDateofMonth()
	{
		Vector vect =  new Vector();
	try {
		vect.add(1);
		vect.add("January");
		vect.add(2);
		vect.add("February");
		vect.add(3);
		vect.add("March");
		vect.add(4);
		vect.add("April");
		vect.add(5);
		vect.add("May");
		vect.add(6);
		vect.add("June");
		vect.add(7);
		vect.add("July");
		vect.add(8);
		vect.add("August");
		vect.add(9);
		vect.add("September");
		vect.add(10);
		vect.add("October");
		vect.add(11);
		vect.add("November");
		vect.add(12);
		vect.add("December");
		System.out.println("vect >> "+vect);
	}
	catch(Exception e)
	{
		System.out.println("Exception while enumerating date of month by using method getDateofMonth in employee class :: "+e.getMessage());
	}
	return vect;
	}
	
	public Vector getDateofDay()
	{
		Vector vect =  new Vector();
	try {
		vect.add(1);
		vect.add(2);
		vect.add(3);
		vect.add(4);
		vect.add(5);
		vect.add(6);
		vect.add(7);
		vect.add(8);
		vect.add(9);
		vect.add(10);
		vect.add(11);
		vect.add(12);
		vect.add(13);
		vect.add(14);
		vect.add(15);
		vect.add(16);
		vect.add(17);
		vect.add(18);
		vect.add(19);
		vect.add(20);
		vect.add(21);
		vect.add(22);
		vect.add(23);
		vect.add(24);
		vect.add(24);
		vect.add(25);
		vect.add(26);
		vect.add(27);
		vect.add(28);
		vect.add(29);
		vect.add(30);
		vect.add(31);
		System.out.println("vect >> "+vect);
	}
	catch(Exception e)
	{
		System.out.println("Exception while enumerating date of month by using method getDateofMonth in employee class :: "+e.getMessage());
	}
	return vect;
	}
	
	public Vector getDateofYear()
	{
		Vector vect =  new Vector();
	try {
		vect.add(2021);
		vect.add(2020);
		vect.add(2019);
		vect.add(2018);
		vect.add(2017);
		vect.add(2016);
		vect.add(2015);
		vect.add(2014);
		vect.add(2013);
		vect.add(2012);
		vect.add(2011);
		System.out.println("vect >> "+vect);
	}
	catch(Exception e)
	{
		System.out.println("Exception while enumerating date of month by using method getDateofMonth in employee class :: "+e.getMessage());
	}
	return vect;
	}
	
	public Vector getCountry()
	{
		Vector vect =  new Vector();
	try {
		vect.add("ind");
		vect.add("India");
		vect.add("aus");
		vect.add("Australia");
		vect.add("sri");
		vect.add("SriLanka");
		vect.add("us");
		vect.add("USA");
		
		System.out.println("vect >> "+vect);
	}
	catch(Exception e)
	{
		System.out.println("Exception while enumerating date of month by using method getDateofMonth in employee class :: "+e.getMessage());
	}
	return vect;
	}
	
	public String updateEmployeeDetails(String firstName, String lastName, String dateOfMonth, String dateOfDay, String dateOfYear, String gender, String country, String email, String phoneNumber, String password, String confirmPassword, String agreeTermsConditions,String employeeId)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int agreeTermsConditionsvalue=0;
		String message="";
		try
		{
			/***************************************************************/
			if(dateOfMonth==null || dateOfMonth.equals(""))
			{
				dateOfMonth="0";
			}
			if(dateOfDay==null || dateOfDay.equals(""))
			{
				dateOfDay="0";
			}
			if(dateOfYear==null || dateOfYear.equals(""))
			{
				dateOfYear="0";
			}
			if(gender==null || gender.equals(""))
			{
				gender="0";
			}
			if(phoneNumber==null || phoneNumber.equals(""))
			{
				phoneNumber="0";
			}
			if(agreeTermsConditions==null || agreeTermsConditions.equals(""))
			{
				agreeTermsConditionsvalue=0;
			}
			else {
				agreeTermsConditionsvalue=Integer.parseInt(agreeTermsConditions);
			}
			/***************************************************************/
			if(firstName==null)
			{
				firstName="";
			}
			/***************************************************************/
			con=returnconnection();
			pst=con.prepareStatement("update mst_employee set first_name=?, last_name=?,date_of_month=?, date_of_day=?,date_of_year=?,gender=?,country=?,email=?,phone_number=?,password=?,confirm_password=?,agree_terms_conditions=? where employee_id=?");
			pst.setString(1, validateNull(firstName).trim());
			pst.setString(2, validateNull(lastName).trim());
			pst.setInt(3, Integer.parseInt(dateOfMonth));
			pst.setInt(4, Integer.parseInt(dateOfDay));
			pst.setInt(5, Integer.parseInt(dateOfYear));
			pst.setInt(6, Integer.parseInt(gender));
			pst.setString(7, validateNull(country).trim());
			pst.setString(8, validateNull(email).trim());
			pst.setLong(9, Long.parseLong(phoneNumber));
			pst.setString(10, validateNull(password).trim());
			pst.setString(11, validateNull(confirmPassword).trim());
			pst.setInt(12, agreeTermsConditionsvalue);
			pst.setInt(13, Integer.parseInt(employeeId));
			pst.executeUpdate();
			message="Employee details updated";
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Execption while inserting using method insertEmployeeDetails in employee class::"+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(con!=null)con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while closing the connection when inserting the employee details using method insertEmployeeDetails in Employee class :: "+ec.getMessage());
			}
		}
		return message;
	}
	
	
	public String deleteEmployeeDetails(String employeeId)
	{
		Connection con=null;
		PreparedStatement pst=null;
		int agreeTermsConditionsvalue=0;
		String message="";
		try
		{
			
			con=returnconnection();
			pst=con.prepareStatement("delete from mst_employee where employee_id=?");
			pst.setInt(1, Integer.parseInt(employeeId));
			pst.executeUpdate();
			message="Employee details deleted sucessfully";
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Execption while deleting using method deleteEmployeeDetails in employee class::"+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(con!=null)con.close();
			}
			catch (Exception ec) 
			{
				System.out.println("Exception while closing the connection when deleting the employee details using method insertEmployeeDetails in Employee class :: "+ec.getMessage());
			}
		}
		return message;
	}
	
	
	private String validateNull(String str)
	{
		if(str==null)
		{
			str="";
		}
		return str;
	}
	
	/****************************************************/
	
}
