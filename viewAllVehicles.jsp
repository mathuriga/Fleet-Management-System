<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
ArrayList all = VehicleCommon.viewAllVehicles();
int size = all.size();
%>
<script>
function deleteVehicle(id){
	if(confirm('Want to Delete this Vehicle Details?')){
		window.location.href = 'do?MOD=MTN&ACT=vDel&vid='+id;
	}
}
</script>
<div class="header">View All Vehicle Details </div><br/>
<h3>To add Vehicle - <a href="do?MOD=MTN&ACT=VclAdd">Click Here.</a></h3><br/>

<%
int count =0;
for(int i=0;i<size;i++){
count=count+1;
ArrayList one=(ArrayList)all.get(i);
%>

<table width="90%" align="center" style="border:#000080 solid 2px;padding:5px;" border="0" >
  <tr>
    <th colspan="3" scope="col"><div class="header"> 
      <div align="left">&nbsp;<%=count%>)&nbsp;<%=(String)one.get(1)%></div>
    </div></th>
  </tr>
  <tr>
    <td colspan="2"><strong>Number : </strong>&nbsp;<%=(String)one.get(2)%></td>
    <td width="21%" rowspan="6"><img src="<%=(String)one.get(8)%>" width="220" height="120" /></td>
  </tr>
  <tr>
    <td colspan="2"><strong>Make</strong> : <%=(String)one.get(3)%></td>
  </tr>
  <tr>
    <td><strong>Fuel Type:</strong> <%=(String)one.get(4)%></td>
    
  </tr>
  <tr>
    <td colspan="2"><strong>Vehicle Type: </strong><%=one.get(9)%></td>
  </tr>
  <tr>
    <td><strong>Insurer :</strong> <%=one.get(10)%></td>
    
  </tr>
  <tr>
    <td><strong>Insurance Company :</strong> <%=one.get(11)%></td>
  </tr>
  <tr>
    <td width="36%"><strong>Driver Name :</strong> <%=(String)one.get(12)%></td>
    <td width="43%">&nbsp;</td>
  </tr>
  <tr>
    <td width="36%"><strong>Availability of vehicle : </strong> <%=(String)one.get(13)%></td>
    <td width="43%">&nbsp;</td>
  </tr>
  <tr>
    <td>
    <div align="center"><a href="do?MOD=MTN&ACT=editVehicle&vId=<%=(String)one.get(0)%>">Edit Vehicle</a> </div></td>
    <td>&nbsp;&nbsp;&nbsp;<a href="javascript:deleteVehicle(<%=(String)one.get(0)%>)">Delete Vehicle</a></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br/>
<% } %>
