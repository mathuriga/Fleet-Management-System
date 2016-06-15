
 
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
ArrayList all = VehicleCommon.viewAllVehicles();

ArrayList luxury=VehicleCommon.viewVehiclesByType("Luxury Cars");

ArrayList Minivans=VehicleCommon.viewVehiclesByType("Mini Vans & Large Coaches");

ArrayList Pickup=VehicleCommon.viewVehiclesByType("Pick up");

ArrayList execar=VehicleCommon.viewVehiclesByType("Executive Cars");

ArrayList ecocar=VehicleCommon.viewVehiclesByType("Economy Cars");
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
    document.addTitle("Monthly Summary Report of Vechile Management devision ");
    document.addCreationDate();
    document.addHeader("Vechile Devision", "FMS");
       
    Chunk c;
    
    c = new Chunk("                                                                                                                                               \n\n");
    
    c.setUnderline(new Color(0x00, 0x00, 0xFF), 0.0f, 0.3f, 0.0f, 0.4f, PdfContentByte.LINE_CAP_ROUND);
    /* new paragraph instance initialized and add function write in pdf file*/
   document.add(c);
    document.add(new Paragraph("                                                                 REPORT\n\n"));
    //document.add(c);
    document.add(new Paragraph("                                      CREATED REPORT For FLeet Management System\n\n"));
    document.add(new Paragraph("                                                  Vehicle Management Devision\n\n"));
    //document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
   document.add(c);
    document.add(new Paragraph("                                                         Overall Summary\n\n"));            
    
    document.add(new Paragraph("No of Vehicles in Trasport Devision :"+size+"\n\n"));
    document.add(new Paragraph("No of Luxury Cars in Trasport Devision :"+luxury.size()+"\n\n"));
    document.add(new Paragraph("No of Executive Cars in Trasport Devision :"+execar.size()+"\n\n"));
    document.add(new Paragraph("No of Economic Cars in Trasport Devision:"+ecocar.size()+"\n\n"));
    document.add(new Paragraph("No of Minivans & Large Coaches in Trasport Devision:"+Minivans.size()+"\n\n"));
    document.add(new Paragraph("No of Pick up in Trasport Devision:"+Pickup.size()+"\n\n"));
    
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
    // Display List of luxury cars 
    
    document.add(new Paragraph("List Of Luxuy Cars"+"\n\n"));
     
    PdfPTable table = new PdfPTable(3);
            PdfPCell cell;
        cell = new PdfPCell(new Phrase("Vehicle Name"));
        cell.setUseVariableBorders(true);
        cell.setBorderColor(Color.black);
        cell.setBackgroundColor(Color.lightGray);
        table.addCell(cell);
        cell = new PdfPCell(new Phrase("Vehicle Number"));
        cell.setUseVariableBorders(true);
        cell.setBorderColor(Color.black);
        cell.setBackgroundColor(Color.lightGray);
        table.addCell(cell);
        cell = new PdfPCell(new Phrase("Cost"));
        cell.setUseVariableBorders(true);
        cell.setBorderColor(Color.black);
        cell.setBackgroundColor(Color.lightGray);
            table.addCell(cell);
             
int count =0;
for(int i=0;i<luxury.size();i++){
count=count+1;
ArrayList one=(ArrayList)luxury.get(i);
 
             
            table.addCell((String)one.get(1));
            table.addCell((String)one.get(2));
            table.addCell(String.valueOf(one.get(7)));
           
            
        // fetch & writing records in pdf files
       
        //document.add(new Paragraph((String)one.get(1)+"             "+(String)one.get(2)+"             "+one.get(7)+"\n\n"));
}
 document.add(table);
 
 
 document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
    // Display List of Executive Cars
    
    document.add(new Paragraph("List Of Executive Cars"+"\n\n"));
     
    PdfPTable table2 = new PdfPTable(3);
        PdfPCell cell2;
        cell2 = new PdfPCell(new Phrase("Vehicle Name"));
        cell2.setUseVariableBorders(true);
        cell2.setBorderColor(Color.black);
        cell2.setBackgroundColor(Color.lightGray);
        table2.addCell(cell2);
        cell2 = new PdfPCell(new Phrase("Vehicle Number"));
        cell2.setUseVariableBorders(true);
        cell2.setBorderColor(Color.black);
        cell2.setBackgroundColor(Color.lightGray);
        table2.addCell(cell2);
        cell2 = new PdfPCell(new Phrase("Cost"));
        cell2.setUseVariableBorders(true);
        cell2.setBorderColor(Color.black);
        cell2.setBackgroundColor(Color.lightGray);
            table2.addCell(cell2);
             
int countx =0;
for(int i=0;i<execar.size();i++){
countx=countx+1;
ArrayList two=(ArrayList)execar.get(i);
 
             
            table2.addCell((String)two.get(1));
            table2.addCell((String)two.get(2));
            table2.addCell(String.valueOf(two.get(7)));
           
            
        // fetch & writing records in pdf files
       
        //document.add(new Paragraph((String)one.get(1)+"             "+(String)one.get(2)+"             "+one.get(7)+"\n\n"));
}
 document.add(table2);
 
   document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
    // Display List of Economic Cars
    
    document.add(new Paragraph("List Of Economic Cars"+"\n\n"));
     
    PdfPTable table3 = new PdfPTable(3);
        PdfPCell cell3;
        cell3 = new PdfPCell(new Phrase("Vehicle Name"));
        cell3.setUseVariableBorders(true);
        cell3.setBorderColor(Color.black);
        cell3.setBackgroundColor(Color.lightGray);
        table3.addCell(cell3);
        cell3 = new PdfPCell(new Phrase("Vehicle Number"));
        cell3.setUseVariableBorders(true);
        cell3.setBorderColor(Color.black);
        cell3.setBackgroundColor(Color.lightGray);
        table3.addCell(cell3);
        cell3 = new PdfPCell(new Phrase("Cost"));
        cell3.setUseVariableBorders(true);
        cell3.setBorderColor(Color.black);
        cell3.setBackgroundColor(Color.lightGray);
            table3.addCell(cell3);
             
int county =0;
for(int i=0;i<ecocar.size();i++){
countx=county+1;
ArrayList one=(ArrayList)ecocar.get(i);
 
             
            table3.addCell((String)one.get(1));
            table3.addCell((String)one.get(2));
            table3.addCell(String.valueOf(one.get(7)));
           
            
        // fetch & writing records in pdf files
       
        //document.add(new Paragraph((String)one.get(1)+"             "+(String)one.get(2)+"             "+one.get(7)+"\n\n"));
}
 document.add(table3);
 
 document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
    // Display List of Pick up
    
    document.add(new Paragraph("List Of Pick up"+"\n\n"));
     
    PdfPTable table4 = new PdfPTable(3);
        PdfPCell cell4;
        cell4 = new PdfPCell(new Phrase("Vehicle Name"));
        cell4.setUseVariableBorders(true);
        cell4.setBorderColor(Color.black);
        cell4.setBackgroundColor(Color.lightGray);
        table4.addCell(cell4);
        cell4 = new PdfPCell(new Phrase("Vehicle Number"));
        cell4.setUseVariableBorders(true);
        cell4.setBorderColor(Color.black);
        cell4.setBackgroundColor(Color.lightGray);
        table4.addCell(cell4);
        cell4 = new PdfPCell(new Phrase("Cost"));
        cell4.setUseVariableBorders(true);
        cell4.setBorderColor(Color.black);
        cell4.setBackgroundColor(Color.lightGray);
            table4.addCell(cell4);
             
int countz =0;
for(int i=0;i<Pickup.size();i++){
countx=county+1;
ArrayList one=(ArrayList)Pickup.get(i);
 
             
            table4.addCell((String)one.get(1));
            table4.addCell((String)one.get(2));
            table4.addCell(String.valueOf(one.get(7)));
           
            
        // fetch & writing records in pdf files
       
        //document.add(new Paragraph((String)one.get(1)+"             "+(String)one.get(2)+"             "+one.get(7)+"\n\n"));
}
 document.add(table4);
 
 document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
    // Display List of Minivans & Large Coaches
    
    document.add(new Paragraph("List Of Minivans & Large Coaches"+"\n\n"));
     
    PdfPTable table5 = new PdfPTable(3);
        PdfPCell cell5;
        cell5 = new PdfPCell(new Phrase("Vehicle Name"));
        cell5.setUseVariableBorders(true);
        cell5.setBorderColor(Color.black);
        cell5.setBackgroundColor(Color.lightGray);
        table5.addCell(cell5);
        cell5 = new PdfPCell(new Phrase("Vehicle Number"));
        cell5.setUseVariableBorders(true);
        cell5.setBorderColor(Color.black);
        cell5.setBackgroundColor(Color.lightGray);
        table5.addCell(cell5);
        cell5 = new PdfPCell(new Phrase("Cost"));
        cell5.setUseVariableBorders(true);
        cell5.setBorderColor(Color.black);
        cell5.setBackgroundColor(Color.lightGray);
            table5.addCell(cell5);
             
int countzp =0;
for(int i=0;i<Minivans.size();i++){
countx=county+1;
ArrayList one=(ArrayList)Minivans.get(i);
 
             
            table5.addCell((String)one.get(1));
            table5.addCell((String)one.get(2));
            table5.addCell(String.valueOf(one.get(7)));
           
            
        // fetch & writing records in pdf files
       
        //document.add(new Paragraph((String)one.get(1)+"             "+(String)one.get(2)+"             "+one.get(7)+"\n\n"));
}
 document.add(table5);
 
 
 
    //document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
    
    document.close(); //document instance closed
      //db connection close


       



%>