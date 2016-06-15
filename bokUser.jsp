<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
int id = Integer.parseInt((String)session.getAttribute("u_id"));
ArrayList all = VehicleCommon.viewBookingByID(id);
int size = all.size();

%>																			 
<style type="text/css">
<!--
.style10 {color: #EED9A8; font-weight: bold; font-size: 14px; }
-->
</style>

<div class="header">View Your Booking Status</div>
<h3>View Your Previous Booking status Here.<br/>If you want to book a vehicle then please <a href="do?MOD=BOK&ACT=View&v=lux">click here</a></h3>
<br/>
<table width="95%" align="center"  style="border:#D22929 solid 2px;padding:10px;" border="0">
  <tr>
    <th bgcolor="#D22929" scope="col"><span class="style10">Vehicle Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Driver Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Start Date</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">End Date </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Kilometer</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Status&nbsp;&nbsp;</span></th>
  </tr>
  <%
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
  <tr style="height:30px; padding:4px;">
    <td><div align="center"><%=(String)one.get(0)%></div></td>
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    <td><div align="center"><%=(String)one.get(4)%>&nbsp;Km.</div></td>
    <td><div align="center"><%=(String)one.get(5)%></div></td>
  </tr>
  <% } %>
</table>
