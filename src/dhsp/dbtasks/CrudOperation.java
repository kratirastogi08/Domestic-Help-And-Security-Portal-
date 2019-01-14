package dhsp.dbtasks;
import java.sql.*;
public class CrudOperation
{
private static Connection cn;
private static PreparedStatement ps;
private static ResultSet rs;
public static ResultSet fetchData(String sql,int id)
{
	cn=createConnection();
	try
	{
		
		ps=cn.prepareStatement(sql);
		ps.setInt(1, id);
		rs=ps.executeQuery();
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	return rs;
	}

public static ResultSet fetchData(String sql,String id)//responsiple to fetch spcific data from table
{
	cn=createConnection();
	try
	{
		
		ps=cn.prepareStatement(sql);
		ps.setString(1, id);
		rs=ps.executeQuery();
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	return rs;
	}

public static ResultSet fetchData(String sql)//responsiple to fetch all data from table
{
	cn=createConnection();
	try
	{
		
		ps=cn.prepareStatement(sql);
		rs=ps.executeQuery();
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	return rs;
	}

public static Connection createConnection()
{
try
{
	Class.forName("com.mysql.jdbc.Driver");//factory method used to create object of the class
	cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dhsp","root","root");
}							//subprotocol ipaddress of machine port no userid  password
                             //connection url or connection string
catch(SQLException|ClassNotFoundException cse)//checked exception it will appear when class name is wrong
{
System.out.println(cse);	
}
return cn;
}
}
