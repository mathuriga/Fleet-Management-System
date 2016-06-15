<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<% 
int vid = Integer.parseInt((String)session.getAttribute("vid"));
//out.println("<h3>Vehicle ID :"+vid);
ArrayList all = VehicleCommon.viewVehiclesByID(vid);
ArrayList al=VehicleCommon.getDrivers();
int size = all.size();
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>

<div class="header">Vehicle Edit </div>
<h3>Following are the Vehicle Details.You can Edit the Details </h3>
<br/>
<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=doBok">
  <table width="90%" align="center" style="border:#D22929 solid 2px;padding:5px;" border="0" >
    <tr>
      <th colspan="3" scope="col"><div class="header">
          <div align="left">&nbsp;&nbsp;<%=(String)one.get(1)%></div>
      </div></th>
    </tr>
    <tr>
      <td><strong>Number : </strong>&nbsp;<%=(String)one.get(2)%></td>
      <td><strong>Rupees Per Kilometer : </strong><%=(String)one.get(6)%></td>
      <td width="21%" rowspan="9"><img src="<%=(String)one.get(8)%>" width="220" height="120" /></td>
    </tr>
    <tr>
      <td colspan="2"><strong>Make</strong> : <%=(String)one.get(3)%></td>
    </tr>
    <tr>
      <td width="36%"><strong>Fuel Type:</strong> <%=(String)one.get(4)%></td>
      <td width="43%"><strong>Cost : </strong><%=one.get(7)%>&nbsp;Rs.</td>
    </tr>
    <tr>
      <td colspan="2"><strong>Vehicle Type: </strong><%=one.get(9)%></td>
    </tr>
    <tr>
      <td><strong>Insurer :</strong> <%=one.get(10)%></td>
      <td><strong>Company :</strong> <%=one.get(11)%></td>
    </tr>
    <tr>
      <td colspan="2"><hr width="400px"  align="left" style="border:#990000 solid 2px;"/></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center"><a href="#"><strong>Edit Vehicle  Details</strong> </a></div></td>
    </tr>
    <tr>
      <td colspan="2"><input type="hidden" name="v_name" value="<%=(String)one.get(1)%>" /></td>
    </tr>
    <tr>
      <td colspan="2"></td>
    </tr>
    <tr>
      <td colspan="2"><strong>Journey Start Date :</strong> 
        <label>
        <input name="sdate" type="text" id="sdate" size="20"  readonly="true"/>
      <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.sdate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a></label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><strong>Journey End Date:</strong>&nbsp;&nbsp;&nbsp; 
        <label>
        <input name="edate" type="text" id="edate" size="20"  readonly="true"/>
      <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.edate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a></label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3"><label><strong>Number of Days:</strong>
          <input name="NoOfDays" type="text" id="NoOfDays" size="5" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Journey In KiloMeters :</strong>
<input name="KiloMeters" type="text" id="KiloMeters" size="5" /> 
Km
</label></td>
    </tr>
    <tr>
      <td colspan="2"><strong>Number Of Seats :</strong>&nbsp;&nbsp;&nbsp;
        <label>
        <input name="NoOfSeats" type="text" id="NoOfSeats" size="8" />
        </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><label>
        <div align="right">
          <input type="reset" name="Submit2" value="Reset"   class="redButton"/>
          </div>
      </label></td>
      <td><label>
        <input name="Submit" type="submit"  class="redButton" onclick="MM_validateForm('NoOfDays','','RisNum','KiloMeters','','RisNum','NoOfSeats','','RisNum');return document.MM_returnValue" value=" Book This Vehicle "/>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<br/>
<% } %>
<br/>
