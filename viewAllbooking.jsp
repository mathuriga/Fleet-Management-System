<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
ArrayList all = VehicleCommon.viewAllBooking();
ArrayList drivers=VehicleCommon.getDrivers();
int size = all.size();
%>																			 
<style type="text/css">
<!--
.style10 {color: #EED9A8; font-weight: bold; font-size: 14px; }
-->
</style>
<script>
function bookAction(act){
	with (window.document.bookingForm) {
		if(confirm('Do You want to '+act+' this Request ?')){
			submit();
		}
	}
}
</script>
<div class="header">View All Booking Request</div>
<br/>
<table width="95%" align="center"  style="border:#000080 solid 2px;padding:10px;" border="0">
  <tr>
    <th bgcolor="#000080" scope="col"><span class="style10">User ID </span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Vehicle No </span></th>
   
    
    <th bgcolor="#000080" scope="col"><span class="style10">Start Date</span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">End Date </span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Kilometer</span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Check</span></th>
     <th bgcolor="#000080" scope="col"><span class="style10">Driver Name </span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Status&nbsp;</span></th>
    
        <th bgcolor="#000080" scope="col"><span class="style10">Add To Calender</span></th>
        <th bgcolor="#000080" scope="col"><span class="style10">Submit</span></th>
  </tr>
  <%
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
<form name="bookingForm" id="bookingForm" action="do?MOD=MTN&ACT=bookAction" method="post">
    <td colspan="2"><input type="hidden" name="v_no" value="<%=(String)one.get(3)%>" /></td>
  <tr style="height:30px; padding:4px;">
    <td>
	<input type="hidden" name="bid" value="<%=(String)one.get(0)%>" />
        <div align="center"><%=(String)one.get(0)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    
    <td><div align="center"><%=(String)one.get(5)%></div></td>
 
    <td><div align="center"><%=(String)one.get(6)%></div></td>
    <td><div align="center"><%=(String)one.get(8)%>&nbsp;Km.</div></td>
       <td><div align="center"><a href="checkavailabilityroute.jsp">Check</a></div></td>
       
      
    
       <td><div align="center"><select name="driver" >
    <%
		for(int j=0;j<drivers.size();j++){
		%>
		<option value="<%=(String)drivers.get(j)%>"><%=(String)drivers.get(j)%></option>
		<% } %></select></div></td>
    
    <td><div align="center"><select name="action" >
	<option value="Pending">Pending</option>
	<option value="Approved">Approved</option>
	<option value="Rejected">Rejected</option>
	</select></div></td>
        <td><div align="center"><a href=https://calendar.google.com/calendar/embed?src=mbftfgntgj7m6saptf79s46130%40group.calendar.google.com&ctz=Asia/Colombo>Go to Calender</a></div></td>
	
        
        <td><div align="center"><input type="submit" value=" Go " /></div></td>
        
  </tr>
  
</form>
  
  <% } %>
</table>
