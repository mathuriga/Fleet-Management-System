<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
String view = (String)session.getAttribute("view");
session.removeAttribute("view");
String type="";
if(view.equals("lux")) {
	type="Luxury Cars";
}else if(view.equals("mini")){
	type="Mini Vans & Large Coaches";
}else if(view.equals("muv")){
	type="Pick up";
}else if(view.equals("eco")){
	type="Economy Cars";
}else if(view.equals("exe")){
	type="Executive Cars";
}
//out.println("Type:"+type);
//out.println("View:"+view);
ArrayList all = VehicleCommon.viewVehiclesByType(type);
int size = all.size();
%>
<script>
function bookThisVehicle(id){
	if(confirm('Want to Book this Vehicle ?')){
		window.location.href = 'do?MOD=BOK&ACT=bok&vid='+id;
		//alert('do?MOD=BOK&ACT=bok&vid='+id);
	}
}
</script>
<%
int count =0;
for(int i=0;i<size;i++){
count=count+1;
ArrayList one=(ArrayList)all.get(i);
%>

<table width="90%" align="center" style="border:#D22929 solid 2px;padding:5px;" border="0" >
  <tr>
    <th colspan="3" scope="col"><div class="header"> 
      <div align="left">&nbsp;<%=count%>)&nbsp;<%=(String)one.get(1)%></div>
    </div></th>
  </tr>
  <tr>
    <td><strong>Number : </strong>&nbsp;<%=(String)one.get(2)%></td>
    <td>&nbsp;</td>
    <td width="21%" rowspan="6"><img src="<%=(String)one.get(8)%>" width="220" height="120" /></td>
  </tr>
  <tr>
    <td colspan="2"><strong>Make</strong> : <%=(String)one.get(3)%></td>
  </tr>
  <tr>
    <td><strong>Fuel Type:</strong> <%=(String)one.get(4)%></td>
    <td><strong>Cost : </strong><%=one.get(7)%>&nbsp;Rs.</td>
  </tr>
  <tr>
    <td colspan="2"><strong>Vehicle Type: </strong><%=one.get(9)%></td>
  </tr>
  <tr>
    <td><strong>Insurer :</strong> <%=one.get(10)%></td>
    <td><strong>Company :</strong> <%=one.get(11)%></td>
  </tr>
  <tr>
    <td width="36%"><strong>Rupees Per Kilometer  :</strong> <%=one.get(5)%></td>
    <td width="43%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;</td>
    <td>&nbsp;&nbsp;&nbsp;<a href="javascript:bookThisVehicle(<%=(String)one.get(0)%>)">Book Vehicle</a></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br/>
<% } %>
