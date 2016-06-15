package net.vehicle;

import java.sql.*;
import java.util.*;
import static javax.management.Query.and;

public class VehicleCommon {
	
	public static ArrayList getDrivers() {
		Connection c=null;
		ArrayList al=new ArrayList();
		try {
    		String sql="SELECT DISTINCT(name) FROM driver ORDER BY name";
    		c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				al.add(rs.getString(1));
			}
			DBConnect.closeConn(c);		    		
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return al;
	}
	
	public static ArrayList getVehicles() {
		Connection c=null;
		ArrayList al=new ArrayList();
		try {
    		String sql="SELECT DISTINCT(v_no) FROM vmast ";
    		c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				al.add(rs.getString(1));
                                
			}
			DBConnect.closeConn(c);		    		
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return al;
	}
	
	//--------------------------------------------------------------------------
	
	public static ArrayList viewAllFuelDetails() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM fuel_details ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getInt(7)+"");
				one.add(rs.getInt(1)+"");
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails 
	//--------------------------------------------------------------------------
	
        
        public static ArrayList getfurlreport() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql=" select f_type,sum(qty),sum(cost) from fuel_details group by f_type order by f_type";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
                                one.add(rs.getInt(3));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}
        
        
        
	public static ArrayList viewAllOilChanges() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM oil_detail ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getInt(5)+"");
				one.add(rs.getString(6));
				one.add(rs.getString(7));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	//--------------------------------------------------------------------------
	public static ArrayList viewAllRepair() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM repair ORDER BY v_name";
                    //String sql="select vmast.v_no,vmast.v_name,vmast.v_type,repair.g_name,repair.cost from repair left join vmast on repair.v_name=vmast.v_no";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getInt(7)+"");
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}
        
        public static ArrayList viewRepairByType(String type) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
                    System.out.println("error 1");
			String sql="select vmast.v_no,vmast.v_name,vmast.v_type,repair.g_name,repair.cost from repair,vmast where repair.v_name=vmast.v_no and vmast.v_type='"+type+"' ORDER BY v_name";
			System.out.println("error 2");
                        c = DBConnect.prepareConn();
    		System.out.println("error 3");
                        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
System.out.println("error 5");
				//one.add(rs.getString(12));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
        }
        
        
        
        public static ArrayList getmaxrepairno() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
                    System.out.println("error 1");
			String sql="select vmast.v_type,count(*) as noofrepairs,avg(repair.cost) as average from repair,vmast where repair.v_name=vmast.v_no group by v_type order by noofrepairs DESC";
			System.out.println("error 2");
                        c = DBConnect.prepareConn();
    		System.out.println("error 3");
                        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getInt(3));
				
System.out.println("error 5");
				//one.add(rs.getString(12));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
        }




//viewAllFuelDetails
	//---------------------------------------------------------------------------------
	public static ArrayList viewAllDrivers() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM driver ORDER BY name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1));
				one.add(rs.getString(2));
				one.add(rs.getString(6));
				one.add(rs.getString(8));
				one.add(rs.getString(9));
				one.add(rs.getString(10));
				one.add(rs.getInt(11));
                                one.add(rs.getString(13));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
        
        
        //________________________________________________________________________________________
        
        public static ArrayList getavaiAllDrivers() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="select id,name,mob,mail,note,availability from driver where availability='Available' group by name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
        
        
        
        
        
        //___________________________________________________________________________________________
	
	//---------------------------------------------------------------------------------
	public static ArrayList viewAllVehicles() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getDouble(6));
				one.add(rs.getString(7));
				one.add(rs.getInt(8));
				one.add(rs.getString(9));
				one.add(rs.getString(10));
				one.add(rs.getString(11));
				one.add(rs.getString(12));
				one.add(rs.getString(15));
                                one.add(rs.getString(16));
				//one.add(rs.getString(12));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails

	//---------------------------------------------------------------------------------
	public static ArrayList viewVehiclesByType(String type) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast WHERE v_type='"+type+"' ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getDouble(6)+"");
				one.add(rs.getString(7));
				one.add(rs.getInt(8));
				one.add(rs.getString(9));
				one.add(rs.getString(10));
				one.add(rs.getString(11));
				one.add(rs.getString(12));
				one.add(rs.getString(15));
				//one.add(rs.getString(12));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	//-------------------------------------
	public static ArrayList viewVehiclesByID(int id) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast WHERE id="+id;//+"' ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getDouble(6));
				one.add(rs.getString(7));
				one.add(rs.getInt(8));
				one.add(rs.getString(9));
				one.add(rs.getString(10));
				one.add(rs.getString(11));
				one.add(rs.getString(12));
				one.add(rs.getString(15));
				//one.add(rs.getString(12));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	
	//--------------------------------------
	public static ArrayList viewBookingByID(int id) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM bookings WHERE uid="+id+" ORDER BY status";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getString(7));
				one.add(rs.getString(9));
				one.add(rs.getString(11));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	//--------------------------------
	public static ArrayList viewAllBooking() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM bookings WHERE status = 'Pending'";//
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
                                one.add(rs.getString(2));
                                one.add(rs.getString(3));
                                one.add(rs.getString(4));
                                one.add(rs.getString(5));
                                one.add(rs.getString(6));
                                one.add(rs.getString(7));
                                
                                
				one.add(rs.getString(8));
				one.add(rs.getString(9));
				one.add(rs.getString(10));
				one.add(rs.getString(11));
				one.add(rs.getString(12));
				
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	//-------------------------------------
        public static ArrayList viewcheckdetailsbyvec() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			//String sql="SELECT * FROM vmast ORDER BY v_name";
                    String sql="SELECT vmast.v_no,vmast.v_name,availability, repair.date,note FROM vmast,repair WHERE vmast.v_no= repair.v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}
        /**
       public static ArrayList viewcheckdetailsbyvecno(int vno) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			//String sql="SELECT * FROM vmast LEFT JOIN repair WHERE v_no="+vno+"";
                        String sql="SELECT vmast.v_no,vmast.v_name,availability, repair.date,note FROM vmast,repair WHERE vmast.v_no="+vno+" and repair.v_name="+vno+"";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}
        **/
        
        //_________________________________________________________________________________
        //Functions for report generation
        public static ArrayList getNoofVehicle() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			
                        String sql= "SELECT COUNT(*) as NoOfVehicle FROM vmast";
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
                        while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(0));
				 
				all.add(one);
			}
                        System.out.println("ok");
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}
        
        
        
        
        
        
        
        //_----------------------------------------------------------------------------
        
	public static ArrayList viewUserDetails(int id) {
		ArrayList one=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM users WHERE id="+id;//+"' ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getString(7));
				one.add(rs.getString(8));
				
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return one;
	}//viewAllFuelDetails
}