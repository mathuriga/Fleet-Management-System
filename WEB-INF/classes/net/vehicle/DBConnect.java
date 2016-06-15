package net.vehicle;

import java.sql.*;
import java.io.IOException;
import java.util.*;

public class DBConnect {

	public static Connection prepareConn()   {
		//System.out.println ("In prepareConn().....");
		Connection con=null;
		try {
    		Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vdb","root","123");
		}
		catch (Exception ex) {
			System.out.println ("Exception in preapreConn()..."+ex);
		}
		return con;	
	}//prepareConn

	public static void closeConn(Connection con) throws SQLException,IOException {
		//System.out.println ("In closeConn().....");
		if(con!=null)
			con.close();
	}//closeConn
	
	public static int updateQuery(String sql)  {
		int update=0;
		try{
			Connection con=prepareConn();
			Statement stmt=con.createStatement();
			update=stmt.executeUpdate(sql);
			closeConn(con);				
		}catch(Exception e){
			System.out.println ("Exception in updateQuery()..."+e);
		}
		return update;
		}//updateQuery	
	

	
	//-----------------------------------------------------------------------------
	public static ArrayList doUserLogin(String sql)  {
		ResultSet rs=null;
		ArrayList one=new ArrayList();
		try {
				Connection con=prepareConn();
				Statement stmt=con.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next()){
					one.add(rs.getInt(1));
					one.add(rs.getString(2));
				}
				closeConn(con);    
			}
			catch (Exception ex) {
				System.out.println ("Exception in executeQuery()...."+ex);
			}
		return one;
	}
	
	
	//--------------------------------------------------------------------------
}//class