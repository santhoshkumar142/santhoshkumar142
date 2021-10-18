package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	String strDriver;
	String strUrl;
	String strUsr;
	String strPwd;
	public Connection con;
	
	public DBConnection()throws DBException
	{
		strDriver="net.sourceforge.jtds.jdbc.Driver";
		strUrl= "jdbc:jtds:sqlserver://DESKTOP-0Q4T6MK/sachina";
		strUsr= "sa";
		strPwd= "@Sandy14299";
	}
	public Connection initconnection()throws SQLException,Exception
	 {
		try
		{
			Class.forName(strDriver).newInstance();
			con=DriverManager.getConnection(strUrl,strUsr,strPwd);
			return con;
		}
	
		catch(SQLException sqlexp)
		{
			throw new DBException(sqlexp.getMessage());
		}
	
		catch(Exception exp)
		{
			throw new DBException(exp.getMessage());
		}
	 }
}
