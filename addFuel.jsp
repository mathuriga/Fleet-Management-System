<%@ page import="java.sql.*,java.util.*,net.vehicle.VehicleCommon"%>
<%
ArrayList al=VehicleCommon.getDrivers();
ArrayList al1=VehicleCommon.getVehicles();
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

<form id="form1" name="form1" method="post" action="do?MOD=MTN&ACT=AddFuel">
  <table width="80%" border="0" align="center">
    <tr>
      <th colspan="5" scope="col"><div class="header">
        <div align="left">Add Fuel Expences Details </div>
      </div></th>
    </tr>
    <tr>
      <td width="15%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
      <td width="3%">&nbsp;</td>
      <td width="38%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Vehicle Name  </td>
      <td>:</td>
      <td><label>
        <select name="VehicleName">
		<%
		for(int i=0;i<al1.size();i++){
		%>
		<option value="<%=(String)al1.get(i)%>"><%=(String)al1.get(i)%></option>
		<% } %>
		</select>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Driver Name  </td>
      <td>:</td>
      <td><label>
        <select name="DriverName">
		<%
		for(int i=0;i<al.size();i++){
		%>
		<option value="<%=(String)al.get(i)%>"><%=(String)al.get(i)%></option>
		<% } %>
		</select>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Fuel Date </td>
      <td>:</td>
      <td><label>
        <input name="fdate" type="text" id="fdate"  readonly="true"/>
      <a href="javascript: void(0);" onmouseover="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onmouseout="if (timeoutDelay) calendarTimeout();window.status='';" onclick="g_Calendar.show(event,'form1.fdate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" alt="" name="imgCalendar" width="34" height="21" border="0" id="imgCalendar"></a></label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Fuel Type </td>
      <td>:</td>
      <td><label>
        <select name="ftype">
          <option value="Pertol">&nbsp;Pertol&nbsp;</option>
          <option value="Diesel">&nbsp;Diesel&nbsp;</option>
          <option value="Gas">&nbsp;Gas&nbsp;</option>
          <option value="Hybrid">&nbsp;Hybrid&nbsp;</option>
          <option value="Electricity">&nbsp;Electricity&nbsp;</option>
        </select>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Fuel Quantity</td>
      <td>:</td>
      <td><label>
        <input name="Quantity" type="text" id="Quantity" size="10" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Total Cost . </td>
      <td>:</td>
      <td><label>
        <input name="Cost" type="text" id="Cost" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Note</td>
      <td>:</td>
      <td><label>
        <textarea name="Note" cols="30" rows="5" id="Note"></textarea>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <div align="right">
          <input type="reset" name="Submit2" value="Reset"  class="redButton"/>
          </div>
      </label></td>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="redButton" onclick="MM_validateForm('VehicleName','','R','DriverName','','R','Quantity','','R','Cost','','R');return document.MM_returnValue" value="Add Fuel Details" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<hr width="600px" style="background:#D22929; border:#D22929 solid 2px;"/>