package net.vehicle;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javazoom.upload.*;
import java.util.Hashtable;
import java.sql.*;

public class VehicleServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req,HttpServletResponse res) 
			throws ServletException,IOException {
		process(req,res);			
	}//doGet
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) 
			throws ServletException,IOException {
		process(req,res);			
	}//doGet
	
	public void process(HttpServletRequest req,HttpServletResponse res) 
			throws ServletException,IOException {
		
		String mod = req.getParameter("MOD");
		String act = req.getParameter("ACT");
		
		HttpSession session = req.getSession();
		if(mod.equals("MTN")){
			
			if(act.equals("VclAdd")){
				session.setAttribute("content_page","addVehicle.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("logOut")){
				session.setAttribute("content_page","ucontent.jsp");
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("ViewVcl")){
				session.setAttribute("content_page","viewAllVehicles.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("DvrAdd")){
				session.setAttribute("content_page","addDriver.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("ViewDvr")){
				session.setAttribute("content_page","viewAllDrivers.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("FuelAdd")){
				session.setAttribute("content_page","addFuel.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("ViewFuel")){
				session.setAttribute("content_page","viewFuelExpences.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("OilAdd")){
				session.setAttribute("content_page","oilChangeDetail.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("ViewOil")){
				session.setAttribute("content_page","viewOilChanges.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("RepairAdd")){
				session.setAttribute("content_page","repairDetail.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("rDel")){ // rDel
				int rid = Integer.parseInt(req.getParameter("rid"));
				String sql = "DELETE FROM repair where id="+rid;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page","viewAllRepair.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("dDel")){ // rDel
				int did = Integer.parseInt(req.getParameter("did"));
				String sql = "DELETE FROM driver where id="+did;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page","viewAllDrivers.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("vDel")){ // rDel
				int vid = Integer.parseInt(req.getParameter("vid"));
				String sql = "DELETE FROM vmast where id="+vid;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page","viewAllVehicles.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("oDel")){ // rDel
				int oid = Integer.parseInt(req.getParameter("oid"));
				String sql = "DELETE FROM oil_detail where id="+oid;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page","viewOilChanges.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("fDel")){ // rDel
				int fid = Integer.parseInt(req.getParameter("fid"));
				String sql = "DELETE FROM fuel_details where fid="+fid;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page","viewFuelExpences.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("ViewRepair")){
				session.setAttribute("content_page","viewAllRepair.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("editVehicle")){
				int vId = Integer.parseInt(req.getParameter("vId"));
				session.setAttribute("vid",vId+"");
				session.setAttribute("content_page","editVehicle.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("ViewBook")){
				session.setAttribute("content_page","viewAllbooking.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("Admin")){
				session.setAttribute("content_page","content.jsp");
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("bookAction")){
				int bid = Integer.parseInt(req.getParameter("bid"));
                                
                                String vno = req.getParameter("v_no");
				String stat = req.getParameter("action");
                                String drivername = req.getParameter("driver");
				String sql = "UPDATE bookings SET status = '"+stat+"'  WHERE bid = "+bid;
			//	System.out.println (sql);
				DBConnect.updateQuery(sql);
                                String sql1 = "UPDATE bookings SET d_name = '"+drivername+"'  WHERE bid = "+bid;
                                DBConnect.updateQuery(sql1);
                                String status="booked";
                                System.out.println("erroer a1");
                                String sql2 = "UPDATE vmast SET Availability = '"+status+"'  WHERE vmast.v_no ='"+vno+"' ";
                                System.out.println("erroer a2");
                                DBConnect.updateQuery(sql2);
                                String sql3 = "UPDATE driver SET Availability = '"+status+"'  WHERE driver.name ='"+drivername+"' ";
                                DBConnect.updateQuery(sql3);
                                System.out.println("erroer a3");
				session.setAttribute("content_page","viewAllbooking.jsp");
                                System.out.println("erroer a4");
				res.sendRedirect("template.jsp");
                                System.out.println("erroer a5");
			}
			else if(act.equals("AddDriver")){
		
				String FirstName = req.getParameter("FirstName");
				System.out.println ("FirstName : "+FirstName);
				String LastName = req.getParameter("LastName");
				String Address = req.getParameter("Address");
				String Image = "No";//req.getParameter("Image");
				String City = req.getParameter("City");
				String State = req.getParameter("State");
				String MobileNo = req.getParameter("MobileNo");
				String LicenseNo = req.getParameter("LicenseNo");
				String p1 = req.getParameter("Experiance");
				System.out.println ("P1 : "+p1);
				int Experiance = Integer.parseInt(p1);
				System.out.println (Experiance);
				String Note = req.getParameter("Note");
				String doe = req.getParameter("doe");
                                String Email=req.getParameter("Email");
				//String dImage = file;
				
			//	dImage = "drivers/"+dImage;
				String sql ="INSERT INTO driver (name, l_name, address, image, city, state, mob, lic_no, exp, experiance, note,mail)"+
							" VALUES('"+FirstName+"','"+LastName+"','"+Address+"','"+Image+"','"+City+"','"+State+"','"+MobileNo+"','"+LicenseNo+"','"+doe+"',"+Experiance+",'"+Note+"','"+Email+"')";
				System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if(update ==1){
					session.setAttribute("content_page","successDriver.jsp");
				}else {
					session.setAttribute("content_page","failDriver.jsp");
				}
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("AddFuel")){
				String VehicleName = req.getParameter("VehicleName");
				String DriverName = req.getParameter("DriverName");
				String fdate = req.getParameter("fdate");
				String ftype = req.getParameter("ftype");
				String Quantity = req.getParameter("Quantity");
				int Cost = Integer.parseInt(req.getParameter("Cost"));
				String Note = req.getParameter("Note");
				String sql ="INSERT INTO fuel_details (v_name, d_name, date, f_type, qty, cost, note) "+
							"VALUES('"+VehicleName+"','"+DriverName+"','"+fdate+"','"+ftype+"','"+Quantity+"',"+Cost+",'"+Note+"')";
				//System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if(update ==1){
					session.setAttribute("content_page","successFuel.jsp");
				}else {
					session.setAttribute("content_page","fail.jsp");
				}
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("AddOil")){
				String VehicleName = req.getParameter("VehicleName");
				String DriverName = req.getParameter("DriverName");
				String doe = req.getParameter("doe");
				String otype = req.getParameter("otype");
				String Odometer = req.getParameter("Odometer");
				int Cost = Integer.parseInt(req.getParameter("Cost"));
				String Note = req.getParameter("Note");
				String sql ="INSERT INTO oil_detail (v_name, d_name, date, cost, o_type, odometer, note) "+
							"VALUES('"+VehicleName+"','"+DriverName+"','"+doe+"',"+Cost+",'"+otype+"','"+Odometer+"','"+Note+"')";
			//	System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if(update ==1){
					session.setAttribute("content_page","successOil.jsp");
				}else {
					session.setAttribute("content_page","fail.jsp");
				}
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("AddRepair")){
				String VehicleNo = req.getParameter("VehicleNo");
				String DriverName = req.getParameter("DriverName");
				String doe = req.getParameter("doe");
				String GarageName = req.getParameter("GarageName");
				String Odometer = req.getParameter("Odometer");
				int Cost = Integer.parseInt(req.getParameter("Cost"));
				String Note = req.getParameter("Note");
				String sql ="INSERT INTO repair (v_name, g_name, d_name, date, odometer, cost, note) "+
							"VALUES('"+VehicleNo+"','"+GarageName+"','"+DriverName+"','"+doe+"','"+Odometer+"',"+Cost+",'"+Note+"')";
			//	System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if(update ==1){
					session.setAttribute("content_page","successRepair.jsp");
				}else {
					session.setAttribute("content_page","fail.jsp");
				}
				res.sendRedirect("template.jsp");
			}
			else if(act.equals("AddVehicle")){
				// add image code...
				MultipartFormDataRequest mreq =null;
				Hashtable ht=null;
				String file="";
				UploadFile uFile = null;
				try {
    				mreq = new MultipartFormDataRequest(req);
    				ht = mreq.getFiles();
    				uFile=(UploadFile)ht.get("Image");
    				UploadBean upBean=new UploadBean();
    				upBean.setFolderstore(req.getRealPath("cars"));
    				upBean.store(mreq,"Image");
    				file = uFile.getFileName();
    				System.out.println ("File : "+file);
				}
				catch (Exception ex) {
					System.out.println (ex);
				}
				
				String VehicleName = mreq.getParameter("VehicleName");
				String VehicleNo = mreq.getParameter("VehicleNo");
				String Make = mreq.getParameter("Make");
				String ftype = mreq.getParameter("ftype");
				double Rs = Double.parseDouble(mreq.getParameter("Rs"));
				String Average = mreq.getParameter("Average");
				int Cost = Integer.parseInt(mreq.getParameter("Cost"));
				String Image = mreq.getParameter("Image");
				String vtype = mreq.getParameter("vtype");
				String InsurerName = mreq.getParameter("InsurerName");
				String CompanyName = mreq.getParameter("CompanyName");
				String doi = mreq.getParameter("doi");
				String doe = mreq.getParameter("doe");
				String dname = mreq.getParameter("dname");
				String cImage = file;
				cImage = "cars/"+cImage;
				String sql ="INSERT INTO vmast (v_name, v_no, make, fuel_type, kmr, avg, cost, image, v_type, insurer, company, date, exp_date, driver_name)"+
							"VALUES('"+VehicleName+"','"+VehicleNo+"','"+Make+"','"+ftype+"',"+Rs+",'"+Average+"',"+Cost+",'"+cImage+"','"+vtype+"','"+InsurerName+"','"+CompanyName+"','"+doi+"','"+doe+"','"+dname+"')";
			//	System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if(update ==1){
					session.setAttribute("content_page","successVehicle.jsp");
				}else {
					session.setAttribute("content_page","fail.jsp");
				}
				res.sendRedirect("template.jsp");
			}
		}//if
		else if(mod.equals("BOK")){ //*******************************
			if(act.equals("View")){ // 
				session.setAttribute("content_page","view.jsp");
				session.setAttribute("view",req.getParameter("v"));
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("Home")){ // 
				session.setAttribute("content_page","ucontent.jsp");
				res.sendRedirect("index.jsp");
			}else if(act.equals("bok")){ //
				String vid = req.getParameter("vid");
				String uname = (String)session.getAttribute("u_name");
				if(uname != null){
					session.setAttribute("content_page","bokVehicle.jsp");
					session.setAttribute("vid",vid);	
				}else {
					session.setAttribute("content_page","uLogin.jsp");
				} 
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("Logout")){ // 
				session.removeAttribute("u_id");
				session.removeAttribute("u_name");
				session.setAttribute("content_page","ucontent.jsp");
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("Car")){ // 
				session.setAttribute("content_page","get-a-car-trip.jsp");
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("Reg")){ // 
				session.setAttribute("content_page","Register.jsp");
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("bokUser")){ //
				session.setAttribute("content_page","bokUser.jsp");
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("Login")){ // 
				session.setAttribute("content_page","uLogin.jsp");
				res.sendRedirect("index.jsp");
			}else if(act.equals("doBok")){ //
				int uid = Integer.parseInt((String)session.getAttribute("u_id"));
				String uname = (String)session.getAttribute("u_name");
				String vno = req.getParameter("v_no");
				
				String sdate = req.getParameter("sdate");
				String edate = req.getParameter("edate");
				int NoOfDays = Integer.parseInt(req.getParameter("NoOfDays"));
				String KiloMeters = req.getParameter("KiloMeters");
				int NoOfSeats = Integer.parseInt(req.getParameter("NoOfSeats"));
                                //String stime=req.getParameter("stime");
				String status = "Pending";
				String sql = "INSERT INTO bookings (uid, u_name, v_name, d_name, sdate, edate, nod, km, no_of_seats, status, b_date) "+
					" VALUES ("+uid+",'"+uname+"','"+vno+"','','"+sdate+"','"+edate+"',"+NoOfDays+",'"+KiloMeters+"',"+NoOfSeats+",'Pending',NOW())";
			//	System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if(update ==1){
					session.setAttribute("content_page","bokSuccess.jsp");
				}else {
					session.setAttribute("content_page","bokFail.jsp");
				}
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("uEdit")){
				session.setAttribute("content_page","uEdit.jsp");
				res.sendRedirect("index.jsp");
			}else if(act.equals("doEdit")){
				int uid = Integer.parseInt((String)session.getAttribute("u_id"));
				String uname = req.getParameter("Username");
				String upass = req.getParameter("Password");
				String add = req.getParameter("Address");
				String city = req.getParameter("City");
				String state = req.getParameter("State");
				String mob = req.getParameter("Mobile");
				String email = req.getParameter("Email");
				String sql ="UPDATE  users SET name='"+uname+"', pass='"+upass+"', add1='"+add+"', city='"+city+"', state='"+state+"', mobile='"+mob+"', email='"+email+"' WHERE id="+uid;
				System.out.println (sql);
				int up=DBConnect.updateQuery(sql);
				if(up ==1){
					session.setAttribute("content_page","uEditSuccess.jsp");
				}else {
					session.setAttribute("content_page","uEditFail.jsp");
				}
				res.sendRedirect("index.jsp");
			}
			else if(act.equals("doReg")){ // 
				String Username = req.getParameter("Username");
				String Password = req.getParameter("Password");
				String Address = req.getParameter("Address");
				String City = req.getParameter("City");
				String State = req.getParameter("State");
				String MobileNo = req.getParameter("MobileNo");
				String Email = req.getParameter("Email");
				String sql = "INSERT INTO users (name, pass, add1, city, state, mobile, email)"+
							 " VALUES ('"+Username+"','"+Password+"','"+Address+"','"+City+"','"+State+"','"+MobileNo+"','"+Email+"')";
				//System.out.println (sql);
				int i = DBConnect.updateQuery(sql);			 	
				if(i==1){
					session.setAttribute("content_page","regSuccess.jsp");
				}else {
					session.setAttribute("content_page","regFail.jsp");
				}
				res.sendRedirect("index.jsp");
			}else if(act.equals("doLog")){
				String Username = req.getParameter("Username");
				String Password = req.getParameter("Password");
				String sql="SELECT id, name FROM users WHERE name='"+Username+"' AND pass='"+Password+"'";
			//	System.out.println (sql);
				Connection c=null;
				try {
				c = DBConnect.prepareConn();
				Statement st = c.createStatement();
				ResultSet rs = st.executeQuery(sql);
				if(rs.next()==true){
					session.setAttribute("u_id",""+rs.getInt(1));
					session.setAttribute("u_name",rs.getString(2));
					session.setAttribute("content_page","ucontent.jsp");
					res.sendRedirect("index.jsp");
				}else {
					session.setAttribute("content_page","logFail.jsp");
					res.sendRedirect("index.jsp");
				}
				c.close();	    
				}
				catch (Exception ex) {
					System.out.println (ex);
				}			
			}//if
		}//else if			
	}//doGet
}//class








