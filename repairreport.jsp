<%-- 
    Document   : repairreport
    Created on : 14-Jun-2016, 20:10:49
    Author     : Mathu
--%>

 
<%@page import="net.vehicle.VehicleCommon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.html.HtmlWriter"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.*"%>;
<%@page import="java.awt.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
 
<%@page import="java.awt.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>


 <%
ArrayList all = VehicleCommon.viewAllRepair();
ArrayList Minivansrepair=VehicleCommon.viewRepairByType("Mini Vans & Large Coaches");
ArrayList luxuryrepair=VehicleCommon.viewVehiclesByType("Luxury Cars");
ArrayList Pickuprepair=VehicleCommon.viewVehiclesByType("Pick up");
ArrayList execarrepair=VehicleCommon.viewVehiclesByType("Executive Cars");
ArrayList ecocarrepair=VehicleCommon.viewVehiclesByType("Economy Cars");
ArrayList maxnorepair=VehicleCommon.getmaxrepairno();
int size = all.size();

%>

<%
String str="pdf";

    Document document=new Document();
    
    
    if(str.equals("pdf"))
    {
        response.setContentType("application/pdf");
        PdfWriter.getInstance(document,response.getOutputStream());
    }
      
    document.open();
    document.addTitle(" Summary Report of Repair Management devision ");
    document.addCreationDate();
    document.addHeader("Repair management Devision", "FMS");
       
    Chunk c;
    
    c = new Chunk("                                                                                                                                            \n\n");
    
    c.setUnderline(new Color(0x00, 0x00, 0xFF), 0.0f, 0.3f, 0.0f, 0.4f, PdfContentByte.LINE_CAP_ROUND);
    /* new paragraph instance initialized and add function write in pdf file*/
    document.add(c);
    document.add(new Paragraph("                                                                 REPORT\n\n"));
    //document.add(c);
    document.add(new Paragraph("                                      CREATED REPORT For FLeet Management System\n\n"));
    document.add(new Paragraph("                                                  Repair Management Devision\n\n"));
    //document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    document.add(c);
    document.add(new Paragraph("                                                         Overall Summary\n\n"));            
    
    document.add(new Paragraph("No of repairs reported :"+size+"\n\n"));
    document.add(new Paragraph("No Of repairs reported for Mini Vans & Large Coaches in Trasport Devision : "+Minivansrepair.size() +"\n\n"));
    document.add(new Paragraph("No of repairs reported for Luxury Cars in Trasport Devision :"+luxuryrepair.size()+"\n\n"));
    document.add(new Paragraph("No of repairs reported for Executive Cars in Trasport Devision :"+execarrepair.size()+"\n\n"));
    document.add(new Paragraph("No of repairs reported for Economic Cars in Trasport Devision:"+ecocarrepair.size()+"\n\n"));
    document.add(new Paragraph("No of repairs reported for Pick up in Trasport Devision:"+Pickuprepair.size()+"\n\n"));
    
    
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
    document.add(new Paragraph("Maximum no of repairs reported:\n\n"));
    ArrayList max=(ArrayList)maxnorepair.get(0);
    document.add(new Paragraph("                      Type :"+max.get(0)+"\n"));
    document.add(new Paragraph("                      No of Repairs Reported :"+max.get(1)+"\n"));
    document.add(new Paragraph("                      Average cost :"+max.get(2)+"\n\n"));
// Display List of luxury cars 
    
    
    document.add(new Paragraph("Remarks:\n\n"));
    document.add(new Paragraph(max.get(0)+"Type of vehicles should be maintained well.Because No of maximum repairs occured in this type o vehile. So necessary actions to be taken by management to increase the maintainance of this type of vehicle\n\n"));
    document.add(new Paragraph("List Of repairs reported "+"\n\n"));
    
    
    PdfPTable table = new PdfPTable(3);
            PdfPCell cell;
        cell = new PdfPCell(new Phrase("Vehicle Type"));
        cell.setUseVariableBorders(true);
        cell.setBorderColor(Color.black);
        cell.setBackgroundColor(Color.lightGray);
        table.addCell(cell);
        cell = new PdfPCell(new Phrase("No of repairs"));
        cell.setUseVariableBorders(true);
        cell.setBorderColor(Color.black);
        cell.setBackgroundColor(Color.lightGray);
        table.addCell(cell);
        cell = new PdfPCell(new Phrase("Average Cost"));
        cell.setUseVariableBorders(true);
        cell.setBorderColor(Color.black);
        cell.setBackgroundColor(Color.lightGray);
            table.addCell(cell);
             
int count =0;
for(int i=0;i<maxnorepair.size();i++){
count=count+1;
ArrayList one=(ArrayList)maxnorepair.get(i);
 
             
            table.addCell((String)one.get(0));
            table.addCell((String)one.get(1));
            table.addCell(String.valueOf(one.get(2)));
           
            
        // fetch & writing records in pdf files
       
        //document.add(new Paragraph((String)one.get(1)+"             "+(String)one.get(2)+"             "+one.get(7)+"\n\n"));
}
 document.add(table);
 

 //document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
  
 
 
    //document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
    
    document.close(); //document instance closed
      //db connection close


       



%>