package com.DB;

public class DBException extends Exception implements java.io.Serializable {
	DBException()
	{
	}
	 
	public DBException(String s)
	{
		super(s);
	}
	public String getMessage()
	{
		return super.getMessage();
	}
}
