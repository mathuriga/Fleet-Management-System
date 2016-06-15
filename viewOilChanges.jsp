<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
ArrayList all = VehicleCommon.viewAllOilChanges();
int size = all.size();
%>
<style type="text/css">
<!--
.style10 {color: #EED9A8; font-weight: bold; font-size: 14px; }
.style11 {color: #E49C7C}
-->
</style>
<script>
function deleteOil(id){
	if(confirm('Want to Delete this Vehicle Oil Details?')){
		window.location.href = 'do?MOD=MTN&ACT=oDel&oid='+id;
	}//if
}//delete
</script>

<div class="header">View All Oil Change Details </div>
<br/>
<h3>To add Details - <a href="do?MOD=MTN&ACT=OilAdd">Click Here.</a></h3>
<br/>
<table width="95%" align="center"  style="border:#000080 solid 2px;padding:10px;" border="0">
  <tr>
    <th bgcolor="#000080" scope="col"><span class="style10">Vehicle Name </span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Driver Name </span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Date</span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Cost </span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Oil Type</span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Odometer&nbsp;&nbsp;</span></th>
    <th bgcolor="#000080" scope="col"><span class="style10">Ation</span></th>
  </tr>

<%
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
<tr style="height:30px; padding:4px;">
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    <td><div align="center"><%=(String)one.get(4)%>&nbsp;Rs.</div></td>
    <td><div align="center"><%=(String)one.get(5)%>&nbsp;</div></td>
    <td><div align="center"><%=(String)one.get(6)%>Rs.</div></td>
    <td><div align="center"><a href="javascript:deleteOil(<%=(String)one.get(0)%>)">Delete</a></div></td>
</tr>
<% } %>
</table>
