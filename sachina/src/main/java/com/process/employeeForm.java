package com.process;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import com.DB.DBConnection;
import com.DB.DBException;
import com.model.employee;

public class employeeForm {
	public int employeeId;
	public String firstName;
	public String lastName;
	public String birthDate;
	public int gender;
	public String country;
	public String email;
	public long phoneNumber;
	public String password;
	public String confirmPassword;
	public int agreeTermsCondition;
	public String genderVal;
	public String SearchFirstName;
	public String SearchLastName;
	public int SearchGender;
	public String FromBirthDate;
	public String ToBirthDate;
	
	public Connection returnconnection()throws DBException
	{
		Connection Con = null;
		try
		{
			DBConnection db = new DBConnection();
			Con = db.initconnection();
		}
		catch(Exception e)
		{
			throw new DBException(e.getMessage());
		}
		return Con;
	}
	public String insertEmployeeDetails(String mode) {
		Connection Con = null;
		//PreparedStatement pst = null;
		CallableStatement cstmt;
		String message="";
		ResultSet rs = null;
		String action="";
		try 
		{
			action="Employee" + getFirstName() + " " + getLastName()+ "Created Sucessfully";
			Con= returnconnection();
		
		cstmt = Con.prepareCall("{call usb_manage_employee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		cstmt.setInt(1,0);	
		cstmt.setString(2, validateNull(getFirstName()).trim());
		cstmt.setString(3, validateNull(getLastName()).trim());
		cstmt.setString(4, validateNull(getBirthDate()).trim());
		cstmt.setInt(5, getGender());
		cstmt.setString(6, validateNull(getCountry()).trim());
		cstmt.setString(7, validateNull(getEmail()).trim());
		cstmt.setLong(8, getPhoneNumber());
		cstmt.setString(9, validateNull(getPassword()).trim());
		cstmt.setString(10, validateNull(getConfirmPassword()).trim());
		cstmt.setInt(11, getAgreeTermsCondition());
		cstmt.setString(12,action);
		cstmt.setString(13,"SANTHOSH");
		cstmt.setString(14,mode);
		cstmt.setString(15, "");
		cstmt.setString(16, "");
		cstmt.setString(17, "");
		cstmt.executeUpdate();
			
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while inserting the registration details using method insertEmployeeDetails in employeebootstrap class :: "+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while inserting the registration details using method insertEmployeeDetails in employeebootstrap class :: "+ec.getMessage());
			}
		}
		return message;
	}
	
	public List<employee> getEmployeeDetails() 
	{
		List<employee> lstemployee= new ArrayList<employee>();
		Connection Con = null;
		CallableStatement cstmt;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try 
		{
			Con= returnconnection();
			cstmt = Con.prepareCall("{call usb_manage_employee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cstmt.setInt(1,0);	
			cstmt.setString(2, "");
			cstmt.setString(3, "");
			cstmt.setString(4, "");
			cstmt.setInt(5, 0);
			cstmt.setString(6, "");
			cstmt.setString(7, "");
			cstmt.setLong(8, 0);
			cstmt.setString(9, "");
			cstmt.setString(10, "");
			cstmt.setInt(11, 0);
			cstmt.setString(12,"");
			cstmt.setString(13,"");
			cstmt.setString(14,"GET");
			cstmt.setString(15, "");
			cstmt.setString(16, "");
			cstmt.setString(17, "");
			rs=cstmt.executeQuery();
			while(rs.next())
			{
				employee obj= new employee();
				
				obj.setEmployeeId(rs.getInt("employee_id"));
				obj.setFirstName(validateNull(rs.getString("first_name")).trim());
				obj.setLastName(validateNull(rs.getString("last_name")).trim());
				obj.setBirthDate(validateNull(rs.getString("date_of_birth")).trim());
				obj.setGenderVal(rs.getString("gender"));
				obj.setCountry(validateNull(rs.getString("country")).trim());
				obj.setEmail(validateNull(rs.getString("email")).trim());
				obj.setPhoneNumber(rs.getLong("phone_number"));
				obj.setPassword(validateNull(rs.getString("password")).trim());
				obj.setConfirmPassword(validateNull(rs.getString("confirm_password")).trim());
				
				lstemployee.add(obj);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while selecting the registration details using method getEmployeeDetails in employeebootstrap class :: "+ e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while selecting the registration details using method getEmployeeDetails in employeebootstrap class :: "+ ec.getMessage());
			}
		}
		return lstemployee;
	}
	public List<employee> editEmployeeDetails(int employeeId)
	{
		List<employee> lstEditEmployee= new ArrayList<employee>();
		Connection Con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try 
		{
			Con= returnconnection();
			pst= Con.prepareStatement("select employee_id,ltrim(rtrim(isnull(first_name,''))) as first_name, ltrim(rtrim(isnull(last_name,''))) as last_name, isnull(date_of_birth,'') as date_of_birth, isnull(gender,0) as gender, ltrim(rtrim(isnull(country,''))) as country, ltrim(rtrim(isnull(email,''))) as email, isnull(phone_number,0) as phone_number, ltrim(rtrim(isnull(password,''))) as password, ltrim(rtrim(isnull(confirm_password,''))) as confirm_password, isnull(agree_terms_condition,0) as agree_terms_condition from mst_employee_activity where employee_id=?");
			pst.setInt(1, employeeId);
			rs= pst.executeQuery();
			if(rs.next())
			{
				employee obj= new employee();
				
				obj.setEmployeeId(rs.getInt("employee_id"));
				obj.setFirstName(validateNull(rs.getString("first_name")).trim());
				obj.setLastName(validateNull(rs.getString("last_name")).trim());
				obj.setBirthDate(validateNull(rs.getString("date_of_birth")).trim());
				obj.setGender(rs.getInt("gender"));
				obj.setCountry(validateNull(rs.getString("country")).trim());
				obj.setEmail(validateNull(rs.getString("email")).trim());
				obj.setPhoneNumber(rs.getLong("phone_number"));
				obj.setPassword(validateNull(rs.getString("password")).trim());
				obj.setConfirmPassword(validateNull(rs.getString("confirm_password")).trim());
				obj.setAgreeTermsCondition(rs.getInt("agree_terms_condition"));
				lstEditEmployee.add(obj);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while editing the registration details using method editEmployeeDetails in employeebootstrap class :: "+ e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while editing the registration details using method editEmployeeDetails in employeebootstrap class :: "+ ec.getMessage());
			}
		}
		return lstEditEmployee;
	}
	
	public String deleteEmployeeDetails(int employeeId)
	{
		Connection Con = null;
		//PreparedStatement pst = null;
		CallableStatement cstmt;
		//ResultSet rs = null;
		String message= "";
		try 
		{
			Con= returnconnection();
			cstmt = Con.prepareCall("{call [dbo].[usb_manage_employee](?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cstmt.setInt(1, employeeId);
			cstmt.setString(2, "");
			cstmt.setString(3, "");
			cstmt.setString(4, "");
			cstmt.setInt(5, 0);
			cstmt.setString(6, "");
			cstmt.setString(7, "");
			cstmt.setLong(8, 0);
			cstmt.setString(9, "");
			cstmt.setString(10, "");
			cstmt.setInt(11, 0);
			cstmt.setString(12, "");
			cstmt.setString(13, "SANTHOSH");
			cstmt.setString(14, "DELETE");
			cstmt.setString(15, "");
			cstmt.setString(16, "");
			cstmt.setString(17, "");
			cstmt.executeUpdate();
			message= "Employee details deleted sucessfully";
			
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while deleting the registration details using method deleteEmployeeDetails in employeebootstrap class :: "+ e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while closing the connection when deleting the registration details using method deleteEmployeeDetails in employeebootstrap class :: "+ec.getMessage());
			}
		}
		return message;
	}	
	
	public String updateEmployeeDetails()
	{
		Connection Con= null;
		//PreparedStatement pst= null;
		String message= "";
		String action="";
		CallableStatement cstmt;
		try 
		{
			Con= returnconnection();
			action="Employee" + getFirstName() + " " + getLastName()+ "Created Sucessfully";
			cstmt = Con.prepareCall("{call usb_manage_employee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cstmt.setInt(1, getEmployeeId());
			cstmt.setString(2, validateNull(getFirstName()).trim());
			cstmt.setString(3, validateNull(getLastName()).trim());
			cstmt.setString(4, validateNull(getBirthDate()).trim());
			cstmt.setInt(5, getGender());
			cstmt.setString(6, validateNull(getCountry()).trim());
			cstmt.setString(7, validateNull(getEmail()).trim());
			cstmt.setLong(8, getPhoneNumber());
			cstmt.setString(9, validateNull(getPassword()).trim());
			cstmt.setString(10, validateNull(getConfirmPassword()).trim());
			cstmt.setInt(11, getAgreeTermsCondition());
			cstmt.setString(12, action);
			cstmt.setString(13, "SANTHOSH");
			cstmt.setString(14, "UPDATE");
			cstmt.setString(15, "");
			cstmt.setString(16, "");
			cstmt.setString(17, "");
			cstmt.executeUpdate();
			message="Updated Successfully";
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while updating the registration details using method updateEmployeeDetails in employeebootstrap class :: "+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while updating the registration details using method updateEmployeeDetails in employeebootstrap class :: "+ec.getMessage());
			}
		}
		return message;
	}
	
	
	public List<employee> getEmployeeLogDetails(int employeeId) {
		List<employee> lstEmployeeLog= new ArrayList<employee>();
		Connection Con = null;
		CallableStatement cstmt;
		//PreparedStatement pst = null;
		ResultSet rs = null;
		
		try 
		{
			Con= returnconnection();
			cstmt = Con.prepareCall("{call [dbo].[usb_manage_employee](?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cstmt.setInt(1, employeeId);
			cstmt.setString(2, "");
			cstmt.setString(3, "");
			cstmt.setString(4, "");
			cstmt.setInt(5, 0);
			cstmt.setString(6, "");
			cstmt.setString(7, "");
			cstmt.setLong(8, 0);
			cstmt.setString(9, "");
			cstmt.setString(10, "");
			cstmt.setInt(11, 0);
			cstmt.setString(12, "");
			cstmt.setString(13, "");
			cstmt.setString(14, "LOG");
			cstmt.setString(15, "");
			cstmt.setString(16, "");
			cstmt.setString(17, "");
			rs= cstmt.executeQuery();
			while(rs.next())
			{
				employee obj= new employee();
				
				obj.setLogAction(validateNull(rs.getString("action")).trim());
				obj.setLogActionBy(validateNull(rs.getString("action_by")).trim());
				obj.setLogDate(validateNull(rs.getString("log_date")).trim());
				
				lstEmployeeLog.add(obj);
			}
			
			
			
		}
		catch (Exception e) 
		{
			System.out.println("Exception while selecting the registration details using method getEmployeeLogDetails in employeebootstrap class :: "+ e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			}
			catch (Exception ec) 
			{
				System.out.println("Exception while selecting the registration details using method getEmployeeLogDetails in employeebootstrap class :: "+ ec.getMessage());
			}
		}
		return lstEmployeeLog;
	}
	
	

public String dateConversion(String date) throws ParseException {
		
		SimpleDateFormat inputFormat=new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat outputFormat=new SimpleDateFormat("mm/dd/yyyy");
		
		try {
			date=outputFormat.format(inputFormat.parse(date));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return date;
	}
public List<employee> searchEmployeeDetails() 
{
	List<employee> lstemployeesearch= new ArrayList<employee>();
	CallableStatement cstmt;
	Connection Con = null;
	//PreparedStatement pst = null;
	ResultSet rs = null;
	String searchValue="";
	String searchToDate="";
	String searchAction="";
	try 
	{
		Con= returnconnection();
		if(getSearchFirstName()!=null&&!getSearchFirstName().equals("")) {
			searchValue="%"+getSearchFirstName()+"%";
			searchAction="FIRSTNAME";
		}
		else if(getSearchLastName()!=null&&!getSearchLastName().equals("")) {
			searchValue="%"+getSearchLastName()+"%";
			searchAction="LASTNAME";
		}
		else if(getSearchGender()!=0) {
			searchValue=Integer.toString(getSearchGender());
			searchAction="GENDER";
		}
		else{
			searchValue=getFromBirthDate();
			searchToDate=getToBirthDate();
			searchAction="DATEOFBIRTH";
		}
		cstmt = Con.prepareCall("{call usb_manage_employee (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		cstmt.setInt(1, 0);
		cstmt.setString(2, "");
		cstmt.setString(3, "");
		cstmt.setString(4, "");
		cstmt.setInt(5, 0);
		cstmt.setString(6, "");
		cstmt.setString(7, "");
		cstmt.setLong(8, 0);
		cstmt.setString(9, "");
		cstmt.setString(10, "");
		cstmt.setInt(11, 0);
		cstmt.setString(12, "");
		cstmt.setString(13, "");
		cstmt.setString(14, "SEARCH");
		cstmt.setString(15, searchValue);
		cstmt.setString(16, searchToDate);
		cstmt.setString(17, searchAction);
		rs= cstmt.executeQuery();
		while(rs.next())
		{
			employee obj= new employee();
			
			obj.setEmployeeId(rs.getInt("employee_id"));
			obj.setFirstName(validateNull(rs.getString("first_name")).trim());
			obj.setLastName(validateNull(rs.getString("last_name")).trim());
			obj.setBirthDate(validateNull(rs.getString("date_of_birth")).trim());
			obj.setGenderVal(rs.getString("gender"));
			obj.setCountry(validateNull(rs.getString("country")).trim());
			obj.setEmail(validateNull(rs.getString("email")).trim());
			obj.setPhoneNumber(rs.getLong("phone_number"));
			obj.setPassword(validateNull(rs.getString("password")).trim());
			obj.setConfirmPassword(validateNull(rs.getString("confirm_password")).trim());
			
			lstemployeesearch.add(obj);
		}
	}
	catch (Exception e) 
	{
		System.out.println("Exception while selecting the registration details using method searchEmployeeDetails in employeebootstrap class :: "+ e.getMessage());
	}
	finally 
	{
		try 
		{
			if(Con!=null)Con.close();
		} 
		catch (Exception ec) 
		{
			System.out.println("Exception while selecting the registration details using method searchEmployeeDetails in employeebootstrap class :: "+ ec.getMessage());
		}
	}
	return lstemployeesearch;
}
	//*********************************VALIDATE NULL***********************************************//
	private String validateNull(String str) {
		if(str==null)
		{
			str= "";
		}
		return str;
	}
	//*********************************GETTER & SETTER***********************************************//
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public int getAgreeTermsCondition() {
		return agreeTermsCondition;
	}
	public void setAgreeTermsCondition(int agreeTermsCondition) {
		this.agreeTermsCondition = agreeTermsCondition;
	}
	public String getGenderVal() {
		return genderVal;
	}
	public void setGenderVal(String genderVal) {
		this.genderVal = genderVal;
	}
	public String getSearchFirstName() {
		return SearchFirstName;
	}
	public void setSearchFirstName(String searchFirstName) {
		SearchFirstName = searchFirstName;
	}
	public String getSearchLastName() {
		return SearchLastName;
	}
	public void setSearchLastName(String searchLastName) {
		SearchLastName = searchLastName;
	}
	public int getSearchGender() {
		return SearchGender;
	}
	public void setSearchGender(int searchGender) {
		SearchGender = searchGender;
	}
	public String getFromBirthDate() {
		return FromBirthDate;
	}
	public void setFromBirthDate(String fromBirthDate) {
		FromBirthDate = fromBirthDate;
	}
	public String getToBirthDate() {
		return ToBirthDate;
	}
	public void setToBirthDate(String toBirthDate) {
		ToBirthDate = toBirthDate;
	}
}





