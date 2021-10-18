package com.process;

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
import com.model.covid;

public class covidregistration {
	
	public int registrationId;
	public String firstName;
	public String lastName;
	public String aadhar;
	public String birthDate;
	public int gender;
	public String email;
	public long phoneNumber;
	public String address1;
	public String address2;
	public String city;
	public String state;
	public int zipcode;
	public String insuranceCompany;
	public String insuranceId;

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
	
	public boolean validateAadharNum(String aadhar) {
		Connection Con= null;
		PreparedStatement pst= null;
		boolean saveExist=false;
		ResultSet rs=null;
		int value=0;
		try {
			Con= returnconnection();
			pst=Con.prepareStatement("select count(*)as save_exist from mst_covid_registration where aadhar_number= ?");
			pst.setString(1,validateNull(aadhar.trim()));
			rs= pst.executeQuery();
			if(rs.next()) {
			value=rs.getInt("save_exist");
			}
			if(value>0) {
				saveExist=true;
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exception while inserting the registration details using method validateAadharNum in vaccineregistration class :: "+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while inserting the registration details using method validateAadharNum in vaccineregistration class :: "+ec.getMessage());
			}
		}
		return saveExist;
	}
	
	public boolean validateAadharNumEdit(String aadhar,int registrationId) {
		Connection Con= null;
		PreparedStatement pst= null;
		boolean saveExist=false;
		ResultSet rs=null;
		int value=0;
		try {
			Con= returnconnection();
			pst=Con.prepareStatement("select count(*) as save_exist from mst_covid_registration where aadhar_number= ? and registration_id <> ?");
			pst.setString(1,validateNull(aadhar.trim()));
			pst.setInt(2,registrationId);
			rs= pst.executeQuery();
			if(rs.next()) {
			value=rs.getInt("save_exist");
			}
			if(value>0) {
				saveExist=true;
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exception while inserting the registration details using method validateAadharNumEdit in vaccineregistration class :: "+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while inserting the registration details using method validateAadharNumEdit in vaccineregistration class :: "+ec.getMessage());
			}
		}
		return saveExist;
	}
	public String insertRegistationDetails()
	{
		Connection Con= null;
		PreparedStatement pst= null;
		String message= "";
		
		try 
		{
			Con= returnconnection();
			pst= Con.prepareStatement("insert into mst_covid_registration(first_name, last_name, aadhar_number, date_of_birth, gender, email, phone_number, street_address_1, street_address_2, city, state, zipcode, insurance_company, insurance_id, created_date, last_edited_date) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, getdate(), '')");
		
			pst.setString(1, validateNull(getFirstName()).trim());
			pst.setString(2, validateNull(getLastName()).trim());
			pst.setString(3, validateNull(getAadhar()).trim());
			pst.setString(4, validateNull(getBirthDate()).trim());
			pst.setInt(5, getGender());
			pst.setString(6, validateNull(getEmail()).trim());
			pst.setLong(7, getPhoneNumber());
			pst.setString(8, validateNull(getAddress1()).trim());
			pst.setString(9, validateNull(getAddress2()).trim());
			pst.setString(10, validateNull(getCity()).trim());
			pst.setString(11, validateNull(getState()).trim());
			pst.setInt(12, getZipcode());
			pst.setString(13, validateNull(getInsuranceCompany()).trim());
			pst.setString(14, validateNull(getInsuranceId()).trim());
			pst.executeUpdate();
			
			message="Registered Successfully";
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while inserting the registration details using method insertRegistationDetails in vaccineregistration class :: "+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while inserting the registration details using method insertRegistationDetails in vaccineregistration class :: "+ec.getMessage());
			}
		}
		return message;
	}
	public List<covid> getRegistationDetails() 
	{
		List<covid> lstCovid= new ArrayList<covid>();
		Connection Con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try 
		{
			Con= returnconnection();
			pst= Con.prepareStatement("select registration_id, isnull(first_name,'') as first_name, isnull(last_name,'') as last_name, isnull(aadhar_number,'') as aadhar_number, isnull(date_of_birth,'') as date_of_birth, case when gender=1 then 'Male' else 'Female' end as gender, isnull(email,'') as email, phone_number as phone_number, isnull(street_address_1,'') as street_address_1, isnull(street_address_2,'') as street_address_2, isnull(city,'') as city, isnull(state,'') as state, zipcode as zipcode, isnull(insurance_company,'') as insurance_company, isnull(insurance_id,'') as insurance_id, created_date as created_date, last_edited_date as last_edited_date from mst_covid_registration order by registration_id");
			rs= pst.executeQuery();
			while(rs.next())
			{
				covid obj= new covid();
				
				obj.setRegistrationId(rs.getInt("registration_id"));
				obj.setFirstName(validateNull(rs.getString("first_name")).trim());
				obj.setLastName(validateNull(rs.getString("last_name")).trim());
				obj.setAadhar(validateNull(rs.getString("aadhar_number")).trim());
				obj.setBirthDate(validateNull(rs.getString("date_of_birth")).trim());
				obj.setGenderVal(validateNull(rs.getString("gender")).trim());
				obj.setEmail(validateNull(rs.getString("email")).trim());
				obj.setPhoneNumber(rs.getLong("phone_number"));
				obj.setAddress1(validateNull(rs.getString("street_address_1")).trim());
				obj.setAddress2(validateNull(rs.getString("street_address_2")).trim());
				obj.setCity(validateNull(rs.getString("city")).trim());
				obj.setState(validateNull(rs.getString("state")).trim());
				obj.setZipcode(rs.getInt("zipcode"));
				obj.setInsuranceCompany(validateNull(rs.getString("insurance_company")).trim());
				obj.setInsuranceId(validateNull(rs.getString("insurance_id")).trim());
				//vect.add(validateNull(rs.getString("created_date")).trim());
				//vect.add(validateNull(rs.getString("last_edited_date")).trim());
				
				lstCovid.add(obj);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while selecting the registration details using method getRegistationDetails in vaccineregistration class :: "+ e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while selecting the registration details using method getRegistationDetails in vaccineregistration class :: "+ ec.getMessage());
			}
		}
		return lstCovid;
	}
	public List<covid> editRegistationDetails(int registrationId)
	{
		List<covid> lstEditCovid= new ArrayList<covid>();
		Connection Con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try 
		{
			Con= returnconnection();
			pst= Con.prepareStatement("select registration_id, isnull(first_name,'') as first_name, isnull(last_name,'') as last_name, isnull(aadhar_number,'') as aadhar_number, isnull(date_of_birth,'') as date_of_birth, isnull(gender,0) as gender, isnull(email,'') as email, isnull(phone_number,0) as phone_number, isnull(street_address_1,'') as street_address_1, isnull(street_address_2,'') as street_address_2, isnull(city,'') as city, isnull(state,'') as state, isnull(zipcode,0) as zipcode, isnull(insurance_company,'') as insurance_company, isnull(insurance_id,'') as insurance_id, created_date as created_date, last_edited_date as last_edited_date from mst_covid_registration where registration_id= ?");
			pst.setInt(1, registrationId);
			rs= pst.executeQuery();
			if(rs.next())
			{
				covid obj= new covid();
				
				obj.setRegistrationId(rs.getInt("registration_id"));
				obj.setFirstName(validateNull(rs.getString("first_name")).trim());
				obj.setLastName(validateNull(rs.getString("last_name")).trim());
				obj.setAadhar(validateNull(rs.getString("aadhar_number")).trim());
				obj.setBirthDate(validateNull(rs.getString("date_of_birth")).trim());
				obj.setGender(rs.getInt("gender"));
				obj.setEmail(validateNull(rs.getString("email")).trim());
				obj.setPhoneNumber(rs.getLong("phone_number"));
				obj.setAddress1(validateNull(rs.getString("street_address_1")).trim());
				obj.setAddress2(validateNull(rs.getString("street_address_2")).trim());
				obj.setCity(validateNull(rs.getString("city")).trim());
				obj.setState(validateNull(rs.getString("state")).trim());
				obj.setZipcode(rs.getInt("zipcode"));
				obj.setInsuranceCompany(validateNull(rs.getString("insurance_company")).trim());
				obj.setInsuranceId(validateNull(rs.getString("insurance_id")).trim());
				
				lstEditCovid.add(obj);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while editing the registration details using method editRegistationDetails in vaccineregistration class :: "+ e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while editing the registration details using method editRegistationDetails in vaccineregistration class :: "+ ec.getMessage());
			}
		}
		return lstEditCovid;
	}
	public String deleteRegistrationDetails(String registrationId)
	{
		Connection Con = null;
		PreparedStatement pst = null;
		String message= "";
		try 
		{
			Con= returnconnection();
			pst= Con.prepareStatement("delete from mst_covid_registration where registration_id=?");
			pst.setInt(1, Integer.parseInt(registrationId));
			pst.executeUpdate();
			message= "Registration details deleted sucessfully";
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while deleting the registration details using method deleteRegistrationDetails in vaccineregistration class :: "+ e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while closing the connection when deleting the registration details using method deleteRegistrationDetails in vaccineregistration class :: "+ec.getMessage());
			}
		}
		return message;
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
	public String updateRegistationDetails()
	{
		Connection Con= null;
		PreparedStatement pst= null;
		String message= "";
		
		try 
		{
			Con= returnconnection();
			pst= Con.prepareStatement("update mst_covid_registration set first_name= ?, last_name= ?, aadhar_number= ?, date_of_birth= ?, gender= ?, email= ?, phone_number= ?, street_address_1= ?, street_address_2= ?, city= ?, state= ?, zipcode= ?, insurance_company= ?, insurance_id= ? where registration_id= ?");
		
			pst.setString(1, validateNull(getFirstName()).trim());
			pst.setString(2, validateNull(getLastName()).trim());
			pst.setString(3, validateNull(getAadhar()).trim());
			pst.setString(4, validateNull(getBirthDate()).trim());
			pst.setInt(5, getGender());
			pst.setString(6, validateNull(getEmail()).trim());
			pst.setLong(7, getPhoneNumber());
			pst.setString(8, validateNull(getAddress1()).trim());
			pst.setString(9, validateNull(getAddress2()).trim());
			pst.setString(10, validateNull(getCity()).trim());
			pst.setString(11, validateNull(getState()).trim());
			pst.setInt(12, getZipcode());
			pst.setString(13, validateNull(getInsuranceCompany()).trim());
			pst.setString(14, validateNull(getInsuranceId()).trim());
			pst.setInt(15, getRegistrationId());
			pst.executeUpdate();
			
			message="Updated Successfully";
		} 
		catch (Exception e) 
		{
			System.out.println("Exception while updating the registration details using method updateRegistationDetails in vaccineregistration class :: "+e.getMessage());
		}
		finally 
		{
			try 
			{
				if(Con!=null)Con.close();
			} 
			catch (Exception ec) 
			{
				System.out.println("Exception while updating the registration details using method updateRegistationDetails in vaccineregistration class :: "+ec.getMessage());
			}
		}
		return message;
	}
	
//*********************************VALIDATE NULL*****************************************//
	
	private String validateNull(String str) {
		if(str==null)
		{
			str= "";
		}
		return str;
	}
//*********************************GETTER***********************************************//

	public int getRegistrationId() {
		return registrationId;
	}

	public void setRegistrationId(int registrationId) {
		this.registrationId = registrationId;
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

	public String getAadhar() {
		return aadhar;
	}

	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
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

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getInsuranceCompany() {
		return insuranceCompany;
	}

	public void setInsuranceCompany(String insuranceCompany) {
		this.insuranceCompany = insuranceCompany;
	}

	public String getInsuranceId() {
		return insuranceId;
	}

	public void setInsuranceId(String insuranceId) {
		this.insuranceId = insuranceId;
	}
	
}