<%-- 
    Document   : driveravailability
    Created on : 15-Jun-2016, 13:05:11
    Author     : Mathu
--%>

<%@page import="net.vehicle.VehicleCommon"%>
<%@page import="java.util.ArrayList"%>
 
  
  <style type="text/css">
<!--
.style10 {color: #EED9A8; font-weight: bold; font-size: 14px; }
-->
</style>
  
 <%
ArrayList all = VehicleCommon.getavaiAllDrivers();
int size = all.size();
%>
 
<!--
.style10 {color: #EED9A8; font-weight: bold; font-size: 14px; }
.style11 {color: #E49C7C}
-->
</style>


<tr>
    <th colspan="2" scope="col"><h2>You can check availability of Driver before approve the bookings&nbsp;</h2></th>
  </tr>
<table width="95%" align="center"  style="border:#000080 solid 2px;padding:10px;" border="0">
  <tr>
    
    <th bgcolor="#000080" scope="col"><span class="style10">Vehicle Name </span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Mobile No</span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Mail Address</span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">note</span></th>
   <th bgcolor="#000080" scope="col"><span class="style10">Availability</span></th>
  </tr>

<%
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
<tr style="height:30px; padding:4px;">
    
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%>&nbsp;</div></td>
    <td><div align="center"><%=(String)one.get(4)%>&nbsp;</div></td>
     <td><div align="center"><%=(String)one.get(5)%>&nbsp;</div></td>
    
</tr>
<% } %>
</table>


 